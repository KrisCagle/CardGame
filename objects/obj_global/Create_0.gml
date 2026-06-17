// Only initialize once — if a persistent copy already exists, destroy this duplicate
if (instance_number(obj_global) > 1) {
    instance_destroy();
    exit;
}

// Player stats
player_hp     = 75;
player_hp_max = 75;
experience    = 0;
gold          = 0;
relics        = [];

// Tracks permanently defeated trainers/chests by a "room_x_y" key
defeated_enemies = [];

// Set before entering rm_combat — obj_game reads this to know who it's fighting
current_enemy  = noone;
encounter_type = "wild";

// Rooms to return to after combat or leaving a building
return_room   = rm_overworld; // after combat
building_room = rm_overworld; // after leaving a building interior

// Item inventory and world state flags
items             = [];
tried_blackwood   = false;
blackwood_cleared = false;
player_locked     = false;

function has_item(_name) {
    for (var _i = 0; _i < array_length(items); _i++) {
        if (items[_i] == _name) return true;
    }
    return false;
}

// Boss progression
boss_defeated = false;

// Card constructor — includes level, XP, element, and status effect
function Card(_name, _cost, _type, _value, _element = "physical", _status_effect = "", _status_value = 0) constructor {
    name          = _name;
    cost          = _cost;
    type          = _type;
    value         = _value;
    base_value    = _value;
    level         = 1;
    card_xp       = 0;
    element       = _element;
    status_effect = _status_effect;
    status_value  = _status_value;
}

// Element matchup: the key element beats the value element
element_beats = {
    fire:     "nature",
    nature:   "stone",
    stone:    "ice",
    ice:      "shadow",
    shadow:   "arcane",
    arcane:   "fire",
    physical: ""
};

// XP needed to reach each level (index = level - 1)
card_level_thresholds = [0, 3, 8]; // lv1=0, lv2=3xp, lv3=8xp

// Value bonus per level above 1, by type
function card_level_bonus(_type, _levels_gained) {
    if (_type == "attack") return _levels_gained * 4;
    if (_type == "defend") return _levels_gained * 3;
    if (_type == "both")   return _levels_gained * 2;
    return 0;
}

// Starter deck
deck = [
    new Card("Strike",       1, "attack", 6),
    new Card("Strike",       1, "attack", 6),
    new Card("Strike",       1, "attack", 6),
    new Card("Defend",       1, "defend", 5),
    new Card("Defend",       1, "defend", 5),
    new Card("Defend",       1, "defend", 5),
    new Card("Heavy Strike", 2, "attack", 14),
    new Card("Iron Wave",    1, "both",   4),
];

// Wild card reward pool
// Elements: physical (neutral), fire, ice, nature, stone, shadow, arcane
// Status effects — fire:burn, ice:freeze, nature:poison, shadow:weaken
card_pool = [
    // --- Physical (neutral, no element bonus) ---
    new Card("Strike",       1, "attack", 6),
    new Card("Heavy Strike", 2, "attack", 14),
    new Card("Quick Slash",  1, "attack", 4),
    new Card("Defend",       1, "defend", 5),
    new Card("Iron Wave",    1, "both",   4),
    new Card("Dual Strike",  2, "attack", 8),
    new Card("Shield Bash",  2, "both",   7),
    new Card("Duel Strike",  2, "attack", 16),
    new Card("Bulwark",      2, "defend", 14),
    // --- Stone (beats ice) ---
    new Card("Bash",         2, "attack", 10,  "stone"),
    new Card("Fortify",      2, "defend", 12,  "stone"),
    new Card("Rockfall",     2, "attack", 18,  "stone"),
    new Card("Iron Vein",    1, "defend",  9,  "stone"),
    new Card("Stone Crush",  2, "attack", 16,  "stone"),
    // --- Nature (beats stone) ---
    new Card("Bog Trap",     2, "both",    9,  "nature", "poison", 3),
    new Card("Mire Sludge",  1, "attack",  7,  "nature", "poison", 2),
    new Card("Thorn Whip",   1, "attack",  8,  "nature", "poison", 1),
    new Card("Root Snare",   2, "both",    8,  "nature", "poison", 2),
    // --- Ice (beats shadow) ---
    new Card("Frost Strike", 2, "attack", 13,  "ice",    "freeze", 1),
    new Card("Ice Wall",     1, "defend", 10,  "ice"),
    new Card("Tidal Crash",  2, "attack", 18,  "ice"),
    new Card("Frost Shard",  1, "attack",  7,  "ice",    "freeze", 1),
    new Card("Sea Foam",     1, "defend",  8,  "ice"),
    new Card("Undertow",     1, "both",    6,  "ice"),
    // --- Fire (beats nature) ---
    new Card("Cinder Blast", 2, "attack", 14,  "fire",   "burn",   4),
    new Card("Heat Shield",  2, "defend", 13,  "fire"),
    new Card("Char",         1, "attack",  8,  "fire",   "burn",   2),
    new Card("Ember Wave",   2, "both",    9,  "fire",   "burn",   2),
    // --- Shadow (beats arcane) ---
    new Card("Void Strike",  2, "attack", 14,  "shadow", "weaken", 1),
    new Card("Shadow Bolt",  1, "attack",  8,  "shadow", "weaken", 1),
    new Card("Dark Veil",    2, "defend", 12,  "shadow"),
    // --- Arcane (beats fire) ---
    new Card("Rune Blast",   2, "attack", 16,  "arcane"),
    new Card("Ancient Ward", 2, "defend", 15,  "arcane"),
    new Card("Arcane Bolt",  1, "attack",  8,  "arcane"),
];

// Enemy type definitions
function EnemyType(_name, _hp, _intent_pool, _gold, _relic, _element = "physical") constructor {
    name        = _name;
    hp          = _hp;
    intent_pool = _intent_pool;
    gold        = _gold;
    relic       = _relic;
    element     = _element;
}

function Intent(_type, _value) constructor {
    type  = _type;
    value = _value;
}

// Element ring: fire>nature>stone>ice>shadow>arcane>fire
// Status intents: "burn" N  "freeze" 0  "poison" N  "weaken" 0
enemy_types = {
    // Physical enemies (early game — teaches damage/block basics)
    slime:          new EnemyType("Slime",             30,  [new Intent("attack",5),  new Intent("attack",7)],                              5,  "",               "physical"),
    grunt:          new EnemyType("Grunt",             45,  [new Intent("attack",7),  new Intent("attack",9),  new Intent("block",5)],      10, "",               "physical"),
    brute:          new EnemyType("Brute",             65,  [new Intent("attack",12), new Intent("block",8),   new Intent("attack",10)],    20, "Iron Shield",    "physical"),
    rogue:          new EnemyType("Rogue",             35,  [new Intent("attack",5),  new Intent("attack",9),  new Intent("attack",6)],     15, "Shadow Step",    "shadow"),
    ranger:         new EnemyType("Forest Ranger",     50,  [new Intent("attack",8),  new Intent("block",6),   new Intent("attack",6)],     18, "",               "nature"),
    highway_bandit: new EnemyType("Highway Bandit",    48,  [new Intent("attack",10), new Intent("attack",8),  new Intent("attack",13)],    15, "",               "physical"),
    duelist:        new EnemyType("Duelist",           58,  [new Intent("attack",9),  new Intent("block",10),  new Intent("attack",14), new Intent("block",8)], 18, "", "physical"),
    // Bosses — physical
    thornlord:      new EnemyType("Baron Ashveil",    120,  [new Intent("attack",15), new Intent("block",12),  new Intent("attack",20), new Intent("poison",3), new Intent("attack",12)], 50, "Thornwood Crown", "nature"),
    guildmaster:    new EnemyType("Guildmaster Varek",160,  [new Intent("attack",16), new Intent("block",18),  new Intent("attack",20), new Intent("weaken",0), new Intent("block",12), new Intent("attack",22)], 65, "Crestfall Sigil", "physical"),
    // Water/coast
    drowned:        new EnemyType("Drowned Captain",  110,  [new Intent("attack",10), new Intent("block",8),   new Intent("attack",16), new Intent("freeze",0), new Intent("block",14)], 45, "Tidal Amulet",   "ice"),
    mariner:        new EnemyType("Mariner",           50,  [new Intent("attack",8),  new Intent("block",6),   new Intent("attack",11)],    12, "",               "ice"),
    cutthroat:      new EnemyType("Cutthroat",         42,  [new Intent("attack",10), new Intent("attack",7),  new Intent("attack",13)],    14, "",               "shadow"),
    // Cave/mine — shadow
    cave_bat:       new EnemyType("Cave Bat",          28,  [new Intent("attack",4),  new Intent("attack",6),  new Intent("attack",4)],      7, "",               "shadow"),
    deep_crawler:   new EnemyType("Deep Crawler",      38,  [new Intent("attack",6),  new Intent("block",5),   new Intent("attack",9)],     10, "",               "shadow"),
    stone_warden:   new EnemyType("Stone Warden",     140,  [new Intent("attack",14), new Intent("block",16),  new Intent("attack",18), new Intent("attack",12), new Intent("block",10)], 55, "Stone Skin", "stone"),
    // Bog/swamp — nature (with Poison status)
    bog_lurker:     new EnemyType("Bog Lurker",        55,  [new Intent("attack",9),  new Intent("poison",2),  new Intent("attack",12), new Intent("block",7)],  14, "", "nature"),
    rot_sprite:     new EnemyType("Rot Sprite",        30,  [new Intent("attack",5),  new Intent("poison",1),  new Intent("attack",7)],      8, "",               "nature"),
    plague_wraith:  new EnemyType("Plague Wraith",    130,  [new Intent("poison",4),  new Intent("attack",14), new Intent("block",10),  new Intent("attack",18), new Intent("poison",3)], 55, "Marsh Lantern", "shadow"),
    // Highland/road — physical
    mountain_troll: new EnemyType("Mountain Troll",    80,  [new Intent("attack",16), new Intent("block",14),  new Intent("attack",20)],    22, "",               "stone"),
    // Ice/frost — ice (with Freeze status)
    frost_wolf:     new EnemyType("Frost Wolf",        46,  [new Intent("attack",8),  new Intent("freeze",0),  new Intent("attack",10), new Intent("attack",12)], 14, "", "ice"),
    frost_specter:  new EnemyType("Frost Specter",    145,  [new Intent("attack",13), new Intent("freeze",0),  new Intent("attack",17), new Intent("block",20),  new Intent("freeze",0), new Intent("attack",21)], 60, "Glacial Shard", "ice"),
    ice_crawler:    new EnemyType("Ice Crawler",       38,  [new Intent("attack",7),  new Intent("attack",9),  new Intent("attack",6)],     10, "",               "ice"),
    frost_shade:    new EnemyType("Frost Shade",       32,  [new Intent("attack",5),  new Intent("freeze",0),  new Intent("attack",8),  new Intent("attack",10)], 8, "", "ice"),
    glacial_warden: new EnemyType("Glacial Warden",   155,  [new Intent("attack",15), new Intent("block",18),  new Intent("freeze",0),  new Intent("attack",20), new Intent("block",14), new Intent("attack",24)], 65, "Frozen Core", "ice"),
    // Fire/volcanic — fire (with Burn status)
    ember_imp:      new EnemyType("Ember Imp",         34,  [new Intent("attack",6),  new Intent("burn",3),    new Intent("attack",9)],     10, "",               "fire"),
    lava_crab:      new EnemyType("Lava Crab",         60,  [new Intent("attack",11), new Intent("burn",4),    new Intent("block",12), new Intent("attack",15)], 16, "", "fire"),
    ember_knight:   new EnemyType("Ember Knight",     165,  [new Intent("attack",18), new Intent("burn",5),    new Intent("attack",22), new Intent("block",16),  new Intent("attack",26), new Intent("burn",4)], 70, "Ember Core", "fire"),
    ashen_wanderer: new EnemyType("Ashen Wanderer",    50,  [new Intent("attack",10), new Intent("burn",3),    new Intent("attack",12), new Intent("block",9)],  13, "", "fire"),
    cinder_fiend:   new EnemyType("Cinder Fiend",      65,  [new Intent("attack",13), new Intent("burn",4),    new Intent("attack",16), new Intent("block",11)], 17, "", "fire"),
    // Codex — arcane (with Weaken status)
    the_keeper:     new EnemyType("The Keeper",       180,  [new Intent("weaken",0),  new Intent("attack",20), new Intent("block",18),  new Intent("attack",24), new Intent("block",22), new Intent("attack",28), new Intent("weaken",0)], 80, "Weaver's Seal", "arcane"),
    void_scribe:    new EnemyType("Void Scribe",       55,  [new Intent("attack",11), new Intent("weaken",0),  new Intent("attack",14), new Intent("block",10)], 15, "", "arcane"),
    rune_sentinel:  new EnemyType("Rune Sentinel",     78,  [new Intent("attack",14), new Intent("block",14),  new Intent("weaken",0),  new Intent("attack",18)], 20, "", "arcane"),
    living_page:    new EnemyType("Living Page",       48,  [new Intent("attack",16), new Intent("weaken",0),  new Intent("attack",18)],    15, "",               "arcane"),
    codex_guardian: new EnemyType("Codex Guardian",    92,  [new Intent("attack",16), new Intent("block",16),  new Intent("weaken",0),  new Intent("attack",20), new Intent("block",18)], 24, "", "arcane"),
    first_weaver:   new EnemyType("The First Weaver", 220,  [new Intent("weaken",0),  new Intent("attack",22), new Intent("block",20),  new Intent("freeze",0),  new Intent("attack",26), new Intent("poison",3), new Intent("block",24), new Intent("attack",28), new Intent("burn",4)], 0, "", "arcane"),
};

// Slot for the room the player last saved in — populated by load_game()
last_room_id = rm_overworld;

// Boss card rewards — strong elemental cards, rewarded from boss fights
boss_card_pool = [
    new Card("Blaze",          2, "attack", 18,  "fire",    "burn",   5),
    new Card("Rampart",        2, "defend", 16,  "stone"),
    new Card("Crush",          2, "both",   10,  "stone"),
    new Card("Thornstrike",    2, "attack", 14,  "nature",  "poison", 4),
    new Card("Iron Veil",      1, "defend", 10,  "stone"),
    new Card("Glacial Spike",  2, "attack", 16,  "ice",     "freeze", 1),
    new Card("Inferno",        3, "attack", 24,  "fire",    "burn",   6),
    new Card("Plague Arrow",   2, "both",   10,  "nature",  "poison", 4),
    new Card("Void Rend",      2, "attack", 18,  "shadow",  "weaken", 1),
    new Card("Ancient Shield", 2, "defend", 15,  "arcane"),
    new Card("Codex Strike",   3, "attack", 26,  "arcane"),
];

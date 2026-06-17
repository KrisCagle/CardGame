// Guard — create obj_global if somehow missing (e.g. testing from combat room directly)
var _g = instance_find(obj_global, 0);
if (!instance_exists(_g)) {
    _g = instance_create_depth(0, 0, 0, obj_global);
}

// Player state from global
player_hp     = _g.player_hp;
player_hp_max = _g.player_hp_max;
player_block  = 0;
energy        = 3;
energy_max    = 3;

// Copy deck into a working combat copy
deck    = [];
hand    = [];
discard = [];
for (var i = 0; i < array_length(_g.deck); i++) {
    array_push(deck, _g.deck[i]);
}

// Read enemy from global
var _etype       = _g.current_enemy != noone ? _g.current_enemy : _g.enemy_types.slime;
enemy_name       = _etype.name;
enemy_hp         = _etype.hp;
enemy_hp_max     = _etype.hp;
enemy_block      = 0;
enemy_pool       = _etype.intent_pool;
enemy_element    = variable_struct_exists(_etype, "element") ? _etype.element : "physical";

// Pick first intent
var _first         = enemy_pool[irandom(array_length(enemy_pool) - 1)];
enemy_intent       = _first.type;
enemy_intent_value = _first.value;

// --- Status effect tracking ---
// Enemy statuses (applied BY player cards)
enemy_burn_turns    = 0;
enemy_burn_dmg      = 0;
enemy_freeze_turns  = 0;
enemy_poison_stacks = 0;
enemy_weakened      = false;

// Player statuses (applied BY enemy intents)
player_burn_turns    = 0;
player_burn_dmg      = 0;
player_freeze_turns  = 0;
player_poison_stacks = 0;
player_weakened      = false;

// Effectiveness flash display
last_effectiveness  = "";   // "SUPER", "WEAK", or ""
effectiveness_timer = 0;

// Apply relic passive effects
for (var _i = 0; _i < array_length(_g.relics); _i++) {
    var _r = _g.relics[_i];
    if (_r == "Iron Shield")     player_block += 4;
    if (_r == "Shadow Step")     energy_max   += 1;
    if (_r == "Thornwood Crown") player_block += 8;
    if (_r == "Tidal Amulet")    player_block += 6;
    if (_r == "Stone Skin")      player_block += 7;
    if (_r == "Marsh Lantern")   player_block += 5;
    if (_r == "Crestfall Sigil") energy_max   += 1;
    if (_r == "Glacial Shard")   player_block += 8;
    if (_r == "Frozen Core")     player_block += 10;
    if (_r == "Ember Core")      player_block += 9;
    if (_r == "Weaver's Seal")   energy_max   += 1;
}
energy = energy_max;

// Turn state
turn         = 1;
game_state   = "player_turn";
reward_cards = [];
levelup_flash = 0;

// Draw opening hand of 5
repeat(5) {
    if (array_length(deck) == 0) break;
    var idx = irandom(array_length(deck) - 1);
    array_push(hand, deck[idx]);
    array_delete(deck, idx, 1);
}

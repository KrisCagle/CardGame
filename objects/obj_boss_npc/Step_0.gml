// Vanish if already beaten
if (obj_global.boss_defeated) {
    instance_destroy();
    exit;
}

if (!instance_exists(obj_player)) exit;
if (!instance_exists(obj_dialogue_box)) exit;
if (obj_dialogue_box.active) exit;
if (obj_dialogue_box.open_cooldown > 0) exit;

// Check whether both in-arena guardians have been defeated
var _gate1 = "trainer_rm_boss_arena_380_420";
var _gate2 = "trainer_rm_boss_arena_986_420";
var _g1    = false;
var _g2    = false;
for (var _i = 0; _i < array_length(obj_global.defeated_enemies); _i++) {
    if (obj_global.defeated_enemies[_i] == _gate1) _g1 = true;
    if (obj_global.defeated_enemies[_i] == _gate2) _g2 = true;
}
var _guards_beaten = (_g1 && _g2);

var _dist = point_distance(x, y, obj_player.x, obj_player.y);
if (_dist < interact_dist && keyboard_check_pressed(vk_space)) {
    if (!_guards_beaten) {
        with (obj_dialogue_box) {
            dialogue_start(other.npc_name, [
                "You dare approach me before besting my guardians?",
                "Deal with them. Then we'll have words.",
            ]);
        }
        exit;
    }
    if (!boss_talked) {
        with (obj_dialogue_box) {
            dialogue_start(other.npc_name, [
                "You dare enter my stronghold?",
                "The Thornwood bends to my will alone.",
                "Face me, if you think you're ready.",
            ]);
        }
        boss_talked = true;
    } else {
        obj_global.current_enemy  = obj_global.enemy_types.thornlord;
        obj_global.encounter_type = "boss";
        obj_global.return_room    = room;
        room_goto(rm_combat);
    }
}

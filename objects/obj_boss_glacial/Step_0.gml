if (!instance_exists(obj_player)) exit;
if (obj_global.player_locked) exit;
if (is_defeated()) exit;

var _dist = point_distance(x, y, obj_player.x, obj_player.y);

if (dormant && _dist < wake_dist) dormant = false;
if (dormant) exit;

if (_dist >= interact_dist) exit;
if (!keyboard_check_pressed(vk_space)) exit;
if (!(instance_exists(obj_dialogue_box) && !obj_dialogue_box.active)) exit;

if (!talked) {
    talked = true;
    with (obj_dialogue_box) {
        dialogue_start("Glacial Warden", [
            "HALT.",
            "THESE CAVES ARE SEALED.",
            "THE COLD REMEMBERS WHAT YOU SEEK.",
            "IT DOES NOT WISH TO BE FOUND.",
            "TURN BACK."
        ]);
    }
} else {
    obj_global.current_enemy  = obj_global.enemy_types.glacial_warden;
    obj_global.encounter_type = "trainer";
    obj_global.return_room    = room;
    room_goto(rm_combat);
}

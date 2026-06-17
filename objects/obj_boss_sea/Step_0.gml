if (!instance_exists(obj_player)) exit;
if (obj_global.player_locked) exit;
if (is_defeated()) exit;

var _dist = point_distance(x, y, obj_player.x, obj_player.y);
if (_dist >= interact_dist) exit;
if (!keyboard_check_pressed(vk_space)) exit;
if (!(instance_exists(obj_dialogue_box) && !obj_dialogue_box.active)) exit;

if (!talked) {
    talked = true;
    with (obj_dialogue_box) {
        dialogue_start("Drowned Captain", [
            "...you actually came.",
            "These waters have swallowed stronger souls than yours.",
            "I've waited in this ruin for a century. Waiting for someone worth fighting.",
            "Let's see if you're worth my tide."
        ]);
    }
} else {
    obj_global.current_enemy  = obj_global.enemy_types.drowned;
    obj_global.encounter_type = "trainer";
    obj_global.return_room    = room;
    // Mark defeated now — obj_game adds to defeated_enemies on win via encounter_type trainer
    // We store the id so we can check it
    room_goto(rm_combat);
}

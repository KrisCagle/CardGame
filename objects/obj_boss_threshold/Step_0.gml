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
        dialogue_start("The Keeper", [
            "HALT.",
            "I am the last test. Not of strength. Not of endurance.",
            "Of will. Do you truly wish to know what is written inside?",
            "Words, once read, cannot be unread.",
            "The First Weaver entered mortal. She left as something... more.",
            "Are you ready to be changed by something you cannot yet understand?",
            "Prove it."
        ]);
    }
} else {
    obj_global.current_enemy  = obj_global.enemy_types.the_keeper;
    obj_global.encounter_type = "trainer";
    obj_global.return_room    = room;
    room_goto(rm_combat);
}

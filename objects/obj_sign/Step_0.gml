if (obj_dialogue_box.active) exit;

if (keyboard_check_pressed(vk_space)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 48) {
        obj_dialogue_box.dialogue_start("", [sign_text]);
    }
}

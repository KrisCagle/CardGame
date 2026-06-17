if (!instance_exists(obj_dialogue_box)) exit;
if (obj_dialogue_box.active) exit;
if (obj_dialogue_box.open_cooldown > 0) exit;

if (keyboard_check_pressed(vk_space)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 48) {
        with (obj_dialogue_box) {
            dialogue_start(other.npc_name, other.dialogue);
        }
    }
}

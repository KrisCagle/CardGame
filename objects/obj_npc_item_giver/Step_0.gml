if (!instance_exists(obj_player)) exit;
if (obj_global.player_locked) exit;
if (obj_dialogue_box.open_cooldown > 0) exit;

var _dist = point_distance(x, y, obj_player.x, obj_player.y);
if (_dist < interact_dist && keyboard_check_pressed(vk_space)) {
    if (instance_exists(obj_dialogue_box) && !obj_dialogue_box.active) {
        // Give item if player has been to Blackwood and doesn't have it yet
        if (obj_global.tried_blackwood && !item_given && !obj_global.has_item(item_name)) {
            array_push(obj_global.items, item_name);
            item_given = true;
        }
        with (obj_dialogue_box) {
            dialogue_start(other.npc_name, other.get_dialogue());
        }
    }
}

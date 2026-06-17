if (!instance_exists(obj_player)) exit;
if (instance_exists(obj_dialogue_box) && obj_dialogue_box.active) exit;
if (instance_exists(obj_dialogue_box) && obj_dialogue_box.open_cooldown > 0) exit;

var _dist = point_distance(x, y, obj_player.x, obj_player.y);
if (_dist < interact_dist && keyboard_check_pressed(vk_space)) {
    if (obj_global.player_hp >= obj_global.player_hp_max) {
        heal_last_msg = "You're already at full health!";
    } else if (obj_global.gold < heal_cost) {
        heal_last_msg = "You need " + string(heal_cost) + " gold to be healed.";
    } else {
        obj_global.gold       -= heal_cost;
        obj_global.player_hp   = obj_global.player_hp_max;
        heal_last_msg = "You've been healed! (-" + string(heal_cost) + "g)";
    }
    with (obj_dialogue_box) {
        dialogue_start(other.healer_name, [other.heal_last_msg]);
    }
}

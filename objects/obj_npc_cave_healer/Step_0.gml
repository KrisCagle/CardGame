if (!instance_exists(obj_player)) exit;
if (obj_global.player_locked) exit;
if (point_distance(x, y, obj_player.x, obj_player.y) >= interact_dist) exit;
if (!keyboard_check_pressed(vk_space)) exit;
if (!(instance_exists(obj_dialogue_box) && !obj_dialogue_box.active)) exit;

var _lines;
var _at_full = (obj_global.player_hp >= obj_global.player_hp_max);

if (_at_full) {
    _lines = [
        "You look well enough.",
        "The caverns are just ahead. Stay sharp — ice has a way of making everything quieter than it should be.",
        "Come back out if you need me."
    ];
} else {
    // Heal the player
    obj_global.player_hp = obj_global.player_hp_max;
    healed = true;
    _lines = [
        "You're hurt. Sit. Give me a moment.",
        "There. Good as I can manage out here.",
        "The Glacial Caverns are through that pass.",
        "Whatever's in there has been keeping the cold wrong lately.",
        "More wrong than usual. Be careful."
    ];
}

with (obj_dialogue_box) { dialogue_start(other.npc_name, _lines); }

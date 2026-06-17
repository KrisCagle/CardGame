if (!instance_exists(obj_player)) exit;
if (obj_global.player_locked) exit;
if (point_distance(x, y, obj_player.x, obj_player.y) >= interact_dist) exit;
if (!keyboard_check_pressed(vk_space)) exit;
if (!(instance_exists(obj_dialogue_box) && !obj_dialogue_box.active)) exit;

var _lines;
if (obj_global.has_item("Kayak")) {
    _lines = [
        "She's all yours. Take care of her.",
        "These waters are calm most days.",
        "Most days."
    ];
} else if (obj_global.gold >= kayak_cost) {
    obj_global.gold -= kayak_cost;
    array_push(obj_global.items, "Kayak");
    _lines = [
        "60 gold — there she is, tied up at the end of the pier.",
        "She'll get you anywhere on these waters.",
        "Just watch the currents heading east. They get strange out there."
    ];
} else {
    _lines = [
        "I've got a kayak gathering dust down at the far end of the dock.",
        "60 gold and she's yours.",
        "Come back when you've got it."
    ];
}

with (obj_dialogue_box) { dialogue_start(other.npc_name, _lines); }

if (!instance_exists(obj_player)) exit;

var _dist = point_distance(x, y, obj_player.x, obj_player.y);

if (_dist < 40) {
    if (obj_global.has_item("Kayak")) {
        room_goto(rm_ocean);
    } else {
        // Push player back from the water edge
        if (obj_player.x > x - 50) obj_player.x = x - 50;
        // One-time nudge message
        if (!warned && keyboard_check_pressed(vk_space)
        && instance_exists(obj_dialogue_box) && !obj_dialogue_box.active) {
            warned = true;
            with (obj_dialogue_box) {
                dialogue_start("*", [
                    "The water stretches out to the east.",
                    "You'd need a boat to go any further."
                ]);
            }
        }
    }
}

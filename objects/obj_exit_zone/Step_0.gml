var px = obj_player.x;
var py = obj_player.y;
var inside = (px >= x && px <= x + zone_w && py >= y && py <= y + zone_h);

if (inside && keyboard_check_pressed(vk_space)) {
    if (!instance_exists(obj_dialogue_box) || !obj_dialogue_box.active) {
        room_goto(target_room);
    }
}

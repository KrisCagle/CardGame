if (spawn_cooldown > 0) { spawn_cooldown--; exit; }
if (!instance_exists(obj_player)) exit;
if (instance_exists(obj_dialogue_box) && obj_dialogue_box.active) exit;
if (instance_exists(obj_shop) && obj_shop.open) exit;

var _dist = point_distance(x, y, obj_player.x, obj_player.y);
if (_dist < 28) {
    obj_global.building_room = room;
    room_goto(target_room);
}

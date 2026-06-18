if (!instance_exists(obj_player)) exit;

var _dist = point_distance(x, y, obj_player.x, obj_player.y);
if (_dist < 32) {
    obj_global.spawn_x = obj_global.building_x;
    obj_global.spawn_y = obj_global.building_y;
    room_goto(obj_global.building_room);
}

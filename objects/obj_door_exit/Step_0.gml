if (!instance_exists(obj_player)) exit;

var _dist = point_distance(x, y, obj_player.x, obj_player.y);
if (_dist < 32) {
    room_goto(obj_global.building_room);
}

speed_walk = 3;
show_deck  = false;
sprite_index = -1;
pending_dx = 0;
pending_dy = 0;

// Restore spawn position set before room transition (door exits, combat returns)
if (instance_exists(obj_global) && obj_global.spawn_x >= 0) {
    x = obj_global.spawn_x;
    y = obj_global.spawn_y;
    obj_global.spawn_x = -1;
    obj_global.spawn_y = -1;
}

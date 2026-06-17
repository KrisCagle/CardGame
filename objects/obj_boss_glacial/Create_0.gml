boss_id       = "glacial_boss_" + room_get_name(room) + "_" + string(x) + "_" + string(y);
talked        = false;
interact_dist = 90;
dormant       = true;
wake_dist     = 220;

function is_defeated() {
    for (var _i = 0; _i < array_length(obj_global.defeated_enemies); _i++) {
        if (obj_global.defeated_enemies[_i] == boss_id) return true;
    }
    return false;
}

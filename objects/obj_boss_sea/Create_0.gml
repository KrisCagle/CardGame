boss_id       = "sea_boss_rm_island_" + string(x) + "_" + string(y);
talked        = false;
interact_dist = 80;

function is_defeated() {
    for (var _i = 0; _i < array_length(obj_global.defeated_enemies); _i++) {
        if (obj_global.defeated_enemies[_i] == boss_id) return true;
    }
    return false;
}

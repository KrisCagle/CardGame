if (!instance_exists(obj_shop)) exit;
if (obj_shop.open) exit;
if (obj_shop.close_cooldown > 0) exit;
if (instance_exists(obj_dialogue_box) && obj_dialogue_box.active) exit;

if (keyboard_check_pressed(vk_space)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 48) {
        // Theme the shop stock based on which town we're in
        var _theme = "";
        switch (room) {
            case rm_millhaven:    _theme = "physical"; break;
            case rm_rothmere:     _theme = "nature";   break;
            case rm_frostmere:    _theme = "ice";      break;
            case rm_ironstead:    _theme = "stone";    break;
            case rm_cinder_reach: _theme = "fire";     break;
            case rm_crestfall:    _theme = "shadow";   break;
            case rm_threshold:    _theme = "arcane";   break;
        }
        with (obj_shop) { shop_open(_theme); }
    }
}

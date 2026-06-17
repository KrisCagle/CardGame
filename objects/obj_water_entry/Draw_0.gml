if (!obj_global.has_item("Kayak")) {
    if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) < 120) {
        draw_set_color(make_color_rgb(180, 200, 255));
        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);
        draw_text(x, y - 20, "~ Open Water ~");
    }
} else {
    if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) < 80) {
        draw_set_color(make_color_rgb(100, 220, 255));
        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);
        draw_text(x, y - 20, "Paddle East");
    }
}

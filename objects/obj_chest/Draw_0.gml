var near = (point_distance(x, y, obj_player.x, obj_player.y) < 48);

if (opened) {
    // Open chest — dark grey, lid offset
    draw_set_color(c_dkgray);
    draw_rectangle(x - 18, y - 10, x + 18, y + 16, false);
    draw_set_color(make_color_rgb(80, 50, 20));
    draw_rectangle(x - 18, y - 20, x + 18, y - 8, false);
} else {
    // Closed chest — brown
    draw_set_color(near ? c_yellow : make_color_rgb(160, 100, 40));
    draw_rectangle(x - 18, y - 16, x + 18, y + 16, false);
    draw_set_color(make_color_rgb(100, 60, 20));
    draw_rectangle(x - 18, y - 16, x + 18, y + 16, true);
    // Latch
    draw_set_color(c_yellow);
    draw_rectangle(x - 5, y - 3, x + 5, y + 3, false);

    if (near) {
        draw_set_color(c_yellow);
        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);
        draw_text(x, y - 22, "[Space]");
    }
}

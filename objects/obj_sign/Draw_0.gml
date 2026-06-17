var near = (point_distance(x, y, obj_player.x, obj_player.y) < 48);

// Post
draw_set_color(make_color_rgb(120, 80, 40));
draw_rectangle(x - 4, y - 4, x + 4, y + 24, false);

// Board
draw_set_color(make_color_rgb(200, 160, 80));
draw_rectangle(x - 20, y - 28, x + 20, y - 4, false);
draw_set_color(make_color_rgb(120, 80, 40));
draw_rectangle(x - 20, y - 28, x + 20, y - 4, true);

if (near) {
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(x, y - 34, "[Space]");
}

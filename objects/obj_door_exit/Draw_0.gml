// Door frame
draw_set_color(make_color_rgb(80, 50, 30));
draw_rectangle(x - 20, y - 56, x + 20, y, false);

// Door opening
draw_set_color(make_color_rgb(30, 15, 5));
draw_rectangle(x - 14, y - 48, x + 14, y, false);

// Label
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 60, "Exit");

// Proximity prompt
if (instance_exists(obj_player)) {
    var _dist = point_distance(x, y, obj_player.x, obj_player.y);
    if (_dist < interact_dist) {
        draw_set_color(c_yellow);
        draw_text(x, y - 76, "[Space] Leave");
    }
}

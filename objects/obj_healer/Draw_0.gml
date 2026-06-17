// Healer character (circle)
draw_set_color(healer_color);
draw_circle(x, y, 14, false);

// Name tag
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 18, healer_name);

// HP display (faint hint of their role)
draw_set_color(make_color_rgb(180, 80, 80));
draw_set_halign(fa_center);
draw_text(x, y - 34, "+ Heal " + string(heal_cost) + "g");

// Proximity prompt
if (instance_exists(obj_player)) {
    var _dist = point_distance(x, y, obj_player.x, obj_player.y);
    if (_dist < interact_dist) {
        draw_set_color(c_yellow);
        draw_text(x, y - 50, "[Space] Restore HP");
    }
}

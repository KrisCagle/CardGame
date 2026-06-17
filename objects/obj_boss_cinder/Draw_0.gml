var _t = current_time * 0.001;

if (is_defeated()) {
    draw_set_color(make_color_rgb(60, 30, 10));
    draw_circle(x, y + 15, 20, false);
    draw_set_color(make_color_rgb(200, 100, 40));
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(x, y - 20, "Ember Knight (defeated)");
    exit;
}

// Armored knight â€” but the armor glows with inner fire
// Legs
draw_set_color(make_color_rgb(55, 25, 12));
draw_rectangle(x - 14, y,      x - 4,  y + 40, false);
draw_rectangle(x + 4,  y,      x + 14, y + 40, false);
// Greaves glow
var _fire = sin(_t * 4) * 0.15 + 0.7;
draw_set_alpha(_fire * 0.5);
draw_set_color(make_color_rgb(255, 90, 10));
draw_rectangle(x - 16, y + 20, x - 2, y + 42, false);
draw_rectangle(x + 2, y + 20, x + 16, y + 42, false);
draw_set_alpha(1);
// Torso â€” black iron plate with lava cracks
draw_set_color(make_color_rgb(40, 18, 8));
draw_rectangle(x - 22, y - 48, x + 22, y + 4, false);
// Lava cracks on chest
draw_set_alpha(_fire * 0.8);
draw_set_color(make_color_rgb(255, 120, 10));
draw_line_width(x - 8, y - 40, x + 4, y - 20, 2);
draw_line_width(x + 4, y - 20, x - 2, y - 5,  2);
draw_line_width(x + 10, y - 36, x + 2, y - 14, 2);
draw_set_alpha(1);
// Shoulders
draw_set_color(make_color_rgb(35, 15, 6));
draw_ellipse(x - 32, y - 52, x - 14, y - 32, false);
draw_ellipse(x + 14, y - 52, x + 32, y - 32, false);
// Arms
draw_set_color(make_color_rgb(38, 17, 8));
draw_rectangle(x - 32, y - 40, x - 20, y + 4, false);
draw_rectangle(x + 20, y - 40, x + 32, y + 4, false);
// Great sword (left hand, vertical)
draw_set_color(make_color_rgb(80, 60, 50));
draw_rectangle(x - 38, y - 20, x - 30, y + 60, false);
// Blade glow
draw_set_alpha(_fire * 0.6);
draw_set_color(make_color_rgb(255, 140, 20));
draw_rectangle(x - 37, y - 18, x - 31, y + 55, false);
draw_set_alpha(1);
draw_set_color(make_color_rgb(70, 50, 40)); // crossguard
draw_rectangle(x - 46, y - 22, x - 22, y - 14, false);
// Head â€” visored helm
draw_set_color(make_color_rgb(36, 16, 7));
draw_rectangle(x - 16, y - 74, x + 16, y - 48, false);
// Visor slit â€” glowing orange
draw_set_alpha(_fire);
draw_set_color(make_color_rgb(255, 130, 20));
draw_rectangle(x - 13, y - 68, x + 13, y - 60, false);
draw_set_alpha(1);
// Crest (small flame on top)
draw_set_alpha(_fire * 0.9);
draw_set_color(make_color_rgb(255, 80, 10));
draw_triangle(x - 6, y - 74, x, y - 90, x + 6, y - 74, false);
draw_set_color(make_color_rgb(255, 200, 40));
draw_triangle(x - 3, y - 74, x, y - 84, x + 3, y - 74, false);
draw_set_alpha(1);

// Name and prompt
draw_set_color(make_color_rgb(240, 140, 50));
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 100, "Ember Knight");
if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) < interact_dist) {
    draw_set_color(make_color_rgb(255, 180, 80));
    draw_text(x, y - 114, "[Space]");
}

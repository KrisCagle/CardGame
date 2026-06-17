if (is_defeated()) exit;

// Ghostly captain figure
var _flicker = sin(current_time * 0.003) * 0.15 + 0.75;
draw_set_alpha(_flicker);

// Cloak
draw_set_color(make_color_rgb(30, 50, 90));
draw_rectangle(x - 14, y - 40, x + 14, y + 20, false);
// Head
draw_set_color(make_color_rgb(160, 180, 200));
draw_circle(x, y - 50, 12, false);
// Captain hat
draw_set_color(make_color_rgb(20, 25, 45));
draw_rectangle(x - 14, y - 66, x + 14, y - 59, false);
draw_rectangle(x - 8,  y - 74, x + 8,  y - 60, false);
// Ghostly wisps at the base
draw_set_color(make_color_rgb(60, 100, 180));
draw_circle(x - 8,  y + 24, 6, false);
draw_circle(x + 6,  y + 28, 5, false);
draw_circle(x,      y + 30, 7, false);

draw_set_alpha(1);

// Name and prompt
draw_set_color(make_color_rgb(160, 200, 255));
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 82, "Drowned Captain");

if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) < interact_dist) {
    draw_set_color(make_color_rgb(255, 80, 80));
    draw_text(x, y - 96, "[Space]");
}

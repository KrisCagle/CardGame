var _t     = current_time * 0.0015;
var _pulse = sin(_t * 2) * 0.25 + 0.55;

// Stone slab on wall
draw_set_color(make_color_rgb(35, 30, 28));
draw_rectangle(x - 36, y - 70, x + 36, y + 30, false);

// Carved rune symbols (stylized geometric shapes)
draw_set_alpha(_pulse);
draw_set_color(make_color_rgb(120, 160, 255));

// Symbol 1: diamond
draw_triangle(x,      y - 60, x - 18, y - 40, x,      y - 20, false);
draw_triangle(x,      y - 60, x + 18, y - 40, x,      y - 20, false);
// Symbol 2: horizontal bar with dots
draw_rectangle(x - 20, y - 10, x + 20, y - 6, false);
draw_circle(x - 24, y - 8, 4, false);
draw_circle(x + 24, y - 8, 4, false);
// Symbol 3: vertical stacked marks
draw_rectangle(x - 4,  y + 4,  x + 4,  y + 10, false);
draw_rectangle(x - 4,  y + 14, x + 4,  y + 20, false);
draw_rectangle(x - 4,  y + 24, x + 4,  y + 28, false);

draw_set_alpha(1);

// Prompt
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) < interact_dist) {
    draw_set_color(make_color_rgb(160, 180, 255));
    draw_text(x, y - 80, "[Space] Examine");
}

// Weaver who turned back — worn traveling cloak, hood down, haunted expression
var _cx = x;
var _cy = y;
var _t  = current_time * 0.001;

// Body — dark travel cloak, faded
draw_set_color(make_color_rgb(50, 40, 55));
draw_rectangle(_cx - 14, _cy - 32, _cx + 14, _cy + 4, false);
// Head
draw_set_color(make_color_rgb(190, 155, 130));
draw_circle(_cx, _cy - 42, 12, false);
// Eyes — haunted, slightly hollow
draw_set_color(make_color_rgb(60, 45, 50));
draw_circle(_cx - 4, _cy - 44, 2, false);
draw_circle(_cx + 4, _cy - 44, 2, false);
// Hair — loose, unkempt
draw_set_color(make_color_rgb(80, 55, 40));
draw_rectangle(_cx - 12, _cy - 54, _cx + 12, _cy - 46, false);
// Card in hand — faint, like it's lost its glow
draw_set_color(make_color_rgb(60, 50, 70));
draw_rectangle(_cx + 16, _cy - 28, _cx + 28, _cy - 10, false);
draw_set_color(make_color_rgb(40, 32, 50));
draw_rectangle(_cx + 18, _cy - 26, _cx + 26, _cy - 12, false);
// Prompt
if (distance_to_object(obj_player) < 60) {
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(_cx, _cy - 70, "[Space]");
}

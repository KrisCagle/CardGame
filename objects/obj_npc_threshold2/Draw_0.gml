// Elder scholar — robes, reading old tome, calm demeanor
var _cx = x;
var _cy = y;
var _t  = current_time * 0.001;

// Robes — deep blue-grey
draw_set_color(make_color_rgb(40, 38, 55));
draw_rectangle(_cx - 16, _cy - 32, _cx + 16, _cy + 4, false);
// Head
draw_set_color(make_color_rgb(195, 165, 140));
draw_circle(_cx, _cy - 42, 12, false);
// White hair
draw_set_color(make_color_rgb(210, 210, 215));
draw_rectangle(_cx - 11, _cy - 54, _cx + 11, _cy - 43, false);
// Spectacles
draw_set_color(make_color_rgb(80, 65, 40));
draw_circle(_cx - 4, _cy - 43, 3, true);
draw_circle(_cx + 4, _cy - 43, 3, true);
draw_rectangle(_cx - 1, _cy - 44, _cx + 1, _cy - 42, false);
// Old tome in hands
draw_set_color(make_color_rgb(55, 35, 20));
draw_rectangle(_cx - 18, _cy - 20, _cx + 6, _cy - 2, false);
// Open pages
draw_set_color(make_color_rgb(200, 190, 170));
draw_rectangle(_cx - 16, _cy - 18, _cx + 4, _cy - 4, false);
// Prompt
if (distance_to_object(obj_player) < 60) {
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(_cx, _cy - 70, "[Space]");
}

// Gatewarden â€” aged guard, tall spear, ceremonial armor (worn but present)
var _cx = x;
var _cy = y;
var _t  = current_time * 0.001;

// Body â€” ceremonial stone-grey armor, battered
draw_set_color(make_color_rgb(55, 50, 60));
draw_rectangle(_cx - 14, _cy - 34, _cx + 14, _cy + 4, false);
// Chest plate detail
draw_set_color(make_color_rgb(70, 65, 78));
draw_rectangle(_cx - 10, _cy - 30, _cx + 10, _cy - 10, false);
// Pauldrons
draw_set_color(make_color_rgb(62, 56, 68));
draw_rectangle(_cx - 20, _cy - 34, _cx - 12, _cy - 20, false);
draw_rectangle(_cx + 12, _cy - 34, _cx + 20, _cy - 20, false);
// Head with old helmet
draw_set_color(make_color_rgb(55, 50, 60));
draw_circle(_cx, _cy - 44, 13, false);
// Visor slit
draw_set_color(make_color_rgb(30, 25, 35));
draw_rectangle(_cx - 9, _cy - 47, _cx + 9, _cy - 42, false);
// Ceremonial spear (held upright)
draw_set_color(make_color_rgb(70, 55, 35));
draw_rectangle(_cx + 16, _cy - 80, _cx + 20, _cy + 4, false);
// Spear tip
draw_set_color(make_color_rgb(160, 145, 130));
draw_triangle(_cx + 14, _cy - 80, _cx + 22, _cy - 80, _cx + 18, _cy - 98, false);
// Prompt
if (distance_to_object(obj_player) < 60) {
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(_cx, _cy - 110, "[Space]");
}

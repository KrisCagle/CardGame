// Draw trainer as a green square with "!" exclamation
var near = (point_distance(x, y, obj_player.x, obj_player.y) < 48);
draw_set_color(near ? c_yellow : c_green);
draw_rectangle(x - 16, y - 16, x + 16, y + 16, false);

var _etype = variable_struct_get(obj_global.enemy_types, enemy_key);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 20, _etype.name);

if (near) {
    draw_set_color(c_yellow);
    draw_text(x, y - 36, "[Space]");
}

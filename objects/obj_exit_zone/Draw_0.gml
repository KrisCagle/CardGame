var px = obj_player.x;
var py = obj_player.y;
var near = (px >= x && px <= x + zone_w && py >= y && py <= y + zone_h);

draw_set_color(near ? c_yellow : c_white);
draw_rectangle(x, y, x + zone_w, y + zone_h, true);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x + zone_w / 2, y - 4, label);
if (near) {
    draw_set_color(c_yellow);
    draw_text(x + zone_w / 2, y - 20, "[Space]");
}

// Body
draw_set_color(npc_color);
draw_rectangle(x - 8, y - 28, x + 8, y + 14, false);
// Head
draw_circle(x, y - 38, 10, false);
// Name
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 52, npc_name);

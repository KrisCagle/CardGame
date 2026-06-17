// Draw player as a simple colored square for now
draw_set_color(c_blue);
draw_rectangle(x - 16, y - 16, x + 16, y + 16, false);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(x, y - 30, "Player");
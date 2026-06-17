// Building body
draw_set_color(make_color_rgb(120, 80, 50));
draw_rectangle(x - 64, y - 128, x + 64, y, false);

// Roof strip
draw_set_color(make_color_rgb(80, 50, 30));
draw_rectangle(x - 70, y - 140, x + 70, y - 124, false);

// Door opening
draw_set_color(make_color_rgb(30, 15, 5));
draw_rectangle(x - 16, y - 48, x + 16, y, false);

// Building label
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 144, door_label);

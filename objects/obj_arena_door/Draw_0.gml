// Building body — dark blood-red stone
draw_set_color(make_color_rgb(70, 20, 20));
draw_rectangle(x - 80, y - 150, x + 80, y, false);

// Battlements
draw_set_color(make_color_rgb(50, 10, 10));
draw_rectangle(x - 86, y - 163, x + 86, y - 150, false);
for (var _i = -3; _i <= 3; _i += 2) {
    draw_rectangle(x + _i * 26 - 12, y - 180, x + _i * 26 + 12, y - 163, false);
}

// Iron door
draw_set_color(make_color_rgb(25, 25, 35));
draw_rectangle(x - 20, y - 58, x + 20, y, false);
// Door studs
draw_set_color(make_color_rgb(100, 80, 40));
draw_circle(x - 12, y - 46, 3, false);
draw_circle(x + 12, y - 46, 3, false);
draw_circle(x - 12, y - 22, 3, false);
draw_circle(x + 12, y - 22, 3, false);

// Label
draw_set_color(make_color_rgb(220, 60, 60));
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 184, door_label);

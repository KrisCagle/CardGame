// ---- Ground (town side) ----
draw_set_color(make_color_rgb(60, 55, 45));
draw_rectangle(0, 0, 1060, room_height, false);

// ---- Ocean (pier side) ----
var _wave = sin(current_time * 0.001) * 4; // gentle shimmer offset
draw_set_color(make_color_rgb(18, 55, 100));
draw_rectangle(1060, 0, room_width, room_height, false);

// Ocean shimmer lines
draw_set_color(make_color_rgb(30, 80, 140));
for (var _i = 0; _i < 8; _i++) {
    var _wy = 140 + _i * 76 + _wave;
    draw_rectangle(1060, _wy, room_width, _wy + 18, false);
}

// ---- Pier planks ----
draw_set_color(make_color_rgb(100, 75, 50));
draw_rectangle(1060, 320, room_width, 480, false);

// Plank lines
draw_set_color(make_color_rgb(70, 52, 34));
for (var _p = 1060; _p < room_width; _p += 48) {
    draw_line(_p, 320, _p, 480);
}

// Pier railing posts
draw_set_color(make_color_rgb(80, 60, 40));
for (var _rp = 1100; _rp < room_width - 40; _rp += 120) {
    draw_rectangle(_rp - 5, 290, _rp + 5, 330, false); // top rail post
    draw_rectangle(_rp - 5, 470, _rp + 5, 510, false); // bottom rail post
}
// Horizontal rails
draw_set_color(make_color_rgb(90, 68, 46));
draw_rectangle(1060, 295, room_width, 305, false);
draw_rectangle(1060, 475, room_width, 485, false);

// ---- Shop building (left) ----
draw_set_color(make_color_rgb(90, 70, 55));
draw_rectangle(390, 290, 560, 480, false);
draw_set_color(make_color_rgb(110, 85, 65));
draw_rectangle(390, 270, 560, 295, false); // roof overhang
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(475, 330, "SHOP");

// ---- Hospital building (right of shop) ----
draw_set_color(make_color_rgb(75, 90, 75));
draw_rectangle(630, 290, 800, 480, false);
draw_set_color(make_color_rgb(90, 110, 90));
draw_rectangle(630, 270, 800, 295, false);
draw_set_color(c_white);
draw_text(715, 330, "CLINIC");

// Crosses on clinic
draw_set_color(make_color_rgb(200, 60, 60));
draw_rectangle(706, 345, 724, 390, false);
draw_rectangle(695, 358, 735, 376, false);

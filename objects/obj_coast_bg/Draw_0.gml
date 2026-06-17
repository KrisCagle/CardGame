// Overcast coastal sky
draw_set_color(make_color_rgb(110, 130, 155));
draw_rectangle(0, 0, room_width, 260, false);

// Cliff face (bottom half of screen is elevated ground; ocean is below left edge)
draw_set_color(make_color_rgb(75, 68, 58));
draw_rectangle(0, 260, room_width, room_height, false);

// Stone path running east-west
draw_set_color(make_color_rgb(95, 88, 78));
draw_rectangle(0, 310, room_width, 460, false);
// Path cracks / stones
draw_set_color(make_color_rgb(80, 73, 63));
for (var _px = 0; _px < room_width; _px += 96) {
    draw_rectangle(_px,     340, _px + 88, 345, false);
    draw_rectangle(_px + 48, 400, _px + 80, 405, false);
    draw_rectangle(_px + 20, 430, _px + 70, 434, false);
}

// Cliff edge drop on the south side (player's bottom)
draw_set_color(make_color_rgb(45, 40, 35));
draw_rectangle(0, 460, room_width, 500, false);

// Ocean below cliffs (visible strip at bottom)
var _t = current_time * 0.0007;
draw_set_color(make_color_rgb(18, 55, 105));
draw_rectangle(0, 500, room_width, room_height, false);
draw_set_alpha(0.4);
draw_set_color(make_color_rgb(40, 90, 160));
for (var _wi = 0; _wi < 5; _wi++) {
    var _wy = 520 + _wi * 44 + sin(_t + _wi) * 8;
    draw_rectangle(0, _wy, room_width, _wy + 14, false);
}
draw_set_alpha(1);

// Rocky outcroppings (top edge of cliff path)
draw_set_color(make_color_rgb(65, 58, 50));
draw_rectangle(200,  260, 280, 315, false);
draw_rectangle(550,  260, 640, 320, false);
draw_rectangle(900,  260, 970, 310, false);
draw_rectangle(1300, 260, 1390, 325, false);
draw_rectangle(1700, 260, 1780, 312, false);

// Sparse wind-bent grass tufts on cliff top
draw_set_color(make_color_rgb(80, 105, 55));
for (var _gi = 0; _gi < room_width; _gi += 140) {
    var _sway = sin(_t * 1.5 + _gi * 0.01) * 4;
    draw_rectangle(_gi + _sway, 275, _gi + 8 + _sway, 300, false);
    draw_rectangle(_gi + 14 + _sway, 278, _gi + 20 + _sway, 298, false);
}

// Distant sea birds (simple dots moving slowly)
draw_set_color(make_color_rgb(80, 90, 100));
for (var _bi = 0; _bi < 5; _bi++) {
    var _bx = (_bi * 380 + current_time * 0.04) mod room_width;
    var _by = 140 + sin(_t * 0.8 + _bi * 1.2) * 20;
    draw_circle(_bx, _by, 3, false);
    draw_circle(_bx + 14, _by - 3, 3, false);
}

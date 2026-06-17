var _t = current_time * 0.001;

// Cave ceiling and walls â€” near black
draw_set_color(make_color_rgb(14, 12, 10));
draw_rectangle(0, 0, room_width, room_height, false);

// Cave floor
draw_set_color(make_color_rgb(28, 24, 20));
draw_rectangle(0, 300, room_width, 520, false);

// Floor texture â€” rubble lines
draw_set_color(make_color_rgb(22, 19, 16));
for (var _fx = 0; _fx < room_width; _fx += 80) {
    draw_rectangle(_fx, 440, _fx + 70, 445, false);
    draw_rectangle(_fx + 30, 480, _fx + 75, 483, false);
}

// Minecart tracks
draw_set_color(make_color_rgb(60, 52, 44));
draw_rectangle(0, 450, room_width, 456, false); // left rail
draw_rectangle(0, 470, room_width, 476, false); // right rail
draw_set_color(make_color_rgb(40, 35, 28));
for (var _sl = 0; _sl < room_width; _sl += 56) {
    draw_rectangle(_sl, 450, _sl + 40, 476, false); // sleeper ties
}

// Wooden tunnel supports
draw_set_color(make_color_rgb(55, 42, 30));
for (var _pi = 80; _pi < room_width; _pi += 320) {
    draw_rectangle(_pi,      250, _pi + 16, 520, false); // left post
    draw_rectangle(_pi + 130, 250, _pi + 146, 520, false); // right post
    draw_rectangle(_pi,      250, _pi + 146, 272, false); // crossbeam
}

// Crystal vein clusters (blue-purple glimmer, animated)
var _crystal_alpha = 0.5 + sin(_t * 1.2) * 0.15;
draw_set_alpha(_crystal_alpha);
draw_set_color(make_color_rgb(80, 110, 200));
// Cluster 1
draw_rectangle(440, 180, 458, 256, false);
draw_rectangle(452, 160, 465, 240, false);
draw_rectangle(462, 195, 472, 250, false);
// Cluster 2
draw_set_color(make_color_rgb(110, 70, 190));
draw_rectangle(1050, 190, 1064, 260, false);
draw_rectangle(1060, 170, 1075, 248, false);
// Cluster 3
draw_set_color(make_color_rgb(60, 130, 210));
draw_rectangle(1650, 175, 1668, 255, false);
draw_rectangle(1660, 158, 1678, 235, false);
draw_rectangle(1672, 185, 1680, 248, false);
draw_set_alpha(1);

// Torch glow pools â€” warm, flickering light
for (var _ti = 0; _ti < 6; _ti++) {
    var _tx      = 180 + _ti * 320;
    var _ty      = 310;
    var _flicker = sin(_t * 2.1 + _ti * 1.7) * 0.08 + 0.45;

    // Outer warm glow
    draw_set_alpha(_flicker * 0.35);
    draw_set_color(make_color_rgb(160, 80, 20));
    draw_circle(_tx, _ty, 170, false);

    // Inner brighter glow
    draw_set_alpha(_flicker * 0.55);
    draw_set_color(make_color_rgb(220, 130, 40));
    draw_circle(_tx, _ty, 90, false);

    // Torch bracket on wall
    draw_set_alpha(1);
    draw_set_color(make_color_rgb(70, 58, 44));
    draw_rectangle(_tx - 4, 285, _tx + 4, 320, false);
    draw_set_color(make_color_rgb(240, 160, 50));
    draw_circle(_tx, 282, 7, false);
    // Flame flicker
    var _flame = sin(_t * 4 + _ti) * 3;
    draw_set_color(make_color_rgb(255, 100, 20));
    draw_triangle(_tx - 5, 282, _tx + 5, 282, _tx + _flame, 266, false);
}
draw_set_alpha(1);

// Water drips on ceiling (animated)
draw_set_color(make_color_rgb(40, 60, 80));
for (var _di = 0; _di < 8; _di++) {
    var _dx  = 250 + _di * 230;
    var _dph = (_t * 60 + _di * 37) mod 200;
    draw_circle(_dx, 220 + _dph, 3, false);
}

// Depth darkness â€” vignette at far edges
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(0, 0, 60, room_height, false);
draw_rectangle(room_width - 60, 0, room_width, room_height, false);
draw_set_alpha(1);

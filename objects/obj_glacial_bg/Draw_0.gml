var _t = current_time * 0.001;
var _w = room_width;
var _h = room_height;

// Cave void â€” deep black ceiling and walls
draw_set_color(make_color_rgb(4, 8, 14));
draw_rectangle(0, 0, _w, _h, false);

// Ice wall â€” glowing blue from within
draw_set_color(make_color_rgb(18, 35, 58));
draw_rectangle(0, 0, _w, 140, false); // ceiling ice
draw_rectangle(0, 520, _w, _h, false); // floor ice

// Interior ice glow
draw_set_alpha(0.18);
draw_set_color(make_color_rgb(80, 160, 240));
draw_rectangle(0, 0, _w, 140, false);
draw_rectangle(0, 520, _w, _h, false);
draw_set_alpha(1);

// Cave floor â€” polished blue-black ice
draw_set_color(make_color_rgb(12, 24, 40));
draw_rectangle(0, 340, _w, 520, false);
// Floor shine streaks
draw_set_alpha(0.12);
draw_set_color(make_color_rgb(120, 180, 255));
for (var _fs = 0; _fs < 10; _fs++) {
    draw_rectangle(_fs * 210 + 20, 380, _fs * 210 + 160, 385, false);
    draw_rectangle(_fs * 210 + 60, 410, _fs * 210 + 180, 413, false);
}
draw_set_alpha(1);

// Ceiling stalactites â€” jagged ice spikes
var _stal = [40, 120, 200, 310, 430, 560, 680, 810, 940, 1070, 1200, 1340, 1480, 1620, 1750, 1890, 2010];
var _h2   = [80, 55,  95,  70,  85,  60,  100, 75,  90,  65,   80,   55,   95,   70,   85,   60,   90];
for (var _si = 0; _si < array_length(_stal); _si++) {
    var _sx   = _stal[_si];
    var _sh   = _h2[_si];
    var _glow = sin(_t * 1.1 + _si * 0.7) * 0.08 + 0.75;
    draw_set_alpha(_glow);
    draw_set_color(make_color_rgb(100, 170, 230));
    draw_triangle(_sx - 14, 0, _sx, _sh, _sx + 14, 0, false);
    draw_set_color(make_color_rgb(180, 220, 255));
    draw_triangle(_sx - 5, 0, _sx, _sh * 0.5, _sx + 5, 0, false);
    draw_set_alpha(1);
}

// Floor stalagmites â€” rising ice spikes
var _ftals = [80, 200, 380, 550, 750, 920, 1100, 1280, 1450, 1650, 1830, 1980];
var _fh    = [45, 60,  38,  55,  48,  62,  40,   58,   44,   52,   36,   50];
for (var _fi = 0; _fi < array_length(_ftals); _fi++) {
    var _fx   = _ftals[_fi];
    var _fhh  = _fh[_fi];
    var _fglow = sin(_t * 0.9 + _fi * 1.1) * 0.1 + 0.65;
    draw_set_alpha(_fglow);
    draw_set_color(make_color_rgb(80, 150, 210));
    draw_triangle(_fx - 12, 520, _fx, 520 - _fhh, _fx + 12, 520, false);
    draw_set_color(make_color_rgb(160, 210, 250));
    draw_triangle(_fx - 4, 520, _fx, 520 - _fhh * 0.5, _fx + 4, 520, false);
    draw_set_alpha(1);
}

// Embedded crystals in walls â€” clusters of glowing ice
var _cryst = [
    [160, 180, 22], [420, 220, 18], [700, 160, 26], [980, 200, 20],
    [1260,185, 24], [1540,210, 18], [1820,175, 22],
];
for (var _ci = 0; _ci < array_length(_cryst); _ci++) {
    var _c = _cryst[_ci];
    var _ca = sin(_t * 1.4 + _ci * 0.9) * 0.12 + 0.65;
    draw_set_alpha(_ca);
    draw_set_color(make_color_rgb(140, 200, 255));
    // Crystal cluster (3 triangles)
    draw_triangle(_c[0] - _c[2], _c[1], _c[0], _c[1] - _c[2] * 1.6, _c[0] + _c[2] * 0.6, _c[1], false);
    draw_triangle(_c[0], _c[1], _c[0] + _c[2] * 1.2, _c[1] - _c[2], _c[0] + _c[2] * 1.4, _c[1] + _c[2] * 0.4, false);
    draw_triangle(_c[0] - _c[2] * 0.8, _c[1] + _c[2] * 0.2, _c[0], _c[1] - _c[2] * 0.8, _c[0] + _c[2] * 0.4, _c[1] + _c[2] * 0.6, false);
    draw_set_alpha(1);
}

// Ambient cave glow â€” soft blue light pooling
for (var _gi = 0; _gi < 5; _gi++) {
    var _gx = _gi * 450 + 200;
    var _ga = sin(_t * 0.6 + _gi * 1.5) * 0.04 + 0.07;
    draw_set_alpha(_ga);
    draw_set_color(make_color_rgb(60, 130, 220));
    draw_ellipse(_gx - 180, 250, _gx + 180, 440, false);
    draw_set_alpha(1);
}

// Drip drops falling from stalactites (ice melt)
for (var _di = 0; _di < 8; _di++) {
    var _dx = (_di * 263 + 70) mod _w;
    var _dy = ((_t * 60 + _di * 77) mod 220) + 90;
    draw_set_alpha(0.5);
    draw_set_color(make_color_rgb(140, 200, 255));
    draw_circle(_dx, _dy, 2, false);
    draw_set_alpha(1);
}

// Vignette
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(0, 0, 80, _h, false);
draw_rectangle(_w - 80, 0, _w, _h, false);
draw_set_alpha(1);

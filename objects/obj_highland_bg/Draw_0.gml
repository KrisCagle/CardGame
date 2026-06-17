var _t = current_time * 0.001;
var _w = room_width;
var _h = room_height;

// Sky â€” pale grey-blue, cold overcast
draw_set_color(make_color_rgb(160, 175, 195));
draw_rectangle(0, 0, _w, _h * 0.42, false);
// Low cloud bank
draw_set_alpha(0.55);
draw_set_color(make_color_rgb(200, 205, 215));
draw_rectangle(0, _h * 0.28, _w, _h * 0.42, false);
draw_set_alpha(1);

// Mountain range in background
var _peaks = [
    [-60,  80,  260, 320],
    [140,  40,  420, 320],
    [360,  60,  620, 320],
    [560,  20,  840, 320],
    [780,  50,  1020,320],
    [980,  10,  1260,320],
    [1200, 45,  1440,320],
    [1380, 25,  1640,320],
    [1600, 55,  1860,320],
    [1800, 35,  2100,320],
];
// Far mountains (lighter, more distant)
draw_set_color(make_color_rgb(155, 165, 180));
for (var _pi = 0; _pi < array_length(_peaks); _pi++) {
    var _p = _peaks[_pi];
    draw_triangle(_p[0], _p[3], (_p[0]+_p[2])/2, _p[1], _p[2], _p[3], false);
}
// Snow caps on peaks
draw_set_color(make_color_rgb(230, 235, 242));
for (var _pi = 0; _pi < array_length(_peaks); _pi++) {
    var _p = _peaks[_pi];
    var _mx = (_p[0]+_p[2])/2;
    var _cap_h = (_p[3] - _p[1]) * 0.28;
    draw_triangle(_mx - _cap_h * 0.7, _p[1] + _cap_h,
                  _mx, _p[1],
                  _mx + _cap_h * 0.7, _p[1] + _cap_h, false);
}

// Closer hills â€” darker stone
draw_set_color(make_color_rgb(90, 95, 102));
draw_ellipse(-80, 200, 400, 400, false);
draw_ellipse(300, 220, 720, 400, false);
draw_ellipse(660, 205, 1060, 400, false);
draw_ellipse(1020, 215, 1420, 400, false);
draw_ellipse(1380, 200, 1800, 400, false);
draw_ellipse(1720, 210, 2120, 400, false);

// Snow dusting on hill tops
draw_set_color(make_color_rgb(220, 228, 238));
draw_set_alpha(0.6);
draw_ellipse(-80, 200, 400, 300, false);
draw_ellipse(300, 220, 720, 310, false);
draw_ellipse(660, 205, 1060, 305, false);
draw_ellipse(1020, 215, 1420, 308, false);
draw_ellipse(1380, 200, 1800, 302, false);
draw_ellipse(1720, 210, 2120, 305, false);
draw_set_alpha(1);

// Ground â€” rocky snow-dusted path
draw_set_color(make_color_rgb(88, 84, 80));
draw_rectangle(0, _h * 0.42, _w, _h, false);
// Snow coverage on ground
draw_set_color(make_color_rgb(210, 218, 228));
draw_rectangle(0, _h * 0.42, _w, _h * 0.50, false);
// Rocky patches showing through
draw_set_color(make_color_rgb(78, 74, 70));
var _rock_x = [80, 240, 450, 680, 950, 1180, 1400, 1650, 1870];
for (var _ri = 0; _ri < array_length(_rock_x); _ri++) {
    draw_ellipse(_rock_x[_ri], _h * 0.44, _rock_x[_ri] + 55, _h * 0.50, false);
}

// Path â€” worn stone, snow-edged
draw_set_color(make_color_rgb(96, 90, 82));
draw_rectangle(0, 375, _w, 425, false);
draw_set_color(make_color_rgb(215, 222, 232));
draw_rectangle(0, 373, _w, 378, false);
draw_rectangle(0, 422, _w, 427, false);

// Pine trees silhouetted on ridge
var _pine_x = [50, 190, 340, 1680, 1820, 1960];
for (var _ti = 0; _ti < array_length(_pine_x); _ti++) {
    var _tx = _pine_x[_ti];
    draw_set_color(make_color_rgb(38, 50, 42));
    // Trunk
    draw_rectangle(_tx - 4, 320, _tx + 4, 400, false);
    // Three tiers of branches
    draw_triangle(_tx - 28, 340, _tx, 290, _tx + 28, 340, false);
    draw_triangle(_tx - 22, 315, _tx, 270, _tx + 22, 315, false);
    draw_triangle(_tx - 16, 292, _tx, 254, _tx + 16, 292, false);
    // Snow on branches
    draw_set_color(make_color_rgb(215, 222, 232));
    draw_set_alpha(0.5);
    draw_triangle(_tx - 28, 340, _tx, 308, _tx + 28, 340, false);
    draw_triangle(_tx - 22, 315, _tx, 285, _tx + 22, 315, false);
    draw_set_alpha(1);
    draw_set_color(make_color_rgb(38, 50, 42));
}

// Falling snow (update particle positions)
for (var _si = 0; _si < array_length(snow); _si++) {
    var _sp = snow[_si];
    _sp.y += _sp.speed;
    _sp.x += _sp.drift;
    if (_sp.y > _h) { _sp.y = -4; _sp.x = irandom(_w); }
    if (_sp.x > _w) _sp.x = 0;
    if (_sp.x < 0)  _sp.x = _w;
    draw_set_color(c_white);
    draw_set_alpha(0.7);
    draw_circle(_sp.x, _sp.y, _sp.size, false);
    draw_set_alpha(1);
}

// Route label
draw_set_color(make_color_rgb(190, 200, 215));
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_text(_w - 16, 12, "Route 6 â€” Highland Pass");

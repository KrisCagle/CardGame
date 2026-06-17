var _t = current_time * 0.001;
var _w = room_width;
var _h = room_height;

// Sky â€” deep volcanic red-orange
draw_set_color(make_color_rgb(80, 25, 10));
draw_rectangle(0, 0, _w, _h * 0.4, false);
// Glow band near horizon (lava light)
draw_set_alpha(0.5);
draw_set_color(make_color_rgb(220, 80, 10));
draw_rectangle(0, _h * 0.28, _w, _h * 0.4, false);
draw_set_alpha(1);

// Volcano silhouette in background
draw_set_color(make_color_rgb(28, 14, 8));
draw_triangle(900, _h * 0.4, 1200, 40, 1500, _h * 0.4, false);
draw_triangle(300, _h * 0.4, 550, 80, 800, _h * 0.4, false);
// Caldera glow at volcano peaks
draw_set_alpha(0.65);
draw_set_color(make_color_rgb(240, 100, 10));
draw_ellipse(1160, 30, 1240, 60, false);
draw_set_alpha(0.3);
draw_ellipse(1120, 20, 1280, 80, false);
draw_set_alpha(0.5);
draw_ellipse(515,  65, 585,  95, false);
draw_set_alpha(0.25);
draw_ellipse(480,  55, 620,  110, false);
draw_set_alpha(1);

// Ground â€” black volcanic rock
draw_set_color(make_color_rgb(22, 14, 10));
draw_rectangle(0, _h * 0.4, _w, _h, false);
// Rock texture cracks
draw_set_color(make_color_rgb(14, 8, 4));
for (var _ri = 0; _ri < 14; _ri++) {
    var _rx = _ri * 148 + 20;
    draw_line_width(_rx, _h * 0.42, _rx + 90 + sin(_ri) * 30, _h * 0.55, 2);
}

// Lava flows â€” glowing rivers between rocks
var _lava = [[80, 460, 280, 480], [450, 490, 650, 505], [820, 455, 1020, 475],
             [1190, 480, 1390, 495], [1560, 460, 1780, 478], [1900, 490, 2040, 505]];
for (var _li = 0; _li < array_length(_lava); _li++) {
    var _l    = _lava[_li];
    var _flow = sin(_t * 1.5 + _li * 0.8) * 0.1 + 0.85;
    draw_set_color(make_color_rgb(220, 70, 5));
    draw_rectangle(_l[0], _l[1], _l[2], _l[3], false);
    draw_set_alpha(_flow * 0.7);
    draw_set_color(make_color_rgb(255, 180, 30));
    draw_rectangle(_l[0] + 8, _l[1] + 4, _l[2] - 8, _l[3] - 4, false);
    draw_set_alpha(1);
}

// BUILDINGS â€” dark stone, forge-like
var _bdata = [
    [180, 200, 144, 100],  // [x, y-top, width, height]
    [400, 210, 130, 110],
    [820, 205, 120, 105],
];
for (var _bi = 0; _bi < array_length(_bdata); _bi++) {
    var _bx = _bdata[_bi][0];
    var _by = _bdata[_bi][1];
    var _bw = _bdata[_bi][2];
    var _bh2 = _bdata[_bi][3];
    draw_set_color(make_color_rgb(30, 18, 12));
    draw_rectangle(_bx - _bw/2, _by, _bx + _bw/2, _by + _bh2, false);
    // Flat stone roof with chimney
    draw_set_color(make_color_rgb(20, 12, 8));
    draw_rectangle(_bx - _bw/2 - 8, _by - 8, _bx + _bw/2 + 8, _by + 2, false);
    // Chimney with glow
    draw_set_color(make_color_rgb(24, 14, 8));
    draw_rectangle(_bx + 20, _by - 35, _bx + 38, _by, false);
    var _cf = sin(_t * 6 + _bi) * 0.2 + 0.7;
    draw_set_alpha(_cf * 0.8);
    draw_set_color(make_color_rgb(255, 120, 20));
    draw_circle(_bx + 29, _by - 38, 8, false);
    draw_set_alpha(1);
    // Window glow
    draw_set_alpha(0.6);
    draw_set_color(make_color_rgb(255, 140, 30));
    draw_rectangle(_bx - 20, _by + 20, _bx - 4, _by + 50, false);
    draw_rectangle(_bx + 4,  _by + 20, _bx + 20, _by + 50, false);
    draw_set_alpha(1);
    // Door
    draw_set_color(make_color_rgb(16, 10, 6));
    draw_rectangle(_bx - 14, _by + _bh2 - 44, _bx + 14, _by + _bh2, false);
}

// Shop sign
draw_set_color(make_color_rgb(50, 28, 14));
draw_rectangle(108, 208, 252, 224, false);
draw_set_color(make_color_rgb(220, 140, 60));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(180, 216, "SHOP");

// Hospital cross
draw_set_color(make_color_rgb(180, 60, 60));
draw_rectangle(388, 218, 412, 228, false);
draw_rectangle(395, 212, 405, 234, false);

// Ground path â€” worn black stone
draw_set_color(make_color_rgb(32, 18, 12));
draw_rectangle(0, 360, _w, 410, false);
// Heat shimmer on ground
for (var _hi = 0; _hi < 8; _hi++) {
    var _hx  = _hi * 264 + 60;
    var _ha  = sin(_t * 3 + _hi * 1.1) * 0.03 + 0.05;
    draw_set_alpha(_ha);
    draw_set_color(make_color_rgb(255, 100, 20));
    draw_ellipse(_hx, 355, _hx + 140, 370, false);
    draw_set_alpha(1);
}

// Ash particles falling upward (from lava heat)
for (var _ai = 0; _ai < array_length(ash); _ai++) {
    var _ap = ash[_ai];
    _ap.y -= _ap.speed;
    _ap.x += _ap.drift;
    if (_ap.y < 0) { _ap.y = _h; _ap.x = irandom(_w); }
    if (_ap.x > _w) _ap.x = 0;
    if (_ap.x < 0)  _ap.x = _w;
    draw_set_alpha(0.45);
    draw_set_color(make_color_rgb(80, 60, 50));
    draw_circle(_ap.x, _ap.y, _ap.size, false);
    draw_set_alpha(1);
}

// Town name
draw_set_color(make_color_rgb(240, 120, 40));
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(_w / 2, 10, "CINDER REACH");
draw_set_color(make_color_rgb(180, 80, 30));
draw_text(_w / 2, 30, "Settlement at the Caldera's Edge");

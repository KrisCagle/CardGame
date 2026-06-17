var _t  = current_time * 0.001;
var _w  = room_width;
var _h  = room_height;
var _wh = _w * 0.5;

// Sky â€” deep void, almost black with faint purple
draw_set_color(make_color_rgb(8, 5, 14));
draw_rectangle(0, 0, _w, _h, false);

// The Codex â€” massive structure far in the background, dead-center
// It looks like an ancient open book made of black stone, taller than any building
var _cx = _wh;
var _cy = _h * 0.38;
// Outer glow â€” ancient purple-white energy
draw_set_alpha(0.08 + sin(_t * 1.8) * 0.04);
draw_set_color(make_color_rgb(160, 100, 255));
draw_ellipse(_cx - 160, _cy - 180, _cx + 160, _cy + 50, false);
draw_set_alpha(1);

// Left stone cover of the Codex
draw_set_color(make_color_rgb(14, 10, 18));
draw_rectangle(_cx - 130, _cy - 160, _cx - 6, _cy + 40, false);
// Right stone cover
draw_rectangle(_cx + 6, _cy - 160, _cx + 130, _cy + 40, false);
// Spine â€” glowing
draw_set_color(make_color_rgb(90, 50, 160));
draw_rectangle(_cx - 8, _cy - 165, _cx + 8, _cy + 42, false);
// Pages visible â€” faint warm glow between covers
draw_set_alpha(0.22 + sin(_t * 2.1) * 0.08);
draw_set_color(make_color_rgb(220, 200, 255));
draw_rectangle(_cx - 5, _cy - 158, _cx + 5, _cy + 38, false);
draw_set_alpha(1);

// Rune carvings on left cover
draw_set_color(make_color_rgb(70, 45, 120));
draw_rectangle(_cx - 110, _cy - 140, _cx - 80, _cy - 138, false);
draw_rectangle(_cx - 100, _cy - 120, _cx - 70, _cy - 118, false);
draw_rectangle(_cx - 115, _cy - 100, _cx - 85, _cy - 98, false);
draw_rectangle(_cx - 105, _cy - 80,  _cx - 75, _cy - 78, false);
// Right cover
draw_rectangle(_cx + 80, _cy - 140, _cx + 110, _cy - 138, false);
draw_rectangle(_cx + 70, _cy - 120, _cx + 100, _cy - 118, false);
draw_rectangle(_cx + 85, _cy - 100, _cx + 115, _cy - 98, false);
draw_rectangle(_cx + 75, _cy - 80,  _cx + 105, _cy - 78, false);

// Steps leading up to The Codex
draw_set_color(make_color_rgb(18, 14, 22));
for (var _si = 0; _si < 5; _si++) {
    var _sw = 80 + _si * 30;
    draw_rectangle(_cx - _sw, _cy + 40 + _si * 10, _cx + _sw, _cy + 50 + _si * 10, false);
}

// Ground â€” ancient dark stone
draw_set_color(make_color_rgb(14, 11, 16));
draw_rectangle(0, _h * 0.56, _w, _h, false);
draw_set_color(make_color_rgb(20, 16, 22));
for (var _gi = 0; _gi < 14; _gi++) {
    draw_rectangle(_gi * 100, _h * 0.56, _gi * 100 + 80, _h * 0.57, false);
}

// Town buildings â€” somber stone structures, left and right sides
// Left cluster
var _bl = [60, 160, 280, 400];
for (var _bi = 0; _bi < array_length(_bl); _bi++) {
    var _bx  = _bl[_bi];
    var _bh  = 120 + (_bi mod 2) * 40;
    var _btop = _h * 0.56 - _bh;
    draw_set_color(make_color_rgb(18, 14, 20));
    draw_rectangle(_bx, _btop, _bx + 90, _h * 0.56, false);
    // Narrow dark window with faint candlelight
    draw_set_color(make_color_rgb(60, 45, 20));
    draw_rectangle(_bx + 32, _btop + 28, _bx + 58, _btop + 52, false);
    draw_set_alpha(0.45 + sin(_t * 1.5 + _bi) * 0.15);
    draw_set_color(make_color_rgb(200, 140, 60));
    draw_rectangle(_bx + 35, _btop + 30, _bx + 55, _btop + 50, false);
    draw_set_alpha(1);
    // Dark roof
    draw_set_color(make_color_rgb(12, 9, 14));
    draw_triangle(_bx - 4, _btop, _bx + 47, _btop - 30, _bx + 94, _btop, false);
}

// Right cluster
var _br = [860, 970, 1100, 1220];
for (var _bj = 0; _bj < array_length(_br); _bj++) {
    var _brx = _br[_bj];
    var _brh = 110 + (_bj mod 2) * 50;
    var _brtop = _h * 0.56 - _brh;
    draw_set_color(make_color_rgb(18, 14, 20));
    draw_rectangle(_brx, _brtop, _brx + 90, _h * 0.56, false);
    draw_set_color(make_color_rgb(60, 45, 20));
    draw_rectangle(_brx + 32, _brtop + 28, _brx + 58, _brtop + 52, false);
    draw_set_alpha(0.45 + sin(_t * 1.7 + _bj + 1.2) * 0.15);
    draw_set_color(make_color_rgb(200, 140, 60));
    draw_rectangle(_brx + 35, _brtop + 30, _brx + 55, _brtop + 50, false);
    draw_set_alpha(1);
    draw_set_color(make_color_rgb(12, 9, 14));
    draw_triangle(_brx - 4, _brtop, _brx + 47, _brtop - 30, _brx + 94, _brtop, false);
}

// Path to The Codex â€” stone road leading from bottom-center toward the structure
draw_set_color(make_color_rgb(20, 16, 24));
draw_rectangle(_wh - 60, _h * 0.56, _wh + 60, _h, false);
// Road markings
draw_set_color(make_color_rgb(28, 22, 32));
for (var _ri = 0; _ri < 8; _ri++) {
    draw_rectangle(_wh - 45, _h * 0.58 + _ri * 50, _wh + 45, _h * 0.58 + _ri * 50 + 38, false);
}

// Floating motes near The Codex â€” drifting upward
for (var _mi = 0; _mi < array_length(motes); _mi++) {
    var _m = motes[_mi];
    _m.y -= _m.speed;
    _m.x += _m.drift;
    if (_m.y < -4) { _m.y = _h * 0.5; _m.x = _cx - 200 + irandom(400); }
    draw_set_alpha(_m.alpha * (0.6 + sin(_t * 2.0 + _mi) * 0.4));
    draw_set_color(make_color_rgb(_m.hue_r, _m.hue_g, _m.hue_b));
    draw_circle(_m.x, _m.y, _m.size, false);
    draw_set_alpha(1);
}

// Shop sign (left side, visible marker)
draw_set_color(make_color_rgb(30, 22, 10));
draw_rectangle(162, _h * 0.56 - 75, 230, _h * 0.56 - 52, false);
draw_set_color(make_color_rgb(160, 130, 60));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(196, _h * 0.56 - 63, "SHOP");

// Hospital cross (right side)
draw_set_color(make_color_rgb(180, 50, 50));
draw_rectangle(912, _h * 0.56 - 68, 938, _h * 0.56 - 44, false);
draw_rectangle(900, _h * 0.56 - 60, 950, _h * 0.56 - 52, false);

// Title
draw_set_color(make_color_rgb(180, 155, 220));
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(_wh, 12, "THE THRESHOLD");
draw_set_color(make_color_rgb(110, 90, 150));
draw_text(_wh, 34, "Where the Road Ends");

var _t = current_time * 0.001;
var _w = room_width;
var _h = room_height;

// Ceiling — high vaulted stone, deep purple-black
draw_set_color(make_color_rgb(10, 7, 18));
draw_rectangle(0, 0, _w, _h * 0.22, false);

// Vaulted arch ribs along the ceiling
draw_set_color(make_color_rgb(22, 16, 34));
for (var _ai = 0; _ai < 11; _ai++) {
    var _ax = _ai * 210 - 10;
    draw_rectangle(_ax, 0, _ax + 14, _h * 0.22, false);
    // Arch curve (fake)
    draw_ellipse(_ax - 80, _h * 0.12, _ax + 80 + 14, _h * 0.26, true);
}

// Upper walls — carved stone
draw_set_color(make_color_rgb(16, 12, 24));
draw_rectangle(0, _h * 0.22, _w, _h * 0.40, false);

// Rune inscriptions on upper walls — glowing lines
var _rune_pulse = 0.5 + sin(_t * 1.4) * 0.3;
draw_set_alpha(_rune_pulse);
draw_set_color(make_color_rgb(140, 80, 220));
for (var _ri = 0; _ri < 18; _ri++) {
    var _rx = _ri * 118 + 20;
    var _ry = _h * 0.26 + (_ri mod 3) * 22;
    var _rw = 40 + (_ri mod 4) * 15;
    draw_rectangle(_rx, _ry, _rx + _rw, _ry + 4, false);
}
draw_set_alpha(1);

// Bookshelves — left and right walls (stacked card-books)
// Left shelf cluster
var _shelf_colors = [
    make_color_rgb(45, 30, 60),
    make_color_rgb(30, 20, 50),
    make_color_rgb(55, 35, 70),
    make_color_rgb(35, 25, 55),
];
for (var _si = 0; _si < 5; _si++) {
    var _sx = _si * 200 + 40;
    var _sy = _h * 0.40;
    // Shelf board
    draw_set_color(make_color_rgb(28, 20, 14));
    draw_rectangle(_sx - 4, _sy + 86, _sx + 110, _sy + 92, false);
    draw_rectangle(_sx - 4, _sy + 44, _sx + 110, _sy + 50, false);
    // Card-books on shelf
    for (var _bi = 0; _bi < 6; _bi++) {
        var _bx   = _sx + _bi * 17;
        var _bcol = _shelf_colors[(_si + _bi) mod 4];
        draw_set_color(_bcol);
        draw_rectangle(_bx, _sy + 50, _bx + 14, _sy + 86, false);
        // Spine glow on some
        if ((_bi + _si) mod 3 == 0) {
            draw_set_alpha(0.5 + sin(_t * 2.2 + _bi + _si) * 0.3);
            draw_set_color(make_color_rgb(180, 120, 255));
            draw_rectangle(_bx + 1, _sy + 52, _bx + 3, _sy + 84, false);
            draw_set_alpha(1);
        }
        // Second row
        var _bcol2 = _shelf_colors[(_si + _bi + 2) mod 4];
        draw_set_color(_bcol2);
        draw_rectangle(_bx, _sy + 8, _bx + 14, _sy + 44, false);
    }
}

// Floor — polished ancient stone, dark with faint grid
draw_set_color(make_color_rgb(12, 9, 18));
draw_rectangle(0, _h * 0.52, _w, _h, false);
draw_set_color(make_color_rgb(18, 13, 26));
for (var _fi = 0; _fi < 22; _fi++) {
    draw_rectangle(_fi * 96, _h * 0.52, _fi * 96 + 80, _h * 0.525, false);
}
// Floor rune glow strip
draw_set_alpha(0.15 + sin(_t * 1.8) * 0.08);
draw_set_color(make_color_rgb(120, 60, 200));
draw_rectangle(0, _h * 0.52, _w, _h * 0.535, false);
draw_set_alpha(1);

// Midground — the path, slightly lighter stone
draw_set_color(make_color_rgb(16, 12, 22));
draw_rectangle(0, _h * 0.44, _w, _h * 0.52, false);

// Floating motes
for (var _mi = 0; _mi < array_length(motes); _mi++) {
    var _m = motes[_mi];
    _m.y -= _m.speed;
    _m.x += _m.drift;
    if (_m.y < -4)  { _m.y = _h; _m.x = irandom(_w); }
    if (_m.x > _w)  _m.x = 0;
    if (_m.x < 0)   _m.x = _w;
    draw_set_alpha(_m.alpha * (0.5 + sin(_t * 1.6 + _mi) * 0.5));
    draw_set_color(make_color_rgb(160, 100, 240));
    draw_circle(_m.x, _m.y, _m.size, false);
    draw_set_alpha(1);
}

// Labels
draw_set_color(make_color_rgb(160, 120, 220));
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(_w * 0.5, 10, "THE CODEX");
draw_set_color(make_color_rgb(100, 75, 155));
draw_text(_w * 0.5, 30, "Act I — The Antechamber");

var _t = current_time * 0.001;
var _w = room_width;
var _h = room_height;

// Sky — transitioning from volcanic red to ancient dark purple-grey
draw_set_color(make_color_rgb(38, 22, 32));
draw_rectangle(0, 0, _w, _h * 0.44, false);
// Horizon: remnant lava glow on the left fading to dark on right
draw_set_alpha(0.35);
draw_set_color(make_color_rgb(160, 50, 10));
draw_rectangle(0, _h * 0.30, 600, _h * 0.44, false);
draw_set_alpha(0.12);
draw_set_color(make_color_rgb(160, 50, 10));
draw_rectangle(600, _h * 0.30, _w, _h * 0.44, false);
draw_set_alpha(1);

// Ground — black ash over ancient stone
draw_set_color(make_color_rgb(18, 15, 14));
draw_rectangle(0, _h * 0.44, _w, _h, false);
// Ash drifts on ground
draw_set_color(make_color_rgb(45, 40, 36));
for (var _ai = 0; _ai < 12; _ai++) {
    var _ax = _ai * 178 + 30;
    draw_ellipse(_ax, _h * 0.46, _ax + 130, _h * 0.52, false);
}

// Ancient stone ruins along the road edges — crumbled walls
var _ruin_x = [60, 200, 520, 780, 1060, 1380, 1660, 1900];
for (var _ri = 0; _ri < array_length(_ruin_x); _ri++) {
    var _rx  = _ruin_x[_ri];
    var _rh  = 80 + (_ri mod 3) * 30;
    var _rtop = _h * 0.44 - _rh;
    draw_set_color(make_color_rgb(28, 24, 22));
    draw_rectangle(_rx, _rtop, _rx + 40, _h * 0.44, false);
    // Crumbled top
    draw_set_color(make_color_rgb(22, 18, 16));
    draw_rectangle(_rx - 6, _rtop - 12, _rx + 18, _rtop + 8, false);
    draw_rectangle(_rx + 20, _rtop - 8, _rx + 46, _rtop + 4, false);
    // Worn carvings on stone (lines)
    draw_set_color(make_color_rgb(35, 30, 28));
    draw_rectangle(_rx + 6,  _rtop + 16, _rx + 34, _rtop + 18, false);
    draw_rectangle(_rx + 6,  _rtop + 28, _rx + 28, _rtop + 30, false);
}

// Distant silhouette of The Threshold on the right — massive black gate
draw_set_color(make_color_rgb(12, 8, 10));
// Gate arch visible in far distance
draw_rectangle(1700, 180, 1830, 360, false); // left pillar
draw_rectangle(1900, 180, 2030, 360, false); // right pillar
draw_rectangle(1700, 180, 2030, 220, false); // arch top
// Gate glow — very faint purple, something ancient beyond
draw_set_alpha(0.18);
draw_set_color(make_color_rgb(120, 60, 180));
draw_rectangle(1830, 220, 1900, 360, false);
draw_set_alpha(1);

// Road — black stone slabs
draw_set_color(make_color_rgb(25, 20, 18));
draw_rectangle(0, 375, _w, 425, false);
draw_set_color(make_color_rgb(18, 14, 12));
for (var _si = 0; _si < 20; _si++) {
    draw_rectangle(_si * 106, 380, _si * 106 + 90, 392, false);
    draw_rectangle(_si * 106 + 50, 400, _si * 106 + 100, 412, false);
}

// Falling ash
for (var _fi = 0; _fi < array_length(ash); _fi++) {
    var _ap = ash[_fi];
    _ap.y += _ap.speed;
    _ap.x += _ap.drift;
    if (_ap.y > _h) { _ap.y = -4; _ap.x = irandom(_w); }
    if (_ap.x > _w) _ap.x = 0;
    if (_ap.x < 0)  _ap.x = _w;
    draw_set_alpha(_ap.alpha);
    draw_set_color(make_color_rgb(70, 62, 58));
    draw_circle(_ap.x, _ap.y, _ap.size, false);
    draw_set_alpha(1);
}

draw_set_color(make_color_rgb(140, 120, 150));
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_text(_w - 16, 12, "Route 7 — Ashen Road");

var _t   = current_time * 0.001;
var _w   = room_width;
var _h   = room_height;

// Sky — overcast grey-green
draw_set_color(make_color_rgb(58, 68, 52));
draw_rectangle(0, 0, _w, _h * 0.35, false);

// Ground — dark muddy bog
draw_set_color(make_color_rgb(32, 38, 28));
draw_rectangle(0, _h * 0.35, _w, _h, false);

// Murky water pools scattered across the mud
var _pool_data = [
    [160,  480, 90, 28],
    [520,  520, 120, 32],
    [860,  490, 80,  22],
    [1200, 510, 110, 30],
    [1550, 480, 95,  26],
    [1850, 520, 130, 34],
];
for (var _p = 0; _p < array_length(_pool_data); _p++) {
    var _pd   = _pool_data[_p];
    var _ripple = sin(_t * 1.4 + _p * 1.1) * 4;
    draw_set_color(make_color_rgb(28, 45, 35));
    draw_ellipse(_pd[0] - _pd[2], _pd[1] - _pd[3] + _ripple,
                 _pd[0] + _pd[2], _pd[1] + _pd[3] - _ripple, false);
    draw_set_alpha(0.3);
    draw_set_color(make_color_rgb(50, 90, 60));
    draw_ellipse(_pd[0] - _pd[2] * 0.6, _pd[1] - _pd[3] * 0.4,
                 _pd[0] + _pd[2] * 0.6, _pd[1] + _pd[3] * 0.4, false);
    draw_set_alpha(1);
}

// Dead gnarled trees
var _tree_x = [80, 300, 640, 980, 1320, 1680, 1960];
for (var _ti = 0; _ti < array_length(_tree_x); _ti++) {
    var _tx  = _tree_x[_ti];
    var _sway = sin(_t * 0.8 + _ti * 0.9) * 2;
    // Trunk
    draw_set_color(make_color_rgb(25, 22, 18));
    draw_rectangle(_tx - 7, 200, _tx + 7, 420, false);
    // Main branches (crooked)
    draw_line_width(_tx, 240, _tx - 55 + _sway, 180, 4);
    draw_line_width(_tx, 260, _tx + 48 - _sway, 200, 4);
    draw_line_width(_tx, 280, _tx - 30 + _sway, 230, 3);
    // Hanging moss strands
    draw_set_color(make_color_rgb(42, 58, 35));
    draw_set_alpha(0.7);
    var _moss_sway = sin(_t * 0.5 + _ti) * 3;
    draw_line(_tx - 55 + _sway,      180, _tx - 55 + _sway + _moss_sway,      240);
    draw_line(_tx - 55 + _sway + 10, 180, _tx - 55 + _sway + 10 + _moss_sway, 235);
    draw_line(_tx + 48 - _sway,      200, _tx + 48 - _sway + _moss_sway,      258);
    draw_set_alpha(1);
}

// Ground fog rolling across the mud
for (var _fi = 0; _fi < 6; _fi++) {
    var _fx    = (_fi * 380 + _t * 18) mod (_w + 200) - 100;
    var _fog_a = sin(_t * 0.6 + _fi) * 0.07 + 0.18;
    draw_set_alpha(_fog_a);
    draw_set_color(make_color_rgb(100, 130, 90));
    draw_ellipse(_fx - 160, 430, _fx + 160, 490, false);
    draw_set_alpha(1);
}

// Firefly-like wisps (small glowing dots)
for (var _wi = 0; _wi < 12; _wi++) {
    var _wx    = (_wi * 173 + sin(_t * 0.3 + _wi) * 30) mod _w;
    var _wy    = 300 + sin(_t * 1.1 + _wi * 0.7) * 60;
    var _wa    = sin(_t * 2.2 + _wi * 1.3) * 0.35 + 0.45;
    draw_set_alpha(_wa);
    draw_set_color(make_color_rgb(140, 220, 100));
    draw_circle(_wx, _wy, 3, false);
    draw_set_alpha(_wa * 0.3);
    draw_circle(_wx, _wy, 8, false);
    draw_set_alpha(1);
}

// Path — muddy raised walkway
draw_set_color(make_color_rgb(50, 44, 34));
draw_rectangle(0, 360, _w, 430, false);
draw_set_color(make_color_rgb(44, 38, 28));
// Rut marks
for (var _ri = 0; _ri < 16; _ri++) {
    draw_rectangle(_ri * 130, 370, _ri * 130 + 60, 374, false);
}

// Route label
draw_set_color(make_color_rgb(120, 150, 100));
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_text(_w - 16, 12, "Route 4 — Mire Road");

var _t  = current_time * 0.001;
var _w  = room_width;
var _h  = room_height;
var _cx = _w * 0.5;

// Sky â€” deep void but with a warm light source ahead
draw_set_color(make_color_rgb(6, 4, 10));
draw_rectangle(0, 0, _w, _h, false);

// Warm radiance from center â€” The Codex open on its pedestal
var _glow = 0.18 + sin(_t * 1.3) * 0.07;
draw_set_alpha(_glow);
draw_set_color(make_color_rgb(255, 230, 180));
draw_ellipse(_cx - 280, _h * 0.1, _cx + 280, _h * 0.85, false);
draw_set_alpha(_glow * 0.5);
draw_set_color(make_color_rgb(200, 160, 255));
draw_ellipse(_cx - 180, _h * 0.2, _cx + 180, _h * 0.9, false);
draw_set_alpha(1);

// Circular chamber walls
draw_set_color(make_color_rgb(14, 10, 20));
draw_ellipse(_cx - 600, -200, _cx + 600, _h + 200, true);
draw_set_color(make_color_rgb(10, 7, 16));
// Fill inside circle (background)
draw_circle(_cx, _h * 0.5, 500, false);

// Chamber floor â€” circular stone, ornate inlay
draw_set_color(make_color_rgb(16, 12, 24));
draw_rectangle(0, _h * 0.58, _w, _h, false);
// Concentric floor rings
draw_set_color(make_color_rgb(24, 18, 36));
draw_circle(_cx, _h * 0.58, 300, true);
draw_set_color(make_color_rgb(20, 15, 30));
draw_circle(_cx, _h * 0.58, 200, true);
// Floor rune ring
draw_set_alpha(0.25 + sin(_t * 1.5) * 0.15);
draw_set_color(make_color_rgb(220, 160, 255));
draw_circle(_cx, _h * 0.58, 140, true);
draw_set_alpha(1);

// Wall rune carvings â€” circular arrangement
for (var _ri = 0; _ri < 16; _ri++) {
    var _angle = (_ri / 16.0) * (2 * pi);
    var _rx    = _cx + cos(_angle) * 420;
    var _ry    = _h * 0.42 + sin(_angle) * 180;
    if (_ry < 10 || _ry > _h - 10) continue;
    draw_set_alpha(0.2 + sin(_t * 2.0 + _ri * 0.4) * 0.2);
    draw_set_color(make_color_rgb(180, 100, 255));
    draw_circle(_rx, _ry, 6, false);
    draw_set_alpha(0.1);
    draw_circle(_rx, _ry, 12, true);
    draw_set_alpha(1);
}

// The Codex on its pedestal â€” center background
// Pedestal
draw_set_color(make_color_rgb(22, 16, 32));
draw_rectangle(_cx - 45, _h * 0.34, _cx + 45, _h * 0.44, false);
draw_rectangle(_cx - 60, _h * 0.44, _cx + 60, _h * 0.46, false);
// Codex â€” open book, glowing
draw_set_color(make_color_rgb(16, 10, 22));
draw_rectangle(_cx - 55, _h * 0.16, _cx - 4, _h * 0.36, false); // left page
draw_rectangle(_cx + 4,  _h * 0.16, _cx + 55, _h * 0.36, false); // right page
// Spine
draw_set_color(make_color_rgb(120, 70, 200));
draw_rectangle(_cx - 6, _h * 0.14, _cx + 6, _h * 0.36, false);
// Pages â€” warm brilliant glow
draw_set_alpha(0.55 + sin(_t * 2.4) * 0.2);
draw_set_color(make_color_rgb(255, 240, 200));
draw_rectangle(_cx - 52, _h * 0.18, _cx - 6,  _h * 0.35, false);
draw_rectangle(_cx + 6,  _h * 0.18, _cx + 52, _h * 0.35, false);
draw_set_alpha(1);
// Writing lines on pages
draw_set_alpha(0.4);
draw_set_color(make_color_rgb(100, 60, 160));
for (var _wi = 0; _wi < 8; _wi++) {
    var _wy = _h * 0.20 + _wi * 16;
    draw_rectangle(_cx - 48, _wy, _cx - 10, _wy + 2, false);
    draw_rectangle(_cx + 10, _wy, _cx + 48, _wy + 2, false);
}
draw_set_alpha(1);

// Light beam rising from the open Codex
draw_set_alpha(0.1 + sin(_t * 1.8) * 0.05);
draw_set_color(make_color_rgb(255, 230, 180));
draw_triangle(_cx - 30, _h * 0.18, _cx + 30, _h * 0.18, _cx, -60, false);
draw_set_alpha(1);

// Ascending motes of light
for (var _mi = 0; _mi < array_length(motes); _mi++) {
    var _m = motes[_mi];
    _m.y -= _m.speed;
    _m.x += _m.drift;
    if (_m.y < -10) {
        _m.y = _h * 0.55;
        _m.x = _cx + irandom(160) - 80;
    }
    draw_set_alpha(_m.alpha * (0.4 + sin(_t * 2.0 + _mi * 0.3) * 0.6));
    if (_m.warm == 1) {
        draw_set_color(make_color_rgb(255, 220, 160));
    } else {
        draw_set_color(make_color_rgb(200, 140, 255));
    }
    draw_circle(_m.x, _m.y, _m.size, false);
    draw_set_alpha(1);
}

draw_set_color(make_color_rgb(230, 200, 255));
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(_cx, 10, "THE CODEX");
draw_set_color(make_color_rgb(160, 130, 210));
draw_text(_cx, 30, "Act III â€” The Inner Sanctum");

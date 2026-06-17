var _t = current_time * 0.001;
var _w = room_width;
var _h = room_height;

// Void sky â€” deeper and darker than Act 1
draw_set_color(make_color_rgb(5, 3, 12));
draw_rectangle(0, 0, _w, _h, false);

// Broken pillars â€” once grand, now cracked
var _pillar_x = [80, 280, 520, 820, 1120, 1400, 1680, 1900];
for (var _pi = 0; _pi < array_length(_pillar_x); _pi++) {
    var _px  = _pillar_x[_pi];
    var _ph  = 200 + (_pi mod 3) * 50;
    var _ptop = _h * 0.5 - _ph;
    // Base pillar
    draw_set_color(make_color_rgb(20, 15, 28));
    draw_rectangle(_px, _ptop, _px + 38, _h * 0.5, false);
    // Crack lines
    draw_set_color(make_color_rgb(8, 5, 14));
    draw_rectangle(_px + 12, _ptop + 20, _px + 14, _ptop + 80, false);
    draw_rectangle(_px + 22, _ptop + 40, _px + 24, _ptop + 110, false);
    // Broken top â€” pillar cap crumbled
    if (_pi mod 2 == 0) {
        draw_set_color(make_color_rgb(14, 10, 20));
        draw_rectangle(_px - 6, _ptop - 10, _px + 44, _ptop + 12, false);
        // Fallen chunk nearby
        draw_set_color(make_color_rgb(18, 13, 25));
        draw_rectangle(_px + 50, _h * 0.5 - 18, _px + 80, _h * 0.5, false);
    }
    // Rune glow seeping through cracks
    draw_set_alpha(0.3 + sin(_t * 2.0 + _pi) * 0.25);
    draw_set_color(make_color_rgb(180, 80, 255));
    draw_rectangle(_px + 11, _ptop + 22, _px + 15, _ptop + 78, false);
    draw_set_alpha(1);
}

// Floor
draw_set_color(make_color_rgb(9, 7, 15));
draw_rectangle(0, _h * 0.5, _w, _h, false);
// Cracked floor tiles
draw_set_color(make_color_rgb(14, 11, 20));
for (var _ci = 0; _ci < 10; _ci++) {
    var _cfx = _ci * 210 + 30;
    draw_rectangle(_cfx, _h * 0.5, _cfx + 160, _h * 0.505, false);
    draw_rectangle(_cfx + 80, _h * 0.505, _cfx + 82, _h * 0.54, false);
}

// Walls â€” living text pulses across them
draw_set_color(make_color_rgb(12, 9, 20));
draw_rectangle(0, _h * 0.32, _w, _h * 0.5, false);

// Living text â€” lines that shift and pulse
for (var _li = 0; _li < 24; _li++) {
    var _ly    = _h * 0.34 + _li * 7;
    var _lw    = 60 + (_li mod 7) * 25;
    var _lx    = (_li * 88) mod (_w - _lw - 20) + 10;
    var _pulse = 0.15 + sin(_t * 1.6 + _li * 0.4) * 0.15;
    draw_set_alpha(_pulse);
    draw_set_color(make_color_rgb(200, 140, 255));
    draw_rectangle(_lx, _ly, _lx + _lw, _ly + 2, false);
    draw_set_alpha(1);
}

// Background â€” midground path
draw_set_color(make_color_rgb(11, 8, 18));
draw_rectangle(0, _h * 0.44, _w, _h * 0.5, false);

// Floating pages
for (var _fi = 0; _fi < array_length(pages); _fi++) {
    var _p = pages[_fi];
    _p.x    += _p.speed_x;
    _p.y    += _p.speed_y;
    _p.angle += _p.angle_speed;
    if (_p.x > _w + 20) _p.x = -20;
    if (_p.x < -20)     _p.x = _w + 20;
    if (_p.y > _h + 20) _p.y = -20;
    if (_p.y < -20)     _p.y = _h + 20;
    // Draw a tilted card/page shape
    draw_set_alpha(_p.alpha);
    draw_set_color(make_color_rgb(200, 185, 230));
    // Simple rotated rect approximation using lines
    var _cs = cos(degtorad(_p.angle));
    var _sn = sin(degtorad(_p.angle));
    var _pw = 10; var _ph2 = 14;
    draw_triangle(
        _p.x + _cs * (-_pw) - _sn * (-_ph2),
        _p.y + _sn * (-_pw) + _cs * (-_ph2),
        _p.x + _cs * (_pw)  - _sn * (-_ph2),
        _p.y + _sn * (_pw)  + _cs * (-_ph2),
        _p.x + _cs * _pw    - _sn * _ph2,
        _p.y + _sn * _pw    + _cs * _ph2,
        false
    );
    draw_set_alpha(1);
}

// Ambient glow from deeper in
draw_set_alpha(0.12 + sin(_t * 1.2) * 0.05);
draw_set_color(make_color_rgb(160, 80, 255));
draw_ellipse(_w - 200, _h * 0.3, _w + 100, _h * 0.7, false);
draw_set_alpha(1);

draw_set_color(make_color_rgb(160, 120, 220));
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(_w * 0.5, 10, "THE CODEX");
draw_set_color(make_color_rgb(100, 75, 155));
draw_text(_w * 0.5, 30, "Act II â€” The Archive");

var _t  = current_time * 0.001;
var _w  = room_width;
var _h  = room_height;
var _cx = _w * 0.5;

// Background — warm near-black
draw_set_alpha(fade_in);
draw_set_color(make_color_rgb(8, 5, 10));
draw_rectangle(0, 0, _w, _h, false);

// Warm light radiance at center
draw_set_alpha(fade_in * (0.1 + sin(_t * 1.2) * 0.04));
draw_set_color(make_color_rgb(255, 210, 140));
draw_ellipse(_cx - 300, _h * 0.2, _cx + 300, _h * 0.8, false);
draw_set_alpha(1);

// Floating motes
draw_set_alpha(fade_in);
for (var _mi = 0; _mi < array_length(motes); _mi++) {
    var _m = motes[_mi];
    _m.y -= _m.speed;
    _m.x += _m.drift;
    if (_m.y < -6) { _m.y = _h + 6; _m.x = irandom(_w); }
    var _ma = _m.alpha * (0.4 + sin(_t * 1.8 + _mi * 0.25) * 0.6);
    draw_set_alpha(fade_in * _ma);
    if (_m.warm == 1) draw_set_color(make_color_rgb(255, 215, 140));
    else              draw_set_color(make_color_rgb(200, 140, 255));
    draw_circle(_m.x, _m.y, _m.size, false);
}
draw_set_alpha(1);

// Title
draw_set_alpha(fade_in);
draw_set_color(make_color_rgb(255, 230, 180));
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(-1);
draw_text(_cx, 60, "THE END");
draw_set_alpha(1);

// Lore lines — revealed one by one
var _line_start_y = 160;
var _line_spacing = 42;
for (var _li = 0; _li <= line_index; _li++) {
    var _line = lore_lines[_li];
    if (_line == "") continue;
    // Last line just revealed fades in
    var _line_alpha = 1.0;
    if (_li == line_index) {
        _line_alpha = line_timer / 60.0;
        if (_line_alpha > 1) _line_alpha = 1;
    }
    draw_set_alpha(fade_in * _line_alpha);
    if (_li < 8) {
        draw_set_color(make_color_rgb(210, 190, 240));
    } else {
        draw_set_color(make_color_rgb(255, 225, 160));
    }
    draw_text(_cx, _line_start_y + _li * _line_spacing, _line);
}
draw_set_alpha(1);

// "Thank you for playing" — shows after all lines revealed
if (line_index >= array_length(lore_lines) - 1 && line_timer > 240) {
    var _ty_alpha = (line_timer - 240) / 120.0;
    if (_ty_alpha > 1) _ty_alpha = 1;
    draw_set_alpha(fade_in * _ty_alpha);
    draw_set_color(make_color_rgb(160, 140, 200));
    draw_text(_cx, _h - 80, "Thank you for playing.");
    draw_set_alpha(1);

    // "Play again" prompt appears after everything is shown
    if (line_timer > 360) {
        var _pa = (line_timer - 360) / 90.0;
        if (_pa > 1) _pa = 1;
        draw_set_alpha(_pa * (0.6 + sin(current_time * 0.003) * 0.4));
        draw_set_color(make_color_rgb(200, 180, 240));
        draw_text(_cx, _h - 48, "[ Space ] — Return to world");
        draw_set_alpha(1);
    }
}

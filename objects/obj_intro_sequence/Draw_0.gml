var _t  = current_time * 0.001;
var _w  = room_width;
var _h  = room_height;
var _cx = _w * 0.5;
var _cy = _h * 0.5;

// DIAGNOSTIC: bright red rect — remove once confirmed working
draw_set_alpha(1);
draw_set_color(make_color_rgb(255, 0, 0));
draw_rectangle(0, 0, 200, 100, false);

// Deep black background
draw_set_color(make_color_rgb(4, 3, 8));
draw_rectangle(0, 0, _w, _h, false);

// Drifting ghost-card shapes (shared by both modes)
for (var _i = 0; _i < array_length(cards_bg); _i++) {
    var _c    = cards_bg[_i];
    _c.y     -= _c.speed;
    _c.x     += _c.drift;
    _c.angle += _c.angle_spd;
    if (_c.y < -_c.h - 10) { _c.y = _h + _c.h; _c.x = irandom(_w); }
    if (_c.x >  _w + 20)   _c.x = -20;
    if (_c.x < -20)         _c.x =  _w + 20;
    var _cs = cos(degtorad(_c.angle));
    var _sn = sin(degtorad(_c.angle));
    var _hw = _c.w * 0.5;
    var _hh = _c.h * 0.5;
    var _x1 = _c.x + _cs * (-_hw) - _sn * (-_hh);
    var _y1 = _c.y + _sn * (-_hw) + _cs * (-_hh);
    var _x2 = _c.x + _cs * ( _hw) - _sn * (-_hh);
    var _y2 = _c.y + _sn * ( _hw) + _cs * (-_hh);
    var _x3 = _c.x + _cs * ( _hw) - _sn * ( _hh);
    var _y3 = _c.y + _sn * ( _hw) + _cs * ( _hh);
    var _x4 = _c.x + _cs * (-_hw) - _sn * ( _hh);
    var _y4 = _c.y + _sn * (-_hw) + _cs * ( _hh);
    draw_set_alpha(_c.alpha * (mode == "menu" ? menu_alpha : fade_in * (1.0 - fade_out)));
    draw_set_color(make_color_rgb(160, 120, 220));
    draw_triangle(_x1, _y1, _x2, _y2, _x3, _y3, true);
    draw_triangle(_x1, _y1, _x3, _y3, _x4, _y4, true);
    draw_set_alpha(1);
}

// Central glow
draw_set_alpha(0.06 * (mode == "menu" ? menu_alpha : fade_in * (1.0 - fade_out)));
draw_set_color(make_color_rgb(140, 100, 200));
draw_ellipse(_cx - 300, _cy - 200, _cx + 300, _cy + 200, false);
draw_set_alpha(1);

// -------------------------------------------------------
// MENU MODE
// -------------------------------------------------------
if (mode == "menu") {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // Title
    draw_set_alpha(menu_alpha);
    draw_set_color(make_color_rgb(240, 230, 255));
    draw_text_transformed(_cx, _cy - 160, "CARD WEAVER", 2.2, 2.2, 0);

    // Subtitle
    draw_set_alpha(menu_alpha * 0.55);
    draw_set_color(make_color_rgb(180, 160, 210));
    draw_text(_cx, _cy - 100, "A journey to the First Weaver's Codex");
    draw_set_alpha(1);

    // Horizontal divider
    draw_set_alpha(menu_alpha * 0.25);
    draw_set_color(make_color_rgb(140, 100, 200));
    draw_line(_cx - 160, _cy - 72, _cx + 160, _cy - 72);
    draw_set_alpha(1);

    // CONTINUE button
    var _cont_sel = (menu_sel == 0);
    var _cont_pulse = _cont_sel ? (0.75 + sin(_t * 3.0) * 0.25) : 0.45;
    draw_set_alpha(menu_alpha * _cont_pulse);
    if (_cont_sel) {
        draw_set_color(make_color_rgb(220, 190, 255));
        // Highlight box
        draw_set_alpha(menu_alpha * 0.12);
        draw_set_color(make_color_rgb(160, 120, 220));
        draw_rectangle(_cx - 110, _cy - 26, _cx + 110, _cy + 6, false);
        draw_set_alpha(menu_alpha * _cont_pulse);
        draw_set_color(make_color_rgb(220, 190, 255));
    } else {
        draw_set_color(make_color_rgb(140, 120, 170));
    }
    draw_text_transformed(_cx, _cy - 10, "CONTINUE", 1.3, 1.3, 0);
    draw_set_alpha(1);

    // NEW GAME button
    var _new_sel = (menu_sel == 1);
    var _new_pulse = _new_sel ? (0.75 + sin(_t * 3.0) * 0.25) : 0.45;
    draw_set_alpha(menu_alpha * _new_pulse);
    if (_new_sel) {
        draw_set_color(make_color_rgb(220, 190, 255));
        draw_set_alpha(menu_alpha * 0.12);
        draw_set_color(make_color_rgb(160, 120, 220));
        draw_rectangle(_cx - 110, _cy + 30, _cx + 110, _cy + 62, false);
        draw_set_alpha(menu_alpha * _new_pulse);
        draw_set_color(make_color_rgb(220, 190, 255));
    } else {
        draw_set_color(make_color_rgb(140, 120, 170));
    }
    draw_text_transformed(_cx, _cy + 46, "NEW GAME", 1.3, 1.3, 0);
    draw_set_alpha(1);

    // Nav hint
    draw_set_alpha(menu_alpha * 0.3);
    draw_set_color(make_color_rgb(120, 100, 150));
    draw_set_valign(fa_bottom);
    draw_text(_cx, _h - 20, "[ Up / Down ] â€” select     [ Space ] â€” confirm");
    draw_set_alpha(1);
    exit;
}

// -------------------------------------------------------
// SLIDES MODE
// -------------------------------------------------------
var _slide = slides[slide_index];
var _lines = _slide.lines;
var _text_alpha = fade_in * (1.0 - fade_out);

var _is_last = (slide_index == array_length(slides) - 1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _line_spacing = 40;
var _total_h = (array_length(_lines) - 1) * _line_spacing;
var _start_y = _cy - _total_h * 0.5;

for (var _li = 0; _li < array_length(_lines); _li++) {
    var _line = _lines[_li];
    if (_line == "") continue;

    if (_is_last) {
        draw_set_alpha(_text_alpha * (0.55 + sin(_t * 2.2) * 0.45));
        draw_set_color(make_color_rgb(200, 175, 240));
    } else {
        draw_set_alpha(_text_alpha);
        draw_set_color(make_color_rgb(210, 200, 230));
    }

    draw_text(_cx, _start_y + _li * _line_spacing, _line);
    draw_set_alpha(1);
}

// Skip hint on non-last slides
if (!_is_last && slide_timer > 60) {
    draw_set_alpha(_text_alpha * 0.35);
    draw_set_color(make_color_rgb(120, 100, 160));
    draw_set_valign(fa_bottom);
    draw_text(_cx, _h - 20, "[ Space ] â€” Skip");
    draw_set_alpha(1);
}

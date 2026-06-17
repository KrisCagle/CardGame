var _t = current_time * 0.001;
var _w = room_width;
var _h = room_height;

// Sky â€” deep cold blue-grey dusk
draw_set_color(make_color_rgb(100, 118, 148));
draw_rectangle(0, 0, _w, _h * 0.35, false);
// Aurora shimmer (faint greens and blues high up)
for (var _ai = 0; _ai < 3; _ai++) {
    var _aa = sin(_t * 0.4 + _ai * 1.3) * 0.06 + 0.08;
    draw_set_alpha(_aa);
    draw_set_color(make_color_rgb(80, 200, 160));
    draw_rectangle(_ai * 500, 20 + _ai * 12, _ai * 500 + 420, 70 + _ai * 12, false);
    draw_set_alpha(1);
}

// Ground â€” deep snow cover
draw_set_color(make_color_rgb(195, 210, 228));
draw_rectangle(0, _h * 0.35, _w, _h, false);
// Snow depth shading
draw_set_color(make_color_rgb(175, 192, 212));
draw_rectangle(0, _h * 0.60, _w, _h, false);

// Frozen lake/pond â€” left of center
draw_set_color(make_color_rgb(148, 175, 210));
draw_ellipse(140, 480, 480, 560, false);
// Ice cracks
draw_set_color(make_color_rgb(120, 150, 185));
draw_set_alpha(0.6);
draw_line(200, 510, 260, 540);
draw_line(260, 540, 310, 520);
draw_line(320, 495, 380, 530);
draw_set_alpha(1);

// BUILDINGS â€” stone and ice construction
// Building 1: Shop (heavy stone walls, snow on roof)
var _s1x = 180;
draw_set_color(make_color_rgb(88, 92, 102));  // dark stone
draw_rectangle(_s1x - 72, 210, _s1x + 72, 395, false);
draw_set_color(make_color_rgb(70, 74, 84));
draw_triangle(_s1x - 88, 210, _s1x + 88, 210, _s1x, 148, false);  // steep roof
// Snow on roof
draw_set_color(make_color_rgb(215, 225, 238));
draw_triangle(_s1x - 88, 212, _s1x + 88, 212, _s1x, 152, false);
draw_set_alpha(0.6);
draw_triangle(_s1x - 88, 212, _s1x + 88, 212, _s1x, 185, false);
draw_set_alpha(1);
// Door
draw_set_color(make_color_rgb(46, 38, 28));
draw_rectangle(_s1x - 18, 335, _s1x + 18, 395, false);
// Window (glowing warm)
draw_set_color(make_color_rgb(200, 170, 80));
draw_set_alpha(0.75);
draw_rectangle(_s1x - 30, 245, _s1x - 6, 295, false);
draw_rectangle(_s1x + 6, 245, _s1x + 30, 295, false);
draw_set_alpha(1);
// Shop sign
draw_set_color(make_color_rgb(60, 50, 38));
draw_rectangle(_s1x - 30, 218, _s1x + 30, 234, false);
draw_set_color(make_color_rgb(220, 200, 140));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(_s1x, 226, "SHOP");

// Building 2: Hospital
var _h2x = 400;
draw_set_color(make_color_rgb(82, 90, 100));
draw_rectangle(_h2x - 66, 220, _h2x + 66, 395, false);
draw_set_color(make_color_rgb(64, 72, 82));
draw_triangle(_h2x - 82, 220, _h2x + 82, 220, _h2x, 156, false);
draw_set_color(make_color_rgb(215, 225, 238));
draw_triangle(_h2x - 82, 222, _h2x + 82, 222, _h2x, 160, false);
draw_set_alpha(0.55);
draw_triangle(_h2x - 82, 222, _h2x + 82, 222, _h2x, 192, false);
draw_set_alpha(1);
draw_set_color(make_color_rgb(46, 38, 28));
draw_rectangle(_h2x - 18, 335, _h2x + 18, 395, false);
draw_set_color(make_color_rgb(200, 170, 80));
draw_set_alpha(0.7);
draw_rectangle(_h2x - 28, 248, _h2x + 28, 295, false);
draw_set_alpha(1);
draw_set_color(make_color_rgb(60, 160, 80));
draw_rectangle(_h2x - 12, 228, _h2x + 12, 238, false);
draw_rectangle(_h2x - 20, 231, _h2x + 20, 235, false);

// Building 3: NPC house (right side)
var _h3x = 820;
draw_set_color(make_color_rgb(84, 88, 98));
draw_rectangle(_h3x - 60, 230, _h3x + 60, 395, false);
draw_set_color(make_color_rgb(66, 70, 80));
draw_triangle(_h3x - 76, 230, _h3x + 76, 230, _h3x, 165, false);
draw_set_color(make_color_rgb(215, 225, 238));
draw_triangle(_h3x - 76, 232, _h3x + 76, 232, _h3x, 168, false);
draw_set_alpha(0.55);
draw_triangle(_h3x - 76, 232, _h3x + 76, 232, _h3x, 200, false);
draw_set_alpha(1);
draw_set_color(make_color_rgb(46, 38, 28));
draw_rectangle(_h3x - 16, 338, _h3x + 16, 395, false);
draw_set_color(make_color_rgb(200, 170, 80));
draw_set_alpha(0.7);
draw_rectangle(_h3x - 26, 252, _h3x + 26, 295, false);
draw_set_alpha(1);

// Ice stalagmites/formations on right side (near where Frost Specter lurks)
var _ice_x = [1050, 1120, 1180, 1250, 1310];
var _ice_h  = [80,   110,  95,   125,  85];
for (var _ii = 0; _ii < array_length(_ice_x); _ii++) {
    var _ix = _ice_x[_ii];
    var _ih = _ice_h[_ii];
    var _shine = sin(_t * 1.5 + _ii * 0.9) * 0.1 + 0.75;
    draw_set_alpha(_shine);
    draw_set_color(make_color_rgb(160, 200, 240));
    draw_triangle(_ix - 18, 395, _ix, 395 - _ih, _ix + 18, 395, false);
    // Highlight
    draw_set_color(make_color_rgb(210, 235, 255));
    draw_triangle(_ix - 6, 395 - _ih * 0.3, _ix, 395 - _ih, _ix + 6, 395 - _ih * 0.3, false);
    draw_set_alpha(1);
}

// Snow on ground â€” surface layer
draw_set_color(make_color_rgb(215, 225, 238));
draw_rectangle(0, 390, _w, 410, false);

// Falling snow
for (var _si = 0; _si < array_length(snow); _si++) {
    var _sp = snow[_si];
    _sp.y += _sp.speed;
    _sp.x += _sp.drift;
    if (_sp.y > _h) { _sp.y = -4; _sp.x = irandom(_w); }
    if (_sp.x > _w) _sp.x = 0;
    if (_sp.x < 0)  _sp.x = _w;
    draw_set_color(c_white);
    draw_set_alpha(0.8);
    draw_circle(_sp.x, _sp.y, _sp.size, false);
    draw_set_alpha(1);
}

// Town name
draw_set_color(make_color_rgb(210, 225, 245));
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(_w / 2, 10, "FROSTMERE");
draw_set_color(make_color_rgb(160, 180, 210));
draw_text(_w / 2, 30, "Last Town Before the Ice");

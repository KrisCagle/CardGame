var _t  = current_time * 0.001;
var _w  = room_width;
var _h  = room_height;

// Deep forest floor â€” dark earth
draw_set_color(make_color_rgb(35, 55, 30));
draw_rectangle(0, 0, _w, _h, false);

// Sky glimpse at top
draw_set_color(make_color_rgb(130, 185, 120));
draw_rectangle(0, 0, _w, 140, false);
draw_set_color(make_color_rgb(80, 130, 75));
draw_rectangle(0, 90, _w, 160, false);

// Canopy â€” rows of overlapping tree tops
var _canopy_cols = [
    [  0, 100, 180], [130,  90, 200], [260, 110, 170], [400,  95, 190],
    [540, 105, 185], [680,  90, 200], [820, 100, 175], [960, 110, 180],
    [1100,  95, 200],[1250, 100, 195],[1400,  90, 185],[1550, 105, 200],
    [1700, 100, 180],[1830,  95, 195]
];
var _c1 = make_color_rgb(35, 90, 38);
var _c2 = make_color_rgb(50, 115, 50);
var _c3 = make_color_rgb(70, 145, 62);
for (var _i = 0; _i < array_length(_canopy_cols); _i++) {
    var _cx = _canopy_cols[_i][0];
    var _cy = _canopy_cols[_i][1];
    var _cr = _canopy_cols[_i][2];
    draw_set_color((_i & 1) == 0 ? _c1 : _c2);
    draw_ellipse(_cx - _cr, _cy - _cr * 0.65, _cx + _cr, _cy + _cr * 0.55, false);
    draw_set_color(_c3);
    draw_ellipse(_cx - _cr * 0.65, _cy - _cr * 0.8, _cx + _cr * 0.65, _cy + 20, false);
}

// Trunk silhouettes left and right
var _trunks = [
    [80, 180, 450], [200, 170, 460], [1580, 180, 440], [1720, 175, 455],
    [1850, 185, 450],[0, 165, 445],[340, 175, 455],[1450, 170, 450]
];
draw_set_color(make_color_rgb(28, 42, 22));
for (var _i = 0; _i < array_length(_trunks); _i++) {
    var _tx = _trunks[_i][0];
    var _ty = _trunks[_i][1];
    var _tb = _trunks[_i][2];
    draw_rectangle(_tx - 14, _ty, _tx + 14, _tb, false);
    // Slight root spread at base
    draw_triangle(_tx - 24, _tb, _tx + 24, _tb, _tx, _tb - 60, false);
}

// Ground path â€” dirt trail through the middle
draw_set_color(make_color_rgb(65, 52, 38));
draw_ellipse(400, 500, 1450, 680, false);
draw_set_color(make_color_rgb(75, 62, 46));
draw_ellipse(480, 520, 1370, 660, false);

// Undergrowth ferns / bushes along edges
var _fern_x = [50, 150, 300, 420, 1450, 1600, 1700, 1820];
draw_set_color(make_color_rgb(40, 100, 42));
for (var _i = 0; _i < array_length(_fern_x); _i++) {
    var _fx = _fern_x[_i];
    draw_ellipse(_fx - 35, 550, _fx + 35, 610, false);
    draw_ellipse(_fx - 20, 530, _fx + 20, 580, false);
}

// Dappled light shafts from canopy
for (var _i = 0; _i < array_length(shafts); _i++) {
    var _sh = shafts[_i];
    var _pulse = _sh.a * (0.7 + sin(_t * 0.7 + _i * 1.1) * 0.3);
    draw_set_alpha(_pulse);
    draw_set_color(make_color_rgb(210, 240, 170));
    // Tilted shaft as a thin parallelogram
    var _lean = _sh.lean;
    var _sw   = _sh.w;
    draw_triangle(
        _sh.x - _sw + _lean, 60,
        _sh.x + _sw + _lean, 60,
        _sh.x + _sw - _lean * 2, 700,
        false
    );
    draw_set_alpha(1);
}

// Firefly motes
for (var _i = 0; _i < array_length(motes); _i++) {
    var _m = motes[_i];
    _m.y   -= _m.spd;
    _m.x   += _m.drift;
    if (_m.y < -10) { _m.y = _h + 10; _m.x = random(_w); }
    if (_m.x < 0)   _m.x = _w;
    if (_m.x > _w)  _m.x = 0;
    var _ma = _m.alpha * (0.5 + sin(_t * 2.8 + _m.phase) * 0.5);
    draw_set_alpha(_ma);
    draw_set_color(make_color_rgb(200, 255, 150));
    draw_ellipse(_m.x - 3, _m.y - 3, _m.x + 3, _m.y + 3, false);
    draw_set_alpha(1);
}

// Route label
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(make_color_rgb(200, 230, 180));
draw_set_alpha(0.65);
draw_text(room_width * 0.5, 20, "Route 1  â€”  The First Wood");
draw_set_alpha(1);

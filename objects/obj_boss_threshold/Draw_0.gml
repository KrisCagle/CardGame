var _cx = x;
var _cy = y;
var _t  = current_time * 0.001;
var _def = is_defeated();

if (_def) {
    // Defeated â€” just a faint glowing outline on the ground
    draw_set_alpha(0.25 + sin(_t * 1.5) * 0.1);
    draw_set_color(make_color_rgb(180, 120, 255));
    draw_ellipse(_cx - 30, _cy + 2, _cx + 30, _cy + 10, false);
    draw_set_alpha(1);

    draw_set_color(make_color_rgb(150, 110, 200));
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(_cx, _cy - 18, "The Keeper has fallen.");
    exit;
}

// The Keeper â€” a tall figure made of living shadow and card-light
// Tall, gaunt, imposing, cloak made of shifting darkness

var _hover = sin(_t * 2.2) * 5;

// Shadow cloak (wide, flowing)
draw_set_color(make_color_rgb(8, 4, 14));
draw_triangle(
    _cx - 50, _cy + 4,
    _cx + 50, _cy + 4,
    _cx,      _cy - 80 + _hover,
    false
);
// Cloak edge shimmer (purple)
draw_set_alpha(0.4 + sin(_t * 1.8) * 0.2);
draw_set_color(make_color_rgb(100, 50, 180));
draw_triangle(
    _cx - 52, _cy + 6,
    _cx + 52, _cy + 6,
    _cx,      _cy - 82 + _hover,
    true
);
draw_set_alpha(1);

// Body core â€” narrow, elongated
draw_set_color(make_color_rgb(12, 8, 18));
draw_rectangle(_cx - 14, _cy - 70 + _hover, _cx + 14, _cy + 2, false);

// Arms â€” long and angular
draw_set_color(make_color_rgb(10, 6, 16));
draw_rectangle(_cx - 38, _cy - 58 + _hover, _cx - 14, _cy - 50 + _hover, false);
draw_rectangle(_cx - 38, _cy - 58 + _hover, _cx - 34, _cy - 40 + _hover, false);
draw_rectangle(_cx + 14, _cy - 58 + _hover, _cx + 38, _cy - 50 + _hover, false);
draw_rectangle(_cx + 34, _cy - 58 + _hover, _cx + 38, _cy - 40 + _hover, false);

// Head â€” tall angular mask-like face
draw_set_color(make_color_rgb(14, 10, 20));
draw_rectangle(_cx - 16, _cy - 96 + _hover, _cx + 16, _cy - 70 + _hover, false);

// Eyes â€” glowing void-purple orbs
var _eye_pulse = 0.6 + sin(_t * 3.0) * 0.4;
draw_set_alpha(_eye_pulse);
draw_set_color(make_color_rgb(200, 100, 255));
draw_circle(_cx - 7,  _cy - 86 + _hover, 4, false);
draw_circle(_cx + 7,  _cy - 86 + _hover, 4, false);
draw_set_alpha(1);
// Inner eye â€” white void
draw_set_color(make_color_rgb(240, 210, 255));
draw_circle(_cx - 7,  _cy - 86 + _hover, 2, false);
draw_circle(_cx + 7,  _cy - 86 + _hover, 2, false);

// Orbiting cards â€” 4 cards slowly circling
for (var _ci = 0; _ci < 4; _ci++) {
    var _angle = _t * 1.6 + (_ci * pi * 0.5);
    var _ox    = _cx + cos(_angle) * 44;
    var _oy    = _cy - 55 + _hover + sin(_angle) * 24;
    draw_set_color(make_color_rgb(30, 18, 48));
    draw_rectangle(_ox - 7, _oy - 10, _ox + 7, _oy + 10, false);
    draw_set_alpha(0.6 + sin(_t * 2.5 + _ci) * 0.4);
    draw_set_color(make_color_rgb(180, 100, 255));
    draw_rectangle(_ox - 5, _oy - 8, _ox + 5, _oy + 8, false);
    draw_set_alpha(1);
}

// Name + prompt
draw_set_color(make_color_rgb(200, 160, 255));
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(_cx, _cy - 110 + _hover, "THE KEEPER");

if (distance_to_object(obj_player) < 70) {
    draw_set_color(c_white);
    draw_text(_cx, _cy - 122 + _hover, "[Space]");
}

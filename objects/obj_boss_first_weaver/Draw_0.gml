var _cx = x;
var _cy = y;
var _t  = current_time * 0.001;
var _def = is_defeated();

if (_def) {
    // She's at peace â€” a gentle glow remains where she stood
    draw_set_alpha(0.4 + sin(_t * 1.2) * 0.15);
    draw_set_color(make_color_rgb(255, 230, 180));
    draw_ellipse(_cx - 40, _cy - 10, _cx + 40, _cy + 10, false);
    draw_set_alpha(1);
    draw_set_color(make_color_rgb(220, 190, 255));
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(_cx, _cy - 20, "The First Weaver has returned to the Codex.");
    exit;
}

var _hover = sin(_t * 1.8) * 6;

// The First Weaver â€” ancient, luminous, not monstrous
// She floats slightly above the ground

// Light aura â€” warm and vast
draw_set_alpha(0.12 + sin(_t * 1.4) * 0.06);
draw_set_color(make_color_rgb(255, 230, 180));
draw_ellipse(_cx - 80, _cy - 140 + _hover, _cx + 80, _cy + 20 + _hover, false);
draw_set_alpha(1);

// Robes â€” white-silver, flowing, billowing slightly
// Robe base
draw_set_color(make_color_rgb(210, 200, 230));
draw_triangle(
    _cx - 38, _cy + 4 + _hover,
    _cx + 38, _cy + 4 + _hover,
    _cx,      _cy - 60 + _hover,
    false
);
// Robe sheen
draw_set_alpha(0.3);
draw_set_color(make_color_rgb(255, 245, 255));
draw_triangle(
    _cx - 36, _cy + 2 + _hover,
    _cx - 10, _cy + 2 + _hover,
    _cx - 20, _cy - 55 + _hover,
    false
);
draw_set_alpha(1);

// Body
draw_set_color(make_color_rgb(220, 210, 240));
draw_rectangle(_cx - 14, _cy - 68 + _hover, _cx + 14, _cy - 32 + _hover, false);

// Arms â€” outstretched, writing gesture with both hands
draw_set_color(make_color_rgb(215, 200, 235));
// Left arm out + slightly down
draw_rectangle(_cx - 40, _cy - 58 + _hover, _cx - 14, _cy - 50 + _hover, false);
draw_rectangle(_cx - 42, _cy - 58 + _hover, _cx - 38, _cy - 42 + _hover, false);
// Right arm out
draw_rectangle(_cx + 14, _cy - 58 + _hover, _cx + 40, _cy - 50 + _hover, false);
draw_rectangle(_cx + 38, _cy - 58 + _hover, _cx + 42, _cy - 42 + _hover, false);

// Head â€” calm, elder face, eyes bright
draw_set_color(make_color_rgb(200, 175, 155));
draw_circle(_cx, _cy - 82 + _hover, 14, false);

// Long silver hair flowing behind
draw_set_color(make_color_rgb(220, 218, 230));
draw_triangle(
    _cx - 14, _cy - 96 + _hover,
    _cx + 14, _cy - 96 + _hover,
    _cx - 22, _cy - 50 + _hover,
    false
);
draw_triangle(
    _cx,     _cy - 96 + _hover,
    _cx + 14, _cy - 96 + _hover,
    _cx + 20, _cy - 52 + _hover,
    false
);

// Eyes â€” brilliant warm gold
draw_set_color(make_color_rgb(255, 220, 100));
draw_circle(_cx - 5, _cy - 84 + _hover, 3, false);
draw_circle(_cx + 5, _cy - 84 + _hover, 3, false);
// Glow pulse
draw_set_alpha(0.5 + sin(_t * 2.8) * 0.4);
draw_set_color(make_color_rgb(255, 200, 80));
draw_circle(_cx - 5, _cy - 84 + _hover, 5, true);
draw_circle(_cx + 5, _cy - 84 + _hover, 5, true);
draw_set_alpha(1);

// Card crown â€” 6 cards orbiting her head in a halo
for (var _ci = 0; _ci < 6; _ci++) {
    var _angle  = _t * 1.2 + (_ci / 6.0) * (2 * pi);
    var _ox     = _cx + cos(_angle) * 52;
    var _oy     = _cy - 90 + _hover + sin(_angle) * 22;
    // Card face
    draw_set_color(make_color_rgb(230, 215, 255));
    draw_rectangle(_ox - 7, _oy - 10, _ox + 7, _oy + 10, false);
    // Rune on card â€” warm glow
    draw_set_alpha(0.7 + sin(_t * 2.5 + _ci) * 0.3);
    draw_set_color(make_color_rgb(255, 190, 80));
    draw_rectangle(_ox - 4, _oy - 6, _ox + 4, _oy - 4, false);
    draw_rectangle(_ox - 4, _oy - 2, _ox + 4, _oy,     false);
    draw_rectangle(_ox - 4, _oy + 2, _ox + 4, _oy + 4, false);
    draw_set_alpha(1);
}

// Writing light from her right hand â€” she's still writing
draw_set_alpha(0.6 + sin(_t * 3.5) * 0.4);
draw_set_color(make_color_rgb(255, 240, 160));
draw_circle(_cx + 42, _cy - 42 + _hover, 5, false);
draw_set_alpha(1);

// Name + prompt
draw_set_color(make_color_rgb(255, 230, 180));
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(_cx, _cy - 116 + _hover, "THE FIRST WEAVER");

if (distance_to_object(obj_player) < interact_dist) {
    draw_set_color(c_white);
    draw_text(_cx, _cy - 130 + _hover, "[Space]");
}

var _t = current_time * 0.001;

if (is_defeated()) {
    draw_set_alpha(0.25);
    draw_set_color(make_color_rgb(160, 200, 240));
    draw_circle(x, y, 22, false);
    draw_set_alpha(1);
    draw_set_color(make_color_rgb(180, 210, 240));
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(x, y - 28, "Frost Specter (dispersed)");
    exit;
}

var _hover  = sin(_t * 1.4) * 10;
var _wy     = y + _hover;
var _fade   = sin(_t * 2.0) * 0.12 + 0.70;

// Ice crystal shards orbiting the specter
for (var _ci = 0; _ci < 5; _ci++) {
    var _angle = _t * 1.2 + _ci * (2 * pi / 5);
    var _cx    = x    + cos(_angle) * 40;
    var _cy    = _wy  + sin(_angle) * 20;
    var _ca    = sin(_t * 2.8 + _ci) * 0.15 + 0.65;
    draw_set_alpha(_ca);
    draw_set_color(make_color_rgb(160, 210, 245));
    draw_triangle(_cx, _cy - 10, _cx - 6, _cy + 6, _cx + 6, _cy + 6, false);
    draw_set_alpha(1);
}

// Specter body â€” hollow, crystalline silhouette
draw_set_alpha(_fade * 0.8);
draw_set_color(make_color_rgb(130, 175, 225));
draw_ellipse(x - 22, _wy - 15, x + 22, _wy + 45, false); // lower form
draw_set_alpha(_fade);
draw_set_color(make_color_rgb(170, 210, 245));
draw_ellipse(x - 16, _wy - 52, x + 16, _wy - 10, false); // torso
// Head â€” ice crystal orb
draw_set_color(make_color_rgb(200, 230, 255));
draw_circle(x, _wy - 68, 20, false);
// Face â€” hollow dark voids for eyes
draw_set_color(make_color_rgb(60, 90, 130));
draw_ellipse(x - 10, _wy - 76, x - 3,  _wy - 64, false);
draw_ellipse(x + 3,  _wy - 76, x + 10, _wy - 64, false);
draw_set_alpha(1);
// Crown of ice spikes
draw_set_color(make_color_rgb(190, 225, 255));
for (var _sp = 0; _sp < 5; _sp++) {
    var _sa  = -pi * 0.85 + _sp * (pi * 0.85 / 4);
    var _tip = _wy - 68 + sin(_sa) * 26;
    var _tix = x       + cos(_sa) * 26;
    draw_triangle(_tix - 4, _wy - 68 + sin(_sa - 0.3) * 20,
                  _tix, _tip - 10,
                  _tix + 4, _wy - 68 + sin(_sa + 0.3) * 20, false);
}

// Name and prompt
draw_set_color(make_color_rgb(190, 220, 255));
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, _wy - 100, "Frost Specter");

if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) < interact_dist) {
    draw_set_color(make_color_rgb(210, 235, 255));
    draw_text(x, _wy - 114, "[Space]");
}

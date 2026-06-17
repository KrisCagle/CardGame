var _t = current_time * 0.001;

if (is_defeated()) {
    draw_set_alpha(0.3);
    draw_set_color(make_color_rgb(80, 130, 60));
    draw_circle(x, y, 18, false);
    draw_set_alpha(1);
    draw_set_color(make_color_rgb(100, 150, 90));
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(x, y - 28, "Plague Wraith (banished)");
    exit;
}

// Floating spectral form — wraith hovers and pulses
var _hover  = sin(_t * 1.8) * 8;
var _wy     = y + _hover;
var _fade   = sin(_t * 2.5) * 0.15 + 0.72;

// Trailing mist at ground level
for (var _mi = 0; _mi < 5; _mi++) {
    var _mx = x + sin(_t * 1.1 + _mi * 1.3) * 24;
    var _ma = sin(_t * 1.6 + _mi) * 0.05 + 0.12;
    draw_set_alpha(_ma);
    draw_set_color(make_color_rgb(80, 150, 70));
    draw_ellipse(_mx - 28, y + 10, _mx + 28, y + 30, false);
    draw_set_alpha(1);
}

// Cloak / body (wispy, semi-transparent)
draw_set_alpha(_fade * 0.85);
draw_set_color(make_color_rgb(40, 80, 38));
draw_ellipse(x - 28, _wy - 10, x + 28, _wy + 46, false); // lower cloak
draw_set_alpha(_fade);
draw_set_color(make_color_rgb(55, 110, 52));
draw_ellipse(x - 20, _wy - 50, x + 20, _wy + 10, false); // upper body
// Head (skull-like orb)
draw_set_color(make_color_rgb(140, 200, 120));
draw_circle(x, _wy - 60, 18, false);
// Eye glow
var _eye_a = sin(_t * 3.2) * 0.2 + 0.7;
draw_set_alpha(_eye_a);
draw_set_color(make_color_rgb(180, 255, 80));
draw_ellipse(x - 10, _wy - 66, x - 3, _wy - 58, false);
draw_ellipse(x + 3,  _wy - 66, x + 10, _wy - 58, false);
draw_set_alpha(1);

// Name and prompt
draw_set_color(make_color_rgb(150, 210, 110));
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, _wy - 86, "Plague Wraith");

if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) < interact_dist) {
    draw_set_color(make_color_rgb(200, 255, 120));
    draw_text(x, _wy - 100, "[Space]");
}

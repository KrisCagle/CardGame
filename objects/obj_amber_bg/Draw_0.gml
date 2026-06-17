var _t = current_time * 0.001;
var _w = room_width;
var _h = room_height;

// Sky — late afternoon amber/gold, transitioning from bog gloom
draw_set_color(make_color_rgb(190, 140, 70));
draw_rectangle(0, 0, _w, _h * 0.45, false);
// Horizon glow
draw_set_alpha(0.4);
draw_set_color(make_color_rgb(240, 190, 90));
draw_rectangle(0, _h * 0.3, _w, _h * 0.45, false);
draw_set_alpha(1);

// Ground — dry highland grass, amber and brown tones
draw_set_color(make_color_rgb(110, 88, 44));
draw_rectangle(0, _h * 0.45, _w, _h, false);
draw_set_color(make_color_rgb(130, 104, 54));
draw_rectangle(0, _h * 0.45, _w, _h * 0.52, false);

// Rolling hills in the background
draw_set_color(make_color_rgb(80, 100, 55));
draw_ellipse(-120, 200, 480, 420, false);
draw_ellipse(320, 210, 860, 430, false);
draw_ellipse(700, 195, 1200, 415, false);
draw_ellipse(1100, 205, 1600, 425, false);
draw_ellipse(1500, 200, 2100, 420, false);

// Distant Crestfall silhouette on the horizon (right side)
draw_set_color(make_color_rgb(60, 55, 80));
// City walls
draw_rectangle(1600, 290, 2048, 390, false);
// Towers
draw_rectangle(1620, 240, 1660, 290, false);
draw_rectangle(1760, 230, 1800, 290, false);
draw_rectangle(1920, 220, 1968, 290, false);
// Tower tops (crenellations)
for (var _c = 0; _c < 4; _c++) {
    draw_rectangle(1622 + _c * 9, 232, 1628 + _c * 9, 240, false);
    draw_rectangle(1762 + _c * 9, 222, 1768 + _c * 9, 230, false);
    draw_rectangle(1922 + _c * 9, 212, 1928 + _c * 9, 220, false);
}

// Road — worn stone path
draw_set_color(make_color_rgb(148, 128, 88));
draw_rectangle(0, 375, _w, 430, false);
// Road edge details
draw_set_color(make_color_rgb(120, 100, 65));
draw_rectangle(0, 374, _w, 378, false);
draw_rectangle(0, 428, _w, 432, false);
// Road stones
draw_set_color(make_color_rgb(138, 118, 78));
for (var _rs = 0; _rs < 22; _rs++) {
    draw_rectangle(_rs * 96, 382, _rs * 96 + 72, 394, false);
    draw_rectangle(_rs * 96 + 48, 400, _rs * 96 + 112, 412, false);
}

// Dry grass tufts along road
draw_set_color(make_color_rgb(150, 120, 55));
for (var _gi = 0; _gi < 18; _gi++) {
    var _gx  = _gi * 118 + 30;
    var _sway = sin(_t * 1.2 + _gi * 0.9) * 3;
    draw_line(_gx, 432, _gx + _sway, 452);
    draw_line(_gx + 8, 432, _gx + 8 + _sway, 448);
    draw_line(_gx - 8, 432, _gx - 8 + _sway, 450);
}

// Milestone marker (stone post with distance carved)
draw_set_color(make_color_rgb(130, 120, 100));
draw_rectangle(980, 350, 1000, 430, false);
draw_rectangle(968, 346, 1012, 358, false);
draw_set_color(make_color_rgb(200, 180, 140));
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(990, 352, "CRESTFALL");

// Clouds drifting
for (var _ci = 0; _ci < 4; _ci++) {
    var _cx = (_ci * 560 + _t * 12) mod (_w + 300) - 150;
    var _cy = 60 + _ci * 28;
    draw_set_alpha(0.55);
    draw_set_color(make_color_rgb(240, 210, 150));
    draw_ellipse(_cx - 60, _cy - 18, _cx + 60, _cy + 18, false);
    draw_ellipse(_cx - 30, _cy - 28, _cx + 30, _cy + 8,  false);
    draw_ellipse(_cx + 20, _cy - 22, _cx + 80, _cy + 14, false);
    draw_set_alpha(1);
}

// Route label
draw_set_color(make_color_rgb(180, 150, 90));
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_text(_w - 16, 12, "Route 5 — Amber Road");

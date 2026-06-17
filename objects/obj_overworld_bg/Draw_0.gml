var _t = current_time * 0.001;
var _w = room_width;
var _h = room_height;

// Sky gradient — clear day, horizon lighter
draw_set_color(make_color_rgb(145, 195, 235));
draw_rectangle(0, 0, _w, _h * 0.5, false);
draw_set_color(make_color_rgb(200, 230, 248));
draw_rectangle(0, _h * 0.4, _w, _h * 0.58, false);

// Distant treeline silhouette
draw_set_color(make_color_rgb(65, 105, 58));
var _tree_xs = [0,60,130,200,280,360,430,510,580,660,730,800,870,950,1020,1100,1180,1260,1340];
for (var _i = 0; _i < array_length(_tree_xs); _i++) {
    var _tx = _tree_xs[_i];
    var _th = 70 + irandom(50);
    draw_ellipse(_tx - 30, 280 - _th, _tx + 30, 310, false);
}

// Rolling hills / ground
draw_set_color(make_color_rgb(88, 140, 70));
draw_rectangle(0, _h * 0.55, _w, _h, false);
// Highlight ridge
draw_set_color(make_color_rgb(105, 162, 82));
draw_ellipse(-100, 350, 600, 480, false);
draw_ellipse(500, 360, 1100, 490, false);
draw_ellipse(900, 340, 1500, 480, false);

// Dirt road leading east — the path of the story
draw_set_color(make_color_rgb(148, 118, 80));
var _road_pts = [
    [100, 550], [400, 530], [700, 520], [1000, 535], [1366, 540]
];
draw_set_color(make_color_rgb(130, 102, 65));
draw_rectangle(80, 508, 1366, 572, false);
draw_set_color(make_color_rgb(148, 118, 80));
draw_rectangle(84, 512, 1366, 568, false);
// Road edge shadow
draw_set_color(make_color_rgb(88, 68, 40));
draw_rectangle(80, 508, 1366, 514, false);
draw_rectangle(80, 566, 1366, 572, false);

// Clouds — drifting slowly right
for (var _i = 0; _i < array_length(clouds); _i++) {
    var _cl = clouds[_i];
    _cl.x += _cl.spd;
    if (_cl.x - _cl.w > _w + 20) _cl.x = -_cl.w - 10;
    draw_set_alpha(_cl.alpha);
    draw_set_color(c_white);
    draw_ellipse(_cl.x - _cl.w * 0.5, _cl.y - 22, _cl.x + _cl.w * 0.5, _cl.y + 22, false);
    draw_ellipse(_cl.x - _cl.w * 0.3, _cl.y - 34, _cl.x + _cl.w * 0.3, _cl.y + 10, false);
    draw_ellipse(_cl.x,               _cl.y - 38, _cl.x + _cl.w * 0.25, _cl.y + 8, false);
    draw_set_alpha(1);
}

// Wildflowers dotted along road verge
var _flower_xs = [160, 310, 480, 650, 820, 970, 1140, 1300];
for (var _i = 0; _i < array_length(_flower_xs); _i++) {
    var _fx = _flower_xs[_i];
    var _fy = (_i & 1 == 0) ? 498 : 578;
    var _col;
    if (_i % 3 == 0)      _col = make_color_rgb(240, 80, 100);
    else if (_i % 3 == 1) _col = make_color_rgb(255, 210, 60);
    else                   _col = make_color_rgb(200, 160, 240);
    draw_set_color(_col);
    draw_ellipse(_fx - 5, _fy - 5, _fx + 5, _fy + 5, false);
    draw_set_color(make_color_rgb(60, 140, 55));
    draw_rectangle(_fx - 1, _fy + 4, _fx + 1, _fy + 16, false);
}

// Hint text — small and atmospheric
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(make_color_rgb(35, 55, 25));
draw_set_alpha(0.45);
draw_text(683, 20, "The road east awaits.");
draw_set_alpha(1);

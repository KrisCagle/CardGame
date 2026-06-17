var _t  = current_time * 0.001;
var _w  = room_width;
var _h  = room_height;

// Sky â€” warm morning gold fading to pale blue
draw_set_color(make_color_rgb(240, 210, 150));
draw_rectangle(0, 0, _w, _h * 0.45, false);
draw_set_color(make_color_rgb(195, 225, 245));
draw_rectangle(0, _h * 0.45, _w, _h * 0.6, false);

// Distant hill silhouette
draw_set_color(make_color_rgb(130, 165, 120));
draw_ellipse(-80, 330, 400, 620, false);
draw_ellipse(600, 340, 1000, 640, false);
draw_ellipse(1050, 320, 1480, 630, false);

// Ground â€” cobblestone path color
draw_set_color(make_color_rgb(120, 105, 88));
draw_rectangle(0, _h * 0.58, _w, _h, false);

// Cobblestone rows â€” alternating shades
for (var _row = 0; _row < 5; _row++) {
    var _ry = _h * 0.6 + _row * 36;
    draw_set_color((_row & 1) == 0 ? make_color_rgb(105, 90, 75) : make_color_rgb(118, 103, 86));
    for (var _col = 0; _col < 25; _col++) {
        var _rx = _col * 56 + ((_row & 1) * 28);
        draw_rectangle(_rx + 2, _ry + 2, _rx + 52, _ry + 32, false);
        // Grout lines
        draw_set_color(make_color_rgb(80, 68, 55));
        draw_rectangle(_rx, _ry, _rx + 54, _ry + 1, false);
        draw_rectangle(_rx, _ry, _rx + 1, _ry + 34, false);
        draw_set_color((_row & 1) == 0 ? make_color_rgb(105, 90, 75) : make_color_rgb(118, 103, 86));
    }
}

// Left building â€” stone wall with warm-lit window
draw_set_color(make_color_rgb(88, 78, 66));
draw_rectangle(30, 200, 290, 580, false);
// Roof
draw_set_color(make_color_rgb(65, 55, 45));
draw_triangle(15, 202, 305, 202, 160, 120, false);
// Windows â€” warm amber glow
var _lwin = 0.7 + sin(_t * 1.4 + 0.5) * 0.06;
draw_set_color(make_color_rgb(255, 200, 80));
draw_set_alpha(_lwin);
draw_rectangle(70, 270, 140, 340, false);
draw_rectangle(170, 270, 240, 340, false);
draw_rectangle(110, 400, 210, 470, false);
draw_set_alpha(1);
// Window frames
draw_set_color(make_color_rgb(55, 45, 35));
draw_rectangle(70, 270, 140, 340, true);
draw_rectangle(170, 270, 240, 340, true);
draw_rectangle(110, 400, 210, 470, true);

// Right building â€” slightly taller
draw_set_color(make_color_rgb(95, 85, 72));
draw_rectangle(1080, 180, 1340, 580, false);
draw_set_color(make_color_rgb(65, 55, 45));
draw_triangle(1065, 182, 1355, 182, 1210, 95, false);
var _rwin = 0.7 + sin(_t * 1.2 + 2.1) * 0.06;
draw_set_color(make_color_rgb(255, 200, 80));
draw_set_alpha(_rwin);
draw_rectangle(1110, 250, 1175, 320, false);
draw_rectangle(1230, 250, 1295, 320, false);
draw_rectangle(1150, 380, 1260, 450, false);
draw_set_alpha(1);
draw_set_color(make_color_rgb(55, 45, 35));
draw_rectangle(1110, 250, 1175, 320, true);
draw_rectangle(1230, 250, 1295, 320, true);
draw_rectangle(1150, 380, 1260, 450, true);

// Central archway / gate into town
draw_set_color(make_color_rgb(75, 65, 52));
draw_rectangle(540, 280, 620, 570, false);   // left pillar
draw_rectangle(750, 280, 830, 570, false);   // right pillar
// Arch top
draw_set_color(make_color_rgb(68, 58, 45));
draw_ellipse(540, 240, 830, 320, false);
// Arch opening (sky color peeking through)
draw_set_color(make_color_rgb(195, 225, 245));
draw_ellipse(548, 244, 822, 316, false);
draw_rectangle(548, 278, 822, 300, false);

// Lanterns on posts
for (var _i = 0; _i < array_length(lanterns); _i++) {
    var _ln = lanterns[_i];
    var _lx = _ln.x;
    var _glow = 0.55 + sin(_t * 2.5 + _ln.phase) * 0.12;

    // Post
    draw_set_color(make_color_rgb(55, 45, 35));
    draw_rectangle(_lx - 3, 480, _lx + 3, 575, false);

    // Glow halo
    draw_set_alpha(_glow * 0.18);
    draw_set_color(make_color_rgb(255, 190, 60));
    draw_ellipse(_lx - 30, 450, _lx + 30, 510, false);
    draw_set_alpha(1);

    // Lantern body
    draw_set_color(make_color_rgb(55, 45, 35));
    draw_rectangle(_lx - 10, 460, _lx + 10, 480, false);
    draw_set_alpha(_glow);
    draw_set_color(make_color_rgb(255, 210, 80));
    draw_rectangle(_lx - 8, 462, _lx + 8, 478, false);
    draw_set_alpha(1);
}

// Trees either side of the gate area
var _trees = [[430, 420], [900, 440]];
for (var _ti = 0; _ti < 2; _ti++) {
    var _tx = _trees[_ti][0];
    var _ty = _trees[_ti][1];
    draw_set_color(make_color_rgb(70, 55, 40));
    draw_rectangle(_tx - 8, _ty, _tx + 8, _ty + 140, false);
    draw_set_color(make_color_rgb(75, 125, 70));
    draw_ellipse(_tx - 42, _ty - 80, _tx + 42, _ty + 20, false);
    draw_set_color(make_color_rgb(95, 150, 88));
    draw_ellipse(_tx - 30, _ty - 100, _tx + 30, _ty + 0, false);
}

// Town label
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(make_color_rgb(50, 38, 28));
draw_set_alpha(0.65);
draw_text(683, 26, "MILLHAVEN  â€”  Where the Road Begins");
draw_set_alpha(1);

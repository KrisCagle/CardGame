// Smoky overcast sky
draw_set_color(make_color_rgb(58, 52, 48));
draw_rectangle(0, 0, room_width, room_height, false);

// Ground â€” packed dirt and stone
draw_set_color(make_color_rgb(72, 62, 52));
draw_rectangle(0, 280, room_width, room_height, false);

// Cobblestone road
draw_set_color(make_color_rgb(88, 80, 70));
draw_rectangle(0, 330, room_width, 460, false);
draw_set_color(make_color_rgb(68, 60, 52));
for (var _cx2 = 0; _cx2 < room_width; _cx2 += 64) {
    draw_rectangle(_cx2, 330, _cx2 + 60, 335, false);
    draw_rectangle(_cx2 + 32, 385, _cx2 + 60, 390, false);
    draw_rectangle(_cx2 + 10, 430, _cx2 + 55, 434, false);
}

// Smoke wisps from chimneys (animated)
var _t = current_time * 0.001;
draw_set_alpha(0.25);
draw_set_color(make_color_rgb(140, 130, 120));
for (var _si = 0; _si < 3; _si++) {
    var _sx = 380 + _si * 380;
    for (var _sy2 = 0; _sy2 < 80; _sy2 += 12) {
        var _wobble = sin(_t * 2 + _si + _sy2 * 0.1) * 8;
        draw_circle(_sx + _wobble, 200 - _sy2, 10 + _sy2 * 0.2, false);
    }
}
draw_set_alpha(1);

// Forge building (left-center)
draw_set_color(make_color_rgb(70, 58, 48));
draw_rectangle(280, 260, 500, 460, false);
draw_set_color(make_color_rgb(55, 45, 38));
draw_rectangle(280, 240, 500, 265, false); // roof
// Chimney
draw_set_color(make_color_rgb(65, 55, 48));
draw_rectangle(360, 190, 390, 260, false);
// Forge glow (orange window)
draw_set_color(make_color_rgb(220, 120, 40));
draw_rectangle(310, 310, 360, 355, false);
draw_set_alpha(0.4);
draw_set_color(make_color_rgb(255, 160, 60));
draw_rectangle(308, 308, 362, 357, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(390, 330, "FORGE");

// Shop building (right of forge)
draw_set_color(make_color_rgb(78, 65, 55));
draw_rectangle(600, 270, 800, 460, false);
draw_set_color(make_color_rgb(60, 50, 42));
draw_rectangle(600, 250, 800, 275, false);
draw_set_color(c_white);
draw_text(700, 340, "SHOP");

// Hospital building (right of shop)
draw_set_color(make_color_rgb(68, 78, 68));
draw_rectangle(900, 270, 1100, 460, false);
draw_set_color(make_color_rgb(52, 60, 52));
draw_rectangle(900, 250, 1100, 275, false);
draw_set_color(c_white);
draw_text(1000, 320, "CLINIC");
draw_set_color(make_color_rgb(200, 60, 60));
draw_rectangle(992, 340, 1008, 380, false);
draw_rectangle(980, 354, 1020, 368, false);

// Mine entrance sign (far east)
draw_set_color(make_color_rgb(55, 48, 40));
draw_rectangle(1180, 300, 1280, 450, false);
draw_set_color(make_color_rgb(40, 35, 30));
draw_rectangle(1190, 295, 1270, 310, false);
draw_set_color(c_white);
draw_text(1230, 370, "MINE");
// Dark mine opening
draw_set_color(make_color_rgb(15, 12, 10));
draw_rectangle(1205, 340, 1255, 450, false);

// Mountain backdrop (north)
draw_set_color(make_color_rgb(48, 44, 40));
draw_rectangle(0, 0, room_width, 290, false);
draw_set_color(make_color_rgb(38, 34, 30));
// Mountain peaks
draw_triangle(200, 290, 400, 120, 600, 290, false);
draw_triangle(500, 290, 750, 80,  1000, 290, false);
draw_triangle(900, 290, 1100, 100, 1300, 290, false);

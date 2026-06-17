// Overcast sky
draw_set_color(make_color_rgb(48, 52, 68));
draw_rectangle(0, 0, room_width, room_height, false);

// Ocean border (shallow water around island edges)
draw_set_color(make_color_rgb(20, 55, 100));
draw_rectangle(0, 0, room_width, 180, false);
draw_rectangle(0, 560, room_width, room_height, false);
draw_rectangle(0, 0, 100, room_height, false);
draw_rectangle(room_width - 100, 0, room_width, room_height, false);

// Sandy beach ring
draw_set_color(make_color_rgb(180, 160, 110));
draw_rectangle(100, 160, room_width - 100, 580, false);

// Island ground (darker interior)
draw_set_color(make_color_rgb(55, 75, 45));
draw_rectangle(160, 210, room_width - 160, 540, false);

// Ruined stone structure (center-back) — the Drowned Captain's lair
draw_set_color(make_color_rgb(60, 58, 62));
draw_rectangle(340, 220, 660, 380, false);
draw_rectangle(360, 200, 420, 225, false); // left tower stump
draw_rectangle(580, 200, 640, 225, false); // right tower stump
// Cracks
draw_set_color(make_color_rgb(35, 33, 38));
draw_rectangle(460, 220, 468, 340, false);
draw_rectangle(390, 260, 440, 265, false);

// Dead trees left
draw_set_color(make_color_rgb(40, 35, 30));
draw_rectangle(165, 250, 175, 450, false);
draw_rectangle(155, 280, 220, 288, false);
draw_rectangle(175, 320, 230, 327, false);

// Dead trees right
draw_rectangle(room_width - 175, 250, room_width - 165, 450, false);
draw_rectangle(room_width - 220, 280, room_width - 155, 288, false);
draw_rectangle(room_width - 230, 320, room_width - 175, 327, false);

// Eerie mist tendrils
draw_set_alpha(0.18);
draw_set_color(make_color_rgb(160, 180, 220));
draw_rectangle(140, 380, room_width - 140, 430, false);
draw_rectangle(200, 450, room_width - 200, 480, false);
draw_set_alpha(1);

// Shallow water glimmer
draw_set_alpha(0.3);
draw_set_color(make_color_rgb(80, 140, 200));
var _t = current_time * 0.0006;
for (var _i = 0; _i < 4; _i++) {
    var _ox = sin(_t + _i * 1.4) * 20;
    draw_rectangle(100 + _ox, 160 + _i * 5, 160 + _ox, 175 + _i * 5, false);
    draw_rectangle(room_width - 160 + _ox, 160 + _i * 5, room_width - 100 + _ox, 175 + _i * 5, false);
}
draw_set_alpha(1);

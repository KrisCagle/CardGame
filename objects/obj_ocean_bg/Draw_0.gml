var _t = current_time * 0.0008;

// Deep ocean base
draw_set_color(make_color_rgb(12, 42, 88));
draw_rectangle(0, 0, room_width, room_height, false);

// Rolling wave bands — offset by time for animation
for (var _i = 0; _i < 10; _i++) {
    var _wy  = (_i * 90 + (_t * 40) mod 90) mod room_height;
    var _alpha = 0.18 + sin(_t + _i) * 0.06;
    draw_set_alpha(_alpha);
    draw_set_color(make_color_rgb(30, 80, 160));
    draw_rectangle(0, _wy, room_width, _wy + 28, false);
}
draw_set_alpha(1);

// Foam crests on the waves
for (var _i = 0; _i < 10; _i++) {
    var _wy = (_i * 90 + (_t * 40) mod 90) mod room_height;
    draw_set_alpha(0.35);
    draw_set_color(make_color_rgb(180, 210, 255));
    draw_rectangle(0, _wy, room_width, _wy + 5, false);
}
draw_set_alpha(1);

// Horizon glow (distant sky at the top)
draw_set_color(make_color_rgb(20, 30, 60));
draw_rectangle(0, 0, room_width, 80, false);
draw_set_color(make_color_rgb(40, 60, 100));
draw_rectangle(0, 70, room_width, 90, false);

// Distant island silhouette hint (very far east)
draw_set_color(make_color_rgb(8, 25, 55));
draw_rectangle(room_width - 220, 200, room_width - 80, 540, false);
draw_set_color(make_color_rgb(5, 18, 40));
draw_circle(room_width - 140, 210, 90, false);

// West dock connection — small pier remnant on the left
draw_set_color(make_color_rgb(90, 68, 46));
draw_rectangle(0, 310, 80, 460, false);

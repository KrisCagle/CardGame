depth = 100;
// Floating pages drifting across the room
pages = [];
for (var _i = 0; _i < 20; _i++) {
    array_push(pages, {
        x: irandom(room_width),
        y: irandom(room_height),
        speed_x: random(0.5) - 0.25,
        speed_y: random(0.3) - 0.15,
        angle: random(360),
        angle_speed: random(0.4) - 0.2,
        alpha: random(0.35) + 0.15
    });
}

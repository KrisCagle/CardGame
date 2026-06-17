depth = 100;
snow = [];
for (var _i = 0; _i < 50; _i++) {
    array_push(snow, {
        x: irandom(room_width),
        y: irandom(room_height),
        speed: random(0.5) + 0.15,
        size: irandom(2) + 1,
        drift: random(0.8) - 0.4
    });
}

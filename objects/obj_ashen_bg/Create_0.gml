depth = 100;
ash = [];
for (var _i = 0; _i < 55; _i++) {
    array_push(ash, {
        x: irandom(room_width),
        y: irandom(room_height),
        speed: random(0.35) + 0.1,
        drift: random(1.2) - 0.6,
        size: irandom(2) + 1,
        alpha: random(0.3) + 0.2
    });
}

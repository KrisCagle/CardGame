depth = 100;
// Ash particles
ash = [];
for (var _i = 0; _i < 40; _i++) {
    array_push(ash, {
        x: irandom(room_width),
        y: irandom(room_height),
        speed: random(0.3) + 0.1,
        drift: random(1.0) - 0.5,
        size: irandom(2) + 1
    });
}

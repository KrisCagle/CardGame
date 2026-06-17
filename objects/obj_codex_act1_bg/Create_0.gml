depth = 100;
motes = [];
for (var _i = 0; _i < 40; _i++) {
    array_push(motes, {
        x: irandom(room_width),
        y: irandom(room_height),
        speed: random(0.2) + 0.05,
        drift: random(0.4) - 0.2,
        size: irandom(2) + 1,
        alpha: random(0.4) + 0.1
    });
}

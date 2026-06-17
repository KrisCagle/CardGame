depth = 100;
// Snow particle positions — randomized once at room start
snow = [];
for (var _i = 0; _i < 60; _i++) {
    array_push(snow, {
        x: irandom(2047),
        y: irandom(767),
        speed: random(0.4) + 0.2,
        size: irandom(2) + 1,
        drift: random(0.6) - 0.3
    });
}

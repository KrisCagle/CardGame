depth = 100;

// Slow drifting clouds
clouds = [];
repeat (7) {
    array_push(clouds, {
        x:     random(1366),
        y:     60 + random(140),
        w:     80 + irandom(120),
        spd:   random(0.15) + 0.04,
        alpha: random(0.35) + 0.3,
    });
}

depth = 100;
// Floating motes of light near The Codex gate
motes = [];
for (var _i = 0; _i < 30; _i++) {
    array_push(motes, {
        x: 900 + irandom(400),
        y: irandom(300) + 50,
        speed: random(0.3) + 0.1,
        drift: random(0.8) - 0.4,
        size: irandom(2) + 1,
        alpha: random(0.5) + 0.2,
        hue_r: 140 + irandom(60),
        hue_g: 80 + irandom(60),
        hue_b: 200 + irandom(55)
    });
}

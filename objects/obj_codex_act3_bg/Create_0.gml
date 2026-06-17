depth = 100;
// Ascending light motes from the open Codex on the pedestal
motes = [];
for (var _i = 0; _i < 50; _i++) {
    array_push(motes, {
        x: 683 + irandom(200) - 100,
        y: 300 + irandom(400),
        speed: random(0.5) + 0.2,
        drift: random(0.6) - 0.3,
        size: irandom(3) + 1,
        alpha: random(0.5) + 0.15,
        warm: irandom(1)
    });
}

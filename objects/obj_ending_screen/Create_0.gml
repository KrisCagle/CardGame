timer       = 0;
fade_in     = 0;       // 0..1 opacity over first 3 seconds
line_index  = 0;       // which lore line to show
line_timer  = 0;

lore_lines = [
    "The First Weaver did not fall.",
    "She stepped aside.",
    "She had been waiting for someone who understood",
    "that a card is not a weapon.",
    "It is a word.",
    "And the Codex is a sentence",
    "that has been trying to finish itself",
    "for a very long time.",
    "",
    "You read it.",
    "You were changed.",
    "That was always the point."
];

motes = [];
for (var _i = 0; _i < 60; _i++) {
    array_push(motes, {
        x: irandom(1366), y: irandom(768),
        speed: random(0.4) + 0.1,
        drift: random(0.5) - 0.25,
        size: irandom(3) + 1,
        alpha: random(0.5) + 0.1,
        warm: irandom(1)
    });
}

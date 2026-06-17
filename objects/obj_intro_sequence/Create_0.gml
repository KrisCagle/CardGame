// Ensure obj_global exists so load_game() has somewhere to write
if (!instance_exists(obj_global)) {
    instance_create_depth(0, 0, 0, obj_global);
}

// --- Shared background: drifting ghost-card shapes ---
cards_bg = [];
for (var _i = 0; _i < 18; _i++) {
    array_push(cards_bg, {
        x:         irandom(1366),
        y:         irandom(768),
        speed:     random(0.3) + 0.05,
        drift:     random(0.4) - 0.2,
        angle:     random(360),
        angle_spd: random(0.25) - 0.125,
        alpha:     random(0.12) + 0.03,
        w:         22 + irandom(14),
        h:         30 + irandom(18)
    });
}

// --- Title screen menu (shown when a save file exists) ---
has_save   = file_exists(working_directory + "savegame.dat");
menu_sel   = 0;    // 0 = CONTINUE, 1 = NEW GAME
menu_alpha = 0;    // fades in

// --- Lore slides (shown on new game) ---
slides = [
    { lines: ["In the age before writing, there were cards."],                  hold: 220 },
    { lines: ["The First Weaver made them to name things",
              "that words could not hold."],                                     hold: 260 },
    { lines: ["For generations the art of Card Weaving passed from hand to hand.", ""], hold: 220 },
    { lines: ["Then it faded.",
              "Until it was legend. Until it was nothing."],                     hold: 260 },
    { lines: ["Then you found a deck in your grandfather's things.",
              "Old cards. Worn edges. No instructions."],                        hold: 260 },
    { lines: ["When you touched them, they hummed."],                           hold: 220 },
    { lines: ["That was three weeks ago.",
              "Since then, every road seems to lead east."],                    hold: 280 },
    { lines: ["[ Space ] to begin"],                                            hold: 9999 },
];

slide_index   = 0;
slide_timer   = 0;
fade_in       = 0;
fade_out      = 0;
transitioning = false;

// Start in menu mode if a save exists, otherwise go straight to slides
mode = has_save ? "menu" : "slides";

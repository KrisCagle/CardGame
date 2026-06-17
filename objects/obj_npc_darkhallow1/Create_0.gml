event_inherited();
npc_name  = "Townsfolk";
npc_color = make_color_rgb(160, 140, 120);
if (obj_global.boss_defeated) {
    dialogue = [
        "We heard what happened. Baron Ashveil — gone.",
        "We've been cut off for months. No supplies, no news.",
        "And now a stranger walks through that pass like it's nothing.",
        "You have no idea how much this means to us."
    ];
} else {
    dialogue = [
        "Ashveil's men collapsed the pass when they retreated.",
        "We've been trapped up here ever since.",
        "Someone needs to go through Blackwood and deal with him.",
        "But who would be brave — or foolish — enough?"
    ];
}

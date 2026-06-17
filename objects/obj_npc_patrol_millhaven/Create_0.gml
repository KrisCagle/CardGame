event_inherited();
npc_name  = "Townsfolk";
npc_color = make_color_rgb(180, 160, 140);

if (obj_global.boss_defeated) {
    dialogue = [
        "You actually did it. Baron Ashveil is gone.",
        "Millhaven hasn't felt this peaceful in years.",
        "The whole town is grateful.",
    ];
} else {
    dialogue = [
        "Millhaven used to be a proper market town.",
        "Ever since the Baron moved into that stronghold, things have been tense.",
        "His two lieutenants are holed up in there with him.",
        "Someone's going to have to deal with them sooner or later.",
    ];
}

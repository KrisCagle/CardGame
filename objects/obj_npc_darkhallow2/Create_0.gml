event_inherited();
npc_name  = "Elder";
npc_color = make_color_rgb(200, 180, 140);
if (obj_global.boss_defeated) {
    dialogue = [
        "Dark Hollow was a trade stop between the valley and the highlands once.",
        "Merchants, travelers, adventurers — all passing through.",
        "Ashveil ended that. His blockade starved this town slowly.",
        "With the pass open again... maybe we can rebuild what we lost."
    ];
} else {
    dialogue = [
        "Dark Hollow has been isolated for nearly a year now.",
        "We trade what little we can among ourselves, but it's not sustainable.",
        "The highlands beyond hold riches — iron, timber, rare herbs.",
        "All of it locked away while Ashveil sits in his stronghold."
    ];
}

event_inherited();
npc_name  = "Fisherman";
npc_color = make_color_rgb(130, 160, 180);
if (obj_global.boss_defeated) {
    dialogue = [
        "The baron's gone? Word travels fast, even out here.",
        "Good. Maybe proper trade ships will start calling at this dock again.",
        "Though I'll tell you what doesn't change — those lights to the east.",
        "Still see them some nights. That island doesn't care who rules the highlands."
    ];
} else {
    dialogue = [
        "My grandfather was a merchant sailor. Did runs all along this coast.",
        "He told me once about an island he spotted — far to the east, past the open water.",
        "Said the lights on it moved on their own. No lanterns, no fire. Just... light.",
        "Three ships he knew of sailed toward it. None came back.",
        "He steered clear every time after that.",
        "I've fished these waters twenty years. Never been tempted to find out if he was right."
    ];
}

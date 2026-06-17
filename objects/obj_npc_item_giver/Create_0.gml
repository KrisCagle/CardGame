npc_name      = "Delara";
npc_color     = make_color_rgb(160, 200, 180);
item_name     = "Blasting Powder";
item_given    = false;
interact_dist = 60;

// Dialogue changes depending on state
function get_dialogue() {
    if (obj_global.blackwood_cleared) {
        return ["Sounds like the Blasting Powder did the trick!", "Safe travels beyond the Blackwood pass."];
    }
    if (item_given || obj_global.has_item(item_name)) {
        return ["That powder should do the job.", "Come back if you need anything else."];
    }
    if (obj_global.tried_blackwood) {
        return [
            "A rockfall, you say? East of the forest?",
            "Ashveil's lot must have collapsed it on their way out.",
            "Here — take this Blasting Powder. It'll clear any rock in your way.",
            "Be careful out there."
        ];
    }
    return [
        "Welcome to Millhaven. I'm Delara — I keep supplies for travelers.",
        "If you need gear, come see me after you've had a look around."
    ];
}

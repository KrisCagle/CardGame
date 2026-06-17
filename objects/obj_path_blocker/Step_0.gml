// Disappear instantly if path already cleared
if (obj_global.blackwood_cleared) {
    instance_destroy();
    exit;
}

// Soft collision — push player back
if (instance_exists(obj_player) && obj_player.x > x - 70) {
    obj_player.x = x - 70;
}

// First approach: trigger the scene
if (!scene_triggered && !obj_global.tried_blackwood && instance_exists(obj_player)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 220) {
        scene_triggered          = true;
        obj_global.tried_blackwood = true;
        obj_global.player_locked = true;
        var _snpc           = instance_create_depth(room_width + 80, y, -1, obj_scene_npc);
        _snpc.target_x      = x - 160;
        _snpc.npc_name      = "Scout";
        _snpc.npc_color     = make_color_rgb(180, 140, 100);
        _snpc.dialogue_lines = [
            "Traveler! The pass is blocked — Ashveil's men collapsed it when they fled.",
            "You'll need Blasting Powder to clear it.",
            "Delara, back in Millhaven, keeps some in stock."
        ];
    }
}

// Return visit: use item
if (obj_global.tried_blackwood && !obj_global.blackwood_cleared
&&  obj_global.has_item("Blasting Powder")
&&  instance_exists(obj_player)
&&  point_distance(x, y, obj_player.x, obj_player.y) < 100
&&  keyboard_check_pressed(vk_space)
&&  instance_exists(obj_dialogue_box) && !obj_dialogue_box.active) {
    obj_global.blackwood_cleared = true;
    with (obj_dialogue_box) {
        dialogue_start("*", [
            "You use the Blasting Powder.",
            "BOOM! The rockfall crumbles. The eastern path is clear!"
        ]);
    }
}

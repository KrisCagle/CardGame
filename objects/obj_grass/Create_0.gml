patch_w = 128;
patch_h = 128;
steps_in_grass      = 0;
encounter_threshold = 8 + irandom(8);
was_inside          = false;

// Flash state before triggering combat
flash_timer  = 0;
flash_active = false;
pending_enemy_key = "";

wild_pool = ["slime", "grunt"];

// -------------------------------------------------------
// MENU MODE — shown when a save file exists
// -------------------------------------------------------
if (mode == "menu") {
    menu_alpha = min(1, menu_alpha + 0.02);

    if (keyboard_check_pressed(vk_up)   || keyboard_check_pressed(ord("W"))) menu_sel = 0;
    if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) menu_sel = 1;

    if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
        if (menu_sel == 0) {
            // CONTINUE — load save then jump to saved room
            load_game();
            room_goto(obj_global.last_room_id);
        } else {
            // NEW GAME — ignore the save, play lore slides
            mode        = "slides";
            slide_index = 0;
            slide_timer = 0;
            fade_in     = 0;
            fade_out    = 0;
            transitioning = false;
        }
    }
    exit;
}

// -------------------------------------------------------
// SLIDES MODE — lore intro sequence
// -------------------------------------------------------
slide_timer++;

var _slide = slides[slide_index];
var _hold  = _slide.hold;

// Fade in over first 60 frames of each slide
if (slide_timer < 60) {
    fade_in = slide_timer / 60.0;
} else {
    fade_in = 1;
}

// On the last slide, Space starts the game
if (slide_index == array_length(slides) - 1) {
    if (keyboard_check_pressed(vk_space)) {
        room_goto(rm_overworld);
    }
    exit;
}

// Space advances to next slide early
if (keyboard_check_pressed(vk_space) && !transitioning && slide_timer > 30) {
    transitioning = true;
    slide_timer   = _hold - 30;
}

// Fade out in last 30 frames
if (slide_timer >= _hold - 30) {
    fade_out = 1.0 - (_hold - slide_timer) / 30.0;
    fade_out = clamp(fade_out, 0, 1);
}

// Advance slide
if (slide_timer >= _hold) {
    slide_index++;
    slide_timer   = 0;
    fade_in       = 0;
    fade_out      = 0;
    transitioning = false;
}

timer++;

if (timer < 180) {
    fade_in = timer / 180.0;
} else {
    fade_in = 1;
}

if (fade_in >= 1) {
    line_timer++;
    if (line_timer >= 180 && line_index < array_length(lore_lines) - 1) {
        line_index++;
        line_timer = 0;
    }
}

// Exit — only available after "Thank you for playing" has appeared
var _all_shown = (line_index >= array_length(lore_lines) - 1 && line_timer > 360);
if (_all_shown && keyboard_check_pressed(vk_space)) {
    room_goto(rm_overworld);
}

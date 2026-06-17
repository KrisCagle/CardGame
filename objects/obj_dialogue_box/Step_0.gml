// Cooldown ticks whether dialogue is open or just closed
if (open_cooldown > 0) {
    open_cooldown--;
    exit;
}

if (!active) exit;

if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
    line_index++;
    if (line_index >= array_length(lines)) {
        active        = false;
        lines         = [];
        line_index    = 0;
        open_cooldown = 10;
    }
}

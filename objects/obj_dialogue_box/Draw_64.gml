if (!active) exit;

var bx = 60;
var by = 560;
var bw = display_get_gui_width()  - 120;
var bh = 140;

// Box background
draw_set_color(make_color_rgb(10, 10, 30));
draw_rectangle(bx, by, bx + bw, by + bh, false);
draw_set_color(c_white);
draw_rectangle(bx, by, bx + bw, by + bh, true);

// Speaker name tab
if (speaker_name != "") {
    draw_set_color(make_color_rgb(10, 10, 30));
    draw_rectangle(bx, by - 28, bx + 200, by, false);
    draw_set_color(c_white);
    draw_rectangle(bx, by - 28, bx + 200, by, true);
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_text(bx + 12, by - 14, speaker_name);
}

// Dialogue text
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (line_index < array_length(lines)) {
    draw_text_ext(bx + 20, by + 20, lines[line_index], 24, bw - 40);
}

// Advance prompt (blink every 30 frames)
if ((current_time div 500) mod 2 == 0) {
    draw_set_halign(fa_right);
    draw_text(bx + bw - 16, by + bh - 28, "[Space]");
}

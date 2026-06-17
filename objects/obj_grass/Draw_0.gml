// Grass patch
draw_set_alpha(0.4);
draw_set_color(c_green);
draw_rectangle(x, y, x + patch_w, y + patch_h, false);
draw_set_alpha(1);
draw_set_color(make_color_rgb(0, 100, 0));
draw_rectangle(x, y, x + patch_w, y + patch_h, true);

// Encounter flash — white "!" screen flash
if (flash_active) {
    var progress = 1 - (flash_timer / 40);
    // Flicker: bright white when flash_timer is high, fades
    var alpha = (flash_timer mod 8 < 4) ? 0.6 : 0.0;
    draw_set_alpha(alpha);
    draw_set_color(c_white);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);

    // Big "!" centered on player
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(-1);
    draw_text(obj_player.x, obj_player.y - 48, "!");
}

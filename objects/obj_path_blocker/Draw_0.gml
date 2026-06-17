// Rockfall visual: stacked boulders
draw_set_color(make_color_rgb(100, 90, 80));
draw_rectangle(x - 36, y - 80, x + 36, y + 80, false);
draw_set_color(make_color_rgb(130, 120, 110));
draw_circle(x - 16, y - 60, 20, false);
draw_circle(x + 12, y - 40, 18, false);
draw_circle(x - 8,  y + 10, 24, false);
draw_circle(x + 18, y + 50, 16, false);

// Prompt
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 96, "Rockfall");

if (obj_global.tried_blackwood && !obj_global.blackwood_cleared && obj_global.has_item("Blasting Powder")) {
    if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) < 100) {
        draw_set_color(make_color_rgb(255, 220, 80));
        draw_text(x, y - 110, "[Space] Use Blasting Powder");
    }
}

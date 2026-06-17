draw_set_color(npc_color);
draw_rectangle(x - 8, y - 28, x + 8, y + 14, false);
draw_set_color(make_color_rgb(200, 175, 140));
draw_circle(x, y - 38, 10, false);
// Cap
draw_set_color(make_color_rgb(60, 50, 40));
draw_rectangle(x - 12, y - 50, x + 12, y - 44, false);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 56, npc_name);

if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) < interact_dist) {
    if (!obj_global.has_item("Kayak")) {
        draw_set_color(make_color_rgb(255, 220, 80));
        draw_text(x, y - 70, "[Space] 60g - Kayak");
    } else {
        draw_set_color(make_color_rgb(180, 220, 255));
        draw_text(x, y - 70, "[Space] Talk");
    }
}

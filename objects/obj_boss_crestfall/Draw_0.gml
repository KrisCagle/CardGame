var _t = current_time * 0.001;

if (is_defeated()) {
    // Sitting on the ground, winded
    draw_set_color(make_color_rgb(80, 70, 90));
    draw_circle(x, y + 10, 22, false);
    draw_set_color(make_color_rgb(180, 160, 120));
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(x, y - 20, "Guildmaster Varek");
    draw_set_color(make_color_rgb(140, 120, 90));
    draw_text(x, y - 6, "(defeated)");
    exit;
}

// Imposing armored fighter — upright stance
// Legs
draw_set_color(make_color_rgb(60, 55, 75));
draw_rectangle(x - 14, y,      x - 4,  y + 38, false);
draw_rectangle(x + 4,  y,      x + 14, y + 38, false);
// Boots
draw_set_color(make_color_rgb(35, 30, 25));
draw_rectangle(x - 16, y + 32, x - 2,  y + 46, false);
draw_rectangle(x + 2,  y + 32, x + 16, y + 46, false);
// Torso — plate armor
draw_set_color(make_color_rgb(90, 84, 110));
draw_rectangle(x - 20, y - 44, x + 20, y + 4, false);
// Chest plate highlight
draw_set_color(make_color_rgb(130, 122, 155));
draw_rectangle(x - 14, y - 40, x + 14, y - 10, true);
// Pauldrons (shoulder guards)
draw_set_color(make_color_rgb(75, 68, 95));
draw_ellipse(x - 28, y - 50, x - 12, y - 30, false);
draw_ellipse(x + 12, y - 50, x + 28, y - 30, false);
// Arms
draw_set_color(make_color_rgb(78, 72, 98));
draw_rectangle(x - 28, y - 36, x - 18, y + 2, false);
draw_rectangle(x + 18, y - 36, x + 28, y + 2, false);
// Sword (right hand, pointing down)
draw_set_color(make_color_rgb(180, 180, 200));
draw_rectangle(x + 26, y - 10, x + 32, y + 50, false);
draw_set_color(make_color_rgb(150, 120, 60));
draw_rectangle(x + 18, y - 6,  x + 40, y + 2,  false); // crossguard
// Head
draw_set_color(make_color_rgb(85, 78, 105));
draw_rectangle(x - 16, y - 72, x + 16, y - 44, false);
// Helmet visor
draw_set_color(make_color_rgb(40, 36, 52));
draw_rectangle(x - 13, y - 66, x + 13, y - 56, false);
// Plume on helmet
draw_set_color(make_color_rgb(180, 40, 40));
var _plume = sin(_t * 2) * 2;
draw_line_width(x, y - 72, x + _plume, y - 92, 4);

// Name and prompt
draw_set_color(make_color_rgb(200, 190, 220));
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(x, y - 102, "Guildmaster Varek");

if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) < interact_dist) {
    draw_set_color(make_color_rgb(220, 200, 255));
    draw_text(x, y - 116, "[Space]");
}

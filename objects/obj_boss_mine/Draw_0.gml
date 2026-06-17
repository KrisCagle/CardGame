if (is_defeated()) {
    // Crumbled remains
    draw_set_color(make_color_rgb(55, 48, 40));
    draw_rectangle(x - 28, y + 10, x + 28, y + 30, false);
    draw_circle(x - 10, y + 5, 12, false);
    draw_circle(x + 14, y + 8, 10, false);
    draw_set_color(c_gray);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(x, y - 8, "Stone Warden (defeated)");
    exit;
}

var _t = current_time * 0.001;

if (dormant) {
    // Looks like a pile of rocks
    draw_set_color(make_color_rgb(65, 58, 50));
    draw_rectangle(x - 28, y - 20, x + 28, y + 30, false);
    draw_circle(x - 14, y - 30, 16, false);
    draw_circle(x + 10, y - 24, 14, false);
    draw_circle(x,      y + 2,  18, false);
} else {
    // Awakened golem — imposing rectangular stone body
    draw_set_color(make_color_rgb(72, 64, 56));
    draw_rectangle(x - 22, y - 58, x + 22, y + 30, false); // torso
    draw_set_color(make_color_rgb(58, 52, 46));
    draw_rectangle(x - 30, y - 30, x - 22, y + 20, false); // left arm
    draw_rectangle(x + 22, y - 30, x + 30, y + 20, false); // right arm
    // Head (rough cube)
    draw_set_color(make_color_rgb(80, 72, 62));
    draw_rectangle(x - 18, y - 78, x + 18, y - 54, false);
    // Eye slits (glowing crystal blue)
    var _eye_glow = sin(_t * 3) * 0.2 + 0.8;
    draw_set_alpha(_eye_glow);
    draw_set_color(make_color_rgb(80, 130, 220));
    draw_rectangle(x - 12, y - 72, x - 4, y - 66, false);
    draw_rectangle(x + 4,  y - 72, x + 12, y - 66, false);
    draw_set_alpha(1);
    // Rune markings on chest (same blue glow)
    draw_set_alpha(_eye_glow * 0.7);
    draw_set_color(make_color_rgb(80, 130, 220));
    draw_rectangle(x - 10, y - 48, x + 10, y - 44, false);
    draw_rectangle(x - 6,  y - 40, x + 6,  y - 36, false);
    draw_set_alpha(1);

    // Name and prompt
    draw_set_color(make_color_rgb(200, 180, 140));
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(x, y - 94, "Stone Warden");

    if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) < interact_dist) {
        draw_set_color(make_color_rgb(255, 80, 60));
        draw_text(x, y - 108, "[Space]");
    }
}

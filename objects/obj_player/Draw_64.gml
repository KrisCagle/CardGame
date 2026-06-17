// HUD
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_lime);
draw_text(12, 12, "HP: " + string(obj_global.player_hp) + " / " + string(obj_global.player_hp_max));
draw_set_color(c_yellow);
draw_text(12, 34, "Gold: " + string(obj_global.gold));
draw_set_color(c_aqua);
draw_text(12, 56, "XP: " + string(obj_global.experience));
draw_set_color(c_dkgray);
draw_text(12, 78, "[Tab] Deck  (" + string(array_length(obj_global.deck)) + " cards)");

// Relics
var _hud_y = 100;
if (array_length(obj_global.relics) > 0) {
    draw_set_color(make_color_rgb(140, 100, 200));
    draw_text(12, _hud_y, "RELICS");
    _hud_y += 18;
    for (var _ri = 0; _ri < array_length(obj_global.relics); _ri++) {
        draw_set_color(make_color_rgb(200, 150, 255));
        draw_text(20, _hud_y, "* " + obj_global.relics[_ri]);
        _hud_y += 18;
    }
    _hud_y += 4;
}

// Items / inventory
if (array_length(obj_global.items) > 0) {
    draw_set_color(make_color_rgb(120, 180, 120));
    draw_text(12, _hud_y, "ITEMS");
    _hud_y += 18;
    for (var _ii = 0; _ii < array_length(obj_global.items); _ii++) {
        draw_set_color(make_color_rgb(160, 220, 160));
        draw_text(20, _hud_y, "- " + obj_global.items[_ii]);
        _hud_y += 18;
    }
}

// Deck viewer overlay
if (show_deck) {
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    // Dim background
    draw_set_color(make_color_rgb(0, 0, 0));
    draw_set_alpha(0.8);
    draw_rectangle(0, 0, gw, gh, false);
    draw_set_alpha(1);

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text(gw / 2, 30, "Your Deck  [Tab] to close");

    var cols    = 6;
    var card_w  = 140;
    var card_h  = 110;
    var pad     = 20;
    var total_w = cols * card_w + (cols - 1) * pad;
    var start_x = (gw - total_w) / 2;
    var start_y = 80;

    for (var i = 0; i < array_length(obj_global.deck); i++) {
        var c   = obj_global.deck[i];
        var col = i mod cols;
        var row = i div cols;
        var cx  = start_x + col * (card_w + pad);
        var cy  = start_y + row * (card_h + pad);
        draw_card(c, cx, cy, card_w, card_h, false, true);
    }
}

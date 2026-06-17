if (!open) exit;

var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

// Backdrop
draw_set_color(make_color_rgb(10, 10, 30));
draw_set_alpha(0.92);
draw_rectangle(0, 0, _gw, _gh, false);
draw_set_alpha(1);

// Header — themed name when shop specialises in an element
var _shop_title  = "~ Mira's Emporium ~";
var _shop_sub    = "Click a card to buy it.   [ E ] to leave.";
var _theme_color = make_color_rgb(255, 180, 80);
switch (theme) {
    case "fire":     _shop_title = "~ Ember Trader ~";       _theme_color = make_color_rgb(255, 110, 40);  break;
    case "ice":      _shop_title = "~ Frost Exchange ~";     _theme_color = make_color_rgb(120, 210, 255); break;
    case "nature":   _shop_title = "~ Root & Reed ~";        _theme_color = make_color_rgb(100, 210, 100); break;
    case "stone":    _shop_title = "~ The Ore Ledger ~";     _theme_color = make_color_rgb(180, 150, 100); break;
    case "shadow":   _shop_title = "~ The Dark Counter ~";   _theme_color = make_color_rgb(180, 100, 240); break;
    case "arcane":   _shop_title = "~ Weaver's Archive ~";   _theme_color = make_color_rgb(220, 180, 255); break;
}
draw_set_color(_theme_color);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(_gw / 2, 70, _shop_title);
draw_set_color(c_dkgray);
draw_text(_gw / 2, 106, _shop_sub);

// Cards
var slot_w = 160;
var slot_h = 160;
var slot_y = 200;
var gap    = 40;
var n      = array_length(stock);

if (n == 0) {
    draw_set_color(c_dkgray);
    draw_text(_gw / 2, 310, "(sold out)");
} else {
    var total_w = n * slot_w + (n - 1) * gap;
    var start_x = _gw / 2 - total_w / 2;
    for (var i = 0; i < n; i++) {
        var c     = stock[i];
        var sx    = start_x + i * (slot_w + gap);
        var price = card_price(c);
        var hov   = (mouse_x >= sx && mouse_x <= sx + slot_w
                  && mouse_y >= slot_y && mouse_y <= slot_y + slot_h);
        var can   = (obj_global.gold >= price);
        draw_card(c, sx, slot_y, slot_w, slot_h, hov, can);
        draw_set_color(can ? c_yellow : c_red);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_text(sx + slot_w / 2, slot_y + slot_h + 6, string(price) + " Gold");
    }
}

// Current gold (bottom left)
draw_set_color(c_yellow);
draw_set_halign(fa_left);
draw_text(50, _gh - 80, "Your Gold: " + string(obj_global.gold));

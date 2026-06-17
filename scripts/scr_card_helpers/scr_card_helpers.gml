// Element color — used on cards, enemy badge, and status display
function element_display_color(_elem) {
    switch (_elem) {
        case "fire":     return make_color_rgb(255, 100, 30);
        case "ice":      return make_color_rgb(100, 200, 255);
        case "nature":   return make_color_rgb(80,  200, 80);
        case "stone":    return make_color_rgb(160, 130, 80);
        case "shadow":   return make_color_rgb(160, 80,  220);
        case "arcane":   return make_color_rgb(220, 180, 255);
        default:         return make_color_rgb(160, 160, 160); // physical
    }
}

// Short element label for card badge
function element_label(_elem) {
    switch (_elem) {
        case "fire":     return "FIR";
        case "ice":      return "ICE";
        case "nature":   return "NAT";
        case "stone":    return "STN";
        case "shadow":   return "SHD";
        case "arcane":   return "ARC";
        default:         return "";
    }
}

// Status effect short description
function status_description(_c) {
    var _se = variable_struct_exists(_c, "status_effect") ? _c.status_effect : "";
    var _sv = variable_struct_exists(_c, "status_value")  ? _c.status_value  : 0;
    switch (_se) {
        case "burn":   return "Burn " + string(_sv) + " x2";
        case "freeze": return "Freeze 1 turn";
        case "poison": return "Poison +" + string(_sv) + " stacks";
        case "weaken": return "Weaken (atk -33%)";
        default:       return "";
    }
}

function card_description(_c) {
    var _base = "";
    if (_c.type == "attack") _base = "Deal " + string(_c.value) + " dmg";
    if (_c.type == "defend") _base = "Gain " + string(_c.value) + " block";
    if (_c.type == "both")   _base = string(_c.value) + " dmg + " + string(_c.value) + " block";
    return _base;
}

function card_type_label(_c) {
    if (_c.type == "attack") return "Attack";
    if (_c.type == "defend") return "Defend";
    if (_c.type == "both")   return "Combo";
    return _c.type;
}

function card_type_color(_c) {
    if (_c.type == "attack") return c_red;
    if (_c.type == "defend") return c_aqua;
    if (_c.type == "both")   return c_lime;
    return c_white;
}

function card_level_stars(_c) {
    var s = "";
    for (var i = 0; i < _c.level; i++) s += "*";
    return s;
}

function card_price(_c) {
    return 10 + (_c.cost * 15);
}

// Draw a card at a given position
function draw_card(_c, _x, _y, _w, _h, _hovered, _affordable) {
    var _elem     = variable_struct_exists(_c, "element") ? _c.element : "physical";
    var _elem_col = element_display_color(_elem);
    var _tc       = card_type_color(_c);

    // Background
    draw_set_color(make_color_rgb(18, 18, 38));
    draw_rectangle(_x, _y, _x + _w, _y + _h, false);

    // Element stripe along the left edge (3px)
    if (_elem != "physical") {
        draw_set_color(_elem_col);
        draw_rectangle(_x, _y, _x + 3, _y + _h, false);
    }

    // Border — element-tinted when affordable, grey when not
    var _border_col = _affordable ? (_hovered ? c_yellow : _elem_col) : c_dkgray;
    draw_set_color(_border_col);
    draw_rectangle(_x, _y, _x + _w, _y + _h, true);

    // Element badge (top-left, small)
    var _elabel = element_label(_elem);
    if (_elabel != "") {
        draw_set_color(_affordable ? _elem_col : c_dkgray);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_text(_x + 5, _y + 4, _elabel);
    }

    // Level stars (top-right)
    draw_set_color(c_yellow);
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);
    draw_text(_x + _w - 4, _y + 4, card_level_stars(_c));

    draw_set_halign(fa_center);
    draw_set_valign(fa_top);

    // Name
    draw_set_color(_hovered && _affordable ? c_yellow : (_affordable ? c_white : c_dkgray));
    draw_text(_x + _w / 2, _y + 18, _c.name);

    // Type label
    draw_set_color(_affordable ? _tc : c_dkgray);
    draw_text(_x + _w / 2, _y + 32, card_type_label(_c));

    // Effect (damage/block)
    draw_set_color(_affordable ? c_white : c_dkgray);
    draw_text(_x + _w / 2, _y + 46, card_description(_c));

    // Status effect (if any)
    var _sdesc = status_description(_c);
    if (_sdesc != "") {
        draw_set_color(_affordable ? _elem_col : c_dkgray);
        draw_text(_x + _w / 2, _y + 60, _sdesc);
    }

    // Cost
    draw_set_color(_affordable ? c_yellow : c_dkgray);
    draw_text(_x + _w / 2, _y + 74, "Cost: " + string(_c.cost));

    // XP bar
    if (_c.level < 3) {
        var _thresh = obj_global.card_level_thresholds;
        var _prev   = _thresh[_c.level - 1];
        var _next   = _thresh[_c.level];
        var _prog   = clamp((_c.card_xp - _prev) / (_next - _prev), 0, 1);

        var bx = _x + 6;
        var by = _y + _h - 14;
        var bw = _w - 12;

        draw_set_color(make_color_rgb(30, 30, 50));
        draw_rectangle(bx, by, bx + bw, by + 8, false);
        draw_set_color(c_lime);
        draw_rectangle(bx, by, bx + bw * _prog, by + 8, false);
        draw_set_color(c_dkgray);
        draw_rectangle(bx, by, bx + bw, by + 8, true);
    } else {
        draw_set_color(c_yellow);
        draw_set_halign(fa_center);
        draw_text(_x + _w / 2, _y + _h - 14, "MAX");
    }
}

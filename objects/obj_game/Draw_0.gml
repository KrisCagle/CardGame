// Background
draw_set_color(make_color_rgb(8, 8, 18));
draw_rectangle(0, 0, 1280, 720, false);

draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(make_color_rgb(140, 120, 180));
draw_text(640, 20, "Turn " + string(turn));

// ============================================================
// PLAYER SIDE (bottom-left)
// ============================================================
draw_set_halign(fa_left);
draw_set_color(c_lime);
draw_text(50, 560, "HP:     " + string(player_hp) + " / " + string(player_hp_max));
// HP bar
draw_set_color(make_color_rgb(60, 0, 0));
draw_rectangle(50, 576, 270, 589, false);
draw_set_color(c_lime);
draw_rectangle(50, 576, 50 + 220 * clamp(player_hp / player_hp_max, 0, 1), 589, false);
draw_set_color(c_dkgray);
draw_rectangle(50, 576, 270, 589, true);
draw_set_color(c_aqua);
draw_text(50, 596, "Block:  " + string(player_block));
draw_set_color(c_yellow);
draw_text(50, 618, "Energy: " + string(energy) + " / " + string(energy_max));

// Player status effects
var _psy = 638;
if (player_freeze_turns > 0) {
    draw_set_color(make_color_rgb(100, 200, 255));
    draw_text(50, _psy, "FROZEN (" + string(player_freeze_turns) + ")");
    _psy += 18;
}
if (player_burn_turns > 0) {
    draw_set_color(make_color_rgb(255, 120, 40));
    draw_text(50, _psy, "BURN " + string(player_burn_dmg) + " x" + string(player_burn_turns));
    _psy += 18;
}
if (player_poison_stacks > 0) {
    draw_set_color(make_color_rgb(100, 220, 80));
    draw_text(50, _psy, "POISON " + string(player_poison_stacks) + " stacks");
    _psy += 18;
}
if (player_weakened) {
    draw_set_color(make_color_rgb(180, 100, 220));
    draw_text(50, _psy, "WEAKENED (next attack -33%)");
}

// ============================================================
// ENEMY SIDE (top-right)
// ============================================================
draw_set_halign(fa_right);
draw_set_color(c_white);
draw_text(1230, 40, enemy_name);

// Element badge next to enemy name
var _elem_col = element_display_color(enemy_element);
draw_set_color(_elem_col);
draw_set_halign(fa_right);
draw_text(1230, 57, "[" + string_upper(enemy_element) + "]");

draw_set_color(c_white);
draw_set_halign(fa_right);
draw_text(1230, 74, "HP: " + string(enemy_hp) + " / " + string(enemy_hp_max));

// Enemy HP bar
draw_set_color(make_color_rgb(60, 0, 0));
draw_rectangle(1030, 88, 1230, 101, false);
draw_set_color(c_red);
draw_rectangle(1030, 88, 1030 + 200 * clamp(enemy_hp / enemy_hp_max, 0, 1), 101, false);
draw_set_color(c_dkgray);
draw_rectangle(1030, 88, 1230, 101, true);
draw_set_color(c_white);
draw_text(1230, 106, "Block: " + string(enemy_block));

// Enemy intent badge
var intent_text  = "";
var intent_color = c_white;
if (enemy_intent == "attack") {
    intent_text  = "! ATTACK " + string(enemy_intent_value);
    intent_color = c_red;
} else if (enemy_intent == "block") {
    intent_text  = "# BLOCK " + string(enemy_intent_value);
    intent_color = c_aqua;
} else if (enemy_intent == "burn") {
    intent_text  = "~ BURN " + string(enemy_intent_value) + " x2";
    intent_color = make_color_rgb(255, 120, 40);
} else if (enemy_intent == "freeze") {
    intent_text  = "* FREEZE";
    intent_color = make_color_rgb(100, 200, 255);
} else if (enemy_intent == "poison") {
    intent_text  = "@ POISON " + string(enemy_intent_value) + " stacks";
    intent_color = make_color_rgb(100, 220, 80);
} else if (enemy_intent == "weaken") {
    intent_text  = "- WEAKEN";
    intent_color = make_color_rgb(180, 100, 220);
}
draw_set_color(intent_color);
draw_text(1230, 122, intent_text);

// Enemy status effects
var _esy = 144;
if (enemy_freeze_turns > 0) {
    draw_set_color(make_color_rgb(100, 200, 255));
    draw_text(1230, _esy, "FROZEN (" + string(enemy_freeze_turns) + ")");
    _esy += 18;
}
if (enemy_burn_turns > 0) {
    draw_set_color(make_color_rgb(255, 120, 40));
    draw_text(1230, _esy, "BURN " + string(enemy_burn_dmg) + " x" + string(enemy_burn_turns));
    _esy += 18;
}
if (enemy_poison_stacks > 0) {
    draw_set_color(make_color_rgb(100, 220, 80));
    draw_text(1230, _esy, "POISON " + string(enemy_poison_stacks) + " stacks");
    _esy += 18;
}
if (enemy_weakened) {
    draw_set_color(make_color_rgb(180, 100, 220));
    draw_text(1230, _esy, "WEAKENED");
}

// ============================================================
// EFFECTIVENESS FLASH (center screen)
// ============================================================
if (effectiveness_timer > 0) {
    var _eff_alpha = effectiveness_timer / 90.0;
    draw_set_alpha(_eff_alpha);
    if (last_effectiveness == "SUPER EFFECTIVE!") {
        draw_set_color(make_color_rgb(255, 220, 50));
    } else {
        draw_set_color(make_color_rgb(160, 160, 160));
    }
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(640, 420, last_effectiveness);
    draw_set_alpha(1);
}

// ============================================================
// HAND OF CARDS
// ============================================================
var card_w = 100;
var card_h = 100;
var card_x = 140;
for (var i = 0; i < array_length(hand); i++) {
    var c        = hand[i];
    var hovered  = (mouse_x >= card_x && mouse_x <= card_x + card_w
                 && mouse_y >= 490    && mouse_y <= 490 + card_h);
    var can_play = (energy >= c.cost) && (player_freeze_turns == 0);
    draw_card(c, card_x, 490, card_w, card_h, hovered, can_play);
    card_x += card_w + 10;
}

// Frozen message
if (player_freeze_turns > 0 && game_state == "player_turn") {
    draw_set_color(make_color_rgb(100, 200, 255));
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(640, 460, "FROZEN — End your turn to thaw");
}

// Level-up flash
if (levelup_flash > 0) {
    levelup_flash--;
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(640, 440, "LEVEL UP!");
}

// End Turn button
if (game_state == "player_turn") {
    var btn_hov = (mouse_x >= 1050 && mouse_x <= 1200 && mouse_y >= 640 && mouse_y <= 680);
    draw_set_color(btn_hov ? c_yellow : c_white);
    draw_rectangle(1050, 640, 1200, 680, true);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(1125, 660, "End Turn [E]");
}

// Deck / discard counts
draw_set_color(c_dkgray);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(50, 470, "Deck: " + string(array_length(deck)) + "  Discard: " + string(array_length(discard)));

// ============================================================
// CARD REWARD SCREEN
// ============================================================
if (game_state == "card_reward") {
    draw_set_color(make_color_rgb(10, 10, 30));
    draw_rectangle(0, 0, 1280, 720, false);
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text(640, 140, "VICTORY!  Choose a card to add to your deck.");
    draw_set_color(c_dkgray);
    draw_text(640, 172, "[ S ] to skip");

    var slot_w  = 140;
    var slot_h  = 130;
    var slot_y  = 240;
    var total_w = array_length(reward_cards) * slot_w + (array_length(reward_cards) - 1) * 40;
    var start_x = 640 - total_w / 2;

    for (var i = 0; i < array_length(reward_cards); i++) {
        var rc  = reward_cards[i];
        var rx  = start_x + i * (slot_w + 40);
        var hov = (mouse_x >= rx && mouse_x <= rx + slot_w
                && mouse_y >= slot_y && mouse_y <= slot_y + slot_h);
        draw_card(rc, rx, slot_y, slot_w, slot_h, hov, true);
    }

    // Element guide legend
    draw_set_color(make_color_rgb(80, 80, 100));
    draw_set_halign(fa_center);
    draw_text(640, 430, "fire > nature > stone > ice > shadow > arcane > fire");
}

// ============================================================
// WIN OVERLAY
// ============================================================
if (game_state == "win") {
    draw_set_color(make_color_rgb(0, 0, 0));
    draw_rectangle(0, 0, 1280, 720, false);
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(640, 320, "VICTORY!");
    draw_set_color(c_white);
    draw_text(640, 370, "Press SPACE to return to world");
    if (obj_global.encounter_type == "trainer" || obj_global.encounter_type == "boss") {
        var _etype = obj_global.current_enemy;
        draw_set_color(c_yellow);
        draw_text(640, 410, "+" + string(_etype.gold) + " Gold");
        if (_etype.relic != "") {
            draw_set_color(c_lime);
            draw_text(640, 440, "Relic acquired: " + _etype.relic);
        }
    }
}

// ============================================================
// LOSE OVERLAY
// ============================================================
if (game_state == "lose") {
    draw_set_color(make_color_rgb(0, 0, 0));
    draw_rectangle(0, 0, 1280, 720, false);
    draw_set_color(c_red);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(640, 320, "DEFEATED...");
    draw_set_color(c_white);
    draw_text(640, 370, "Press R to return to world");
}

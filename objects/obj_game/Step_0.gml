// --- Helper: check element matchup ---
// Returns 1.4 (super), 0.75 (weak), or 1.0 (neutral)
function get_element_mult(_card_elem, _enemy_elem) {
    if (_card_elem == "physical" || _card_elem == "") return 1.0;
    var _beats = obj_global.element_beats[$ _card_elem];
    if (_beats == _enemy_elem) return 1.4;
    // Check if enemy element beats our element
    var _enemy_beats = obj_global.element_beats[$ _enemy_elem];
    if (_enemy_beats == _card_elem) return 0.75;
    return 1.0;
}

// ============================================================
// PLAYER TURN
// ============================================================
if (game_state == "player_turn") {

    // Tick down effectiveness flash
    if (effectiveness_timer > 0) effectiveness_timer--;

    var card_x     = 140;
    var card_w     = 100;
    var card_played = false;

    for (var i = 0; i < array_length(hand); i++) {
        if (card_played) break;
        var c  = hand[i];
        var x1 = card_x;
        var x2 = card_x + card_w;
        var y1 = 490;
        var y2 = 490 + card_w;

        if (mouse_check_button_pressed(mb_left)) {
            if (mouse_x >= x1 && mouse_x <= x2 && mouse_y >= y1 && mouse_y <= y2) {
                if (energy >= c.cost && player_freeze_turns == 0) {
                    energy -= c.cost;

                    // --- Element matchup ---
                    var _card_elem = variable_struct_exists(c, "element") ? c.element : "physical";
                    var _mult      = get_element_mult(_card_elem, enemy_element);

                    if (_mult > 1.0) {
                        last_effectiveness  = "SUPER EFFECTIVE!";
                        effectiveness_timer = 90;
                    } else if (_mult < 1.0) {
                        last_effectiveness  = "NOT VERY EFFECTIVE";
                        effectiveness_timer = 90;
                    } else {
                        last_effectiveness  = "";
                        effectiveness_timer = 0;
                    }

                    // --- Deal damage / block ---
                    if (c.type == "attack" || c.type == "both") {
                        var _raw_dmg = floor(c.value * _mult);
                        // Apply player weaken to outgoing damage
                        if (player_weakened) {
                            _raw_dmg   = floor(_raw_dmg * 0.67);
                            player_weakened = false;
                        }
                        var dmg      = max(0, _raw_dmg - enemy_block);
                        enemy_block  = max(0, enemy_block - _raw_dmg);
                        enemy_hp    -= dmg;
                    }
                    if (c.type == "defend" || c.type == "both") {
                        player_block += c.value;
                    }

                    // --- Apply card status effect to enemy ---
                    var _seff = variable_struct_exists(c, "status_effect") ? c.status_effect : "";
                    var _sval = variable_struct_exists(c, "status_value")  ? c.status_value  : 0;
                    if (_seff == "burn") {
                        enemy_burn_turns = 2;
                        enemy_burn_dmg   = _sval;
                    } else if (_seff == "freeze") {
                        enemy_freeze_turns = max(enemy_freeze_turns, 1);
                    } else if (_seff == "poison") {
                        enemy_poison_stacks += _sval;
                    } else if (_seff == "weaken") {
                        enemy_weakened = true;
                    }

                    // --- Card XP and level-up ---
                    c.card_xp++;
                    var _thresh = obj_global.card_level_thresholds;
                    if (c.level < 3 && c.card_xp >= _thresh[c.level]) {
                        c.level++;
                        c.value      = c.base_value + obj_global.card_level_bonus(c.type, c.level - 1);
                        levelup_flash = 30;
                    }

                    array_push(discard, c);
                    array_delete(hand, i, 1);
                    card_played = true;
                }
            }
        }
        card_x += card_w + 10;
    }

    // End Turn
    var end_turn_clicked = mouse_check_button_pressed(mb_left)
        && mouse_x >= 1050 && mouse_x <= 1200
        && mouse_y >= 640  && mouse_y <= 680;

    if (keyboard_check_pressed(ord("E")) || end_turn_clicked) {
        game_state = "enemy_turn";
    }
}

// ============================================================
// ENEMY TURN
// ============================================================
if (game_state == "enemy_turn") {

    // 1. Process enemy status effects (they take damage from their conditions)
    if (enemy_burn_turns > 0) {
        enemy_hp -= enemy_burn_dmg;
        enemy_burn_turns--;
    }
    if (enemy_poison_stacks > 0) {
        enemy_hp -= enemy_poison_stacks;
        enemy_poison_stacks = max(0, enemy_poison_stacks - 1);
    }

    // 2. Enemy acts — skip if frozen
    if (enemy_freeze_turns > 0) {
        enemy_freeze_turns--;
        // Enemy is stunned — does nothing this turn
    } else {
        // Resolve enemy's chosen intent
        if (enemy_intent == "attack") {
            var _raw = enemy_intent_value;
            if (enemy_weakened) {
                _raw        = floor(_raw * 0.67);
                enemy_weakened = false;
            }
            var dmg     = max(0, _raw - player_block);
            player_block = max(0, player_block - _raw);
            player_hp  -= dmg;

        } else if (enemy_intent == "block") {
            enemy_block += enemy_intent_value;

        } else if (enemy_intent == "burn") {
            player_burn_turns = 2;
            player_burn_dmg   = enemy_intent_value;

        } else if (enemy_intent == "freeze") {
            player_freeze_turns = max(player_freeze_turns, 1);

        } else if (enemy_intent == "poison") {
            player_poison_stacks += enemy_intent_value;

        } else if (enemy_intent == "weaken") {
            player_weakened = true;
        }
    }

    // 3. Process player status effects (burns/poisons tick at end of enemy turn)
    if (player_burn_turns > 0) {
        player_hp -= player_burn_dmg;
        player_burn_turns--;
    }
    if (player_poison_stacks > 0) {
        player_hp -= player_poison_stacks;
        player_poison_stacks = max(0, player_poison_stacks - 1);
    }
    // Player freeze countdown
    if (player_freeze_turns > 0) player_freeze_turns--;

    // 4. Reset per-turn, draw new hand
    player_block = 0;
    energy       = energy_max;
    turn++;

    while (array_length(hand) < 5 && (array_length(deck) > 0 || array_length(discard) > 0)) {
        if (array_length(deck) == 0) {
            deck    = discard;
            discard = [];
        }
        var idx = irandom(array_length(deck) - 1);
        array_push(hand, deck[idx]);
        array_delete(deck, idx, 1);
    }

    // 5. Pick next enemy intent
    var next           = enemy_pool[irandom(array_length(enemy_pool) - 1)];
    enemy_intent       = next.type;
    enemy_intent_value = next.value;

    game_state = "player_turn";
}

// ============================================================
// VICTORY
// ============================================================
if (enemy_hp <= 0 && game_state != "card_reward" && game_state != "win" && game_state != "lose") {
    obj_global.player_hp  = player_hp;
    obj_global.experience += 10;

    if (obj_global.encounter_type == "trainer") {
        var _etype = obj_global.current_enemy;
        obj_global.gold += _etype.gold;
        if (_etype.relic != "") array_push(obj_global.relics, _etype.relic);
        game_state = "win";

    } else if (obj_global.encounter_type == "boss") {
        var _etype = obj_global.current_enemy;
        obj_global.gold += _etype.gold;
        if (_etype.relic != "") array_push(obj_global.relics, _etype.relic);
        obj_global.boss_defeated = true;
        reward_cards = [];
        var pool_copy = array_create(array_length(obj_global.boss_card_pool));
        array_copy(pool_copy, 0, obj_global.boss_card_pool, 0, array_length(obj_global.boss_card_pool));
        repeat(3) {
            if (array_length(pool_copy) == 0) break;
            var idx = irandom(array_length(pool_copy) - 1);
            array_push(reward_cards, pool_copy[idx]);
            array_delete(pool_copy, idx, 1);
        }
        game_state = "card_reward";

    } else {
        reward_cards = [];
        var pool_copy = array_create(array_length(obj_global.card_pool));
        array_copy(pool_copy, 0, obj_global.card_pool, 0, array_length(obj_global.card_pool));
        repeat(3) {
            if (array_length(pool_copy) == 0) break;
            var idx = irandom(array_length(pool_copy) - 1);
            array_push(reward_cards, pool_copy[idx]);
            array_delete(pool_copy, idx, 1);
        }
        game_state = "card_reward";
    }
}

// ============================================================
// CARD REWARD PICK
// ============================================================
if (game_state == "card_reward") {
    var slot_w  = 160;
    var slot_h  = 160;
    var slot_y  = 270;
    var total_w = array_length(reward_cards) * slot_w + (array_length(reward_cards) - 1) * 40;
    var start_x = 640 - total_w / 2;

    if (mouse_check_button_pressed(mb_left)) {
        for (var i = 0; i < array_length(reward_cards); i++) {
            var rx = start_x + i * (slot_w + 40);
            if (mouse_x >= rx && mouse_x <= rx + slot_w
            &&  mouse_y >= slot_y && mouse_y <= slot_y + slot_h) {
                array_push(obj_global.deck, reward_cards[i]);
                game_state = "win";
                break;
            }
        }
    }

    if (keyboard_check_pressed(ord("S"))) {
        game_state = "win";
    }
}

// ============================================================
// DEFEAT
// ============================================================
if (player_hp <= 0 && game_state != "lose" && game_state != "win" && game_state != "card_reward") {
    game_state = "lose";
    obj_global.player_hp = obj_global.player_hp_max;
}

// ============================================================
// WIN / LOSE navigation
// ============================================================
if (game_state == "win") {
    if (keyboard_check_pressed(vk_space)) {
        save_game();
        room_goto(obj_global.return_room);
    }
}

if (game_state == "lose") {
    if (keyboard_check_pressed(ord("R"))) {
        save_game();
        room_goto(obj_global.return_room);
    }
}

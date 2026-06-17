if (opened) exit;

if (keyboard_check_pressed(vk_space)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 48) {
        opened = true;
        array_push(obj_global.defeated_enemies, defeat_id);

        if (reward_type == "gold") {
            obj_global.gold += reward_value;
        } else if (reward_type == "card") {
            // Give a random card from the pool
            var pool = obj_global.card_pool;
            var card = pool[irandom(array_length(pool) - 1)];
            array_push(obj_global.deck, card);
        } else if (reward_type == "relic") {
            array_push(obj_global.relics, reward_value); // reward_value holds relic name here
        }
    }
}

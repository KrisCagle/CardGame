if (close_cooldown > 0) {
    close_cooldown--;
    exit;
}

if (!open) exit;

// Close on Escape or E
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("E"))) {
    open = false;
    close_cooldown = 10;
    exit;
}

// Card slot click — buy a card
var slot_w  = 160;
var slot_h  = 160;
var slot_y  = 240;
var total_w = array_length(stock) * slot_w + (array_length(stock) - 1) * 40;
var start_x = 683 - total_w / 2; // 683 = half of 1366

if (mouse_check_button_pressed(mb_left)) {
    for (var i = 0; i < array_length(stock); i++) {
        var c   = stock[i];
        var price = card_price(c);
        var sx  = start_x + i * (slot_w + 40);
        if (mouse_x >= sx && mouse_x <= sx + slot_w
        &&  mouse_y >= slot_y && mouse_y <= slot_y + slot_h) {
            if (obj_global.gold >= price) {
                obj_global.gold -= price;
                array_push(obj_global.deck, c);
                array_delete(stock, i, 1);
            }
            break;
        }
    }
}

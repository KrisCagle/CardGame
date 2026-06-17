if (instance_number(obj_shop) > 1) {
    instance_destroy();
    exit;
}

open           = false;
stock          = [];
close_cooldown = 0;
theme          = "";   // element specialisation for the current town

function shop_open(_theme = "") {
    theme = _theme;
    // Build the pool — filter by element theme if one is given
    var _src = obj_global.card_pool;
    var _pool = [];
    for (var _i = 0; _i < array_length(_src); _i++) {
        var _c = _src[_i];
        var _elem = variable_struct_exists(_c, "element") ? _c.element : "physical";
        if (_theme == "" || _theme == "physical" || _elem == _theme) {
            array_push(_pool, _c);
        }
    }
    // Fall back to full pool if the theme yielded fewer than 3 cards
    if (array_length(_pool) < 3) _pool = _src;

    // Pick 3 unique cards from the filtered pool
    stock = [];
    var _pool_copy = array_create(array_length(_pool));
    array_copy(_pool_copy, 0, _pool, 0, array_length(_pool));
    repeat (3) {
        if (array_length(_pool_copy) == 0) break;
        var _idx = irandom(array_length(_pool_copy) - 1);
        array_push(stock, _pool_copy[_idx]);
        array_delete(_pool_copy, _idx, 1);
    }
    open           = true;
    close_cooldown = 2;
}

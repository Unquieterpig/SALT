surf = -1;

circles = ds_list_create();

// helper to add a circle
function circle_add(_x, _y, _r) {
    ds_list_add(circles, { x: _x, y: _y, r: _r, alive: true });
}


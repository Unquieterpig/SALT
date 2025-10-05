var n = ds_list_size(circles);
for (var i = 0; i < n; i++) {
    var c = circles[| i];
    if (c.alive && c.y <= obj_tide.y) {
        c.alive = false;
        circles[| i] = c;
    }

}
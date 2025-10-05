// ensure surface
if (!surface_exists(surf)) {
    surf = surface_create(room_width, room_height);
}

// rebuild the circles surface *this frame*
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

var n = ds_list_size(circles);
for (var i = 0; i < n; i++) {
    var c = circles[| i];
    if (c.alive) {
        draw_set_alpha(1);
        draw_set_color(c_grey);
		draw_circle(c.x, c.y, c.r, false)
    }
}
surface_reset_target();

draw_surface(surf, 0, 0);
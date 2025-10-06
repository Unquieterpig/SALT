/// 0) Let the game draw everything underneath as usual (instances, tiles, background).
///    This object is on a top layer, so we just draw the cover on top.

/// 1) Ensure the cover surface
if (!surface_exists(cover_surf)) {
    cover_surf = surface_create(room_width, room_height);
}

/// 2) Rebuild the cover this frame
surface_set_target(cover_surf);

// Start fully transparent
draw_clear_alpha(c_black, 0);

// (A) Draw the COVER as fully opaque. This is the sheet that hides everything.
//     Replace this rectangle with your sand texture/sprite if you have one.
draw_set_alpha(1);
draw_sprite(spr_beach,0,0,0)
//draw_set_color(c_white);                // color doesn't matter; alpha does
//draw_rectangle(0, 0, room_width, room_height, false);

// (B) Punch transparent holes where the player dug.
//     Blend setup: keep RGB as-is, but reduce destination ALPHA by src alpha.
//
gpu_set_blendmode_ext_sepalpha(
    bm_one, bm_zero,         // RGB: dst = dst  (unchanged)
    bm_zero, bm_inv_src_alpha// A:   dstA = (1 - srcA) * dstA  (subtract)
);

var n = ds_list_size(circles);
for (var i = 0; i < n; i++) {
    var c = circles[| i];
    if (c.alive) {
        draw_set_alpha(1);          // fully erase alpha in this circle
        draw_set_color(c_white);    // srcA = 1
        draw_circle(c.x, c.y, c.r, false); // FILLED circle
    }
}

// back to normal blending
gpu_set_blendmode(bm_normal);

surface_reset_target();

/// 3) Finally, draw the cover on top of everything.
// The transparent punched holes will REVEAL the instance layer below.
draw_surface(cover_surf, 0, 0);
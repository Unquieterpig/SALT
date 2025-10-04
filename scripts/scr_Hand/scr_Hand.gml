function scr_Hand() {
    // Base (anchor) position
    var base_x = room_width / 2;
    var base_y = room_height + 150;

    // Horizontal movement stays directly under the mouse
    x = mouse_x;

    // Calculate vertical distance from the base
    var dist_y = mouse_y - base_y;

    // Small offset that lets the hand "follow" the mouse downward slightly
    // The deeper the mouse goes below base_y, the more the hand base moves down
    var slack = clamp(dist_y * 0.15, -150, 150);

    // Apply the slight movement to the hand's base
    y = base_y + slack;

    // Scale the hand toward the mouse
    image_yscale = -(mouse_y - y) / sprite_get_height(sprite_index);

    image_yscale = clamp(image_yscale, 0.3, 2.5);
}

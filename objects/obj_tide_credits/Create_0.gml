// Scale the sprite to fit the screen dimensions
xscale = 1390 / sprite_get_width(spr_tide);
yscale = 768 / sprite_get_height(spr_tide);

// --- Tide Movement Variables ---

// Store the starting vertical position. The tide will move up and down from this point.
y_start = y;

// A counter to drive the sine wave for smooth motion
time = 0;

// Set initial random values for the tide's behavior
tide_amplitude = random_range(20, 50); // How far the tide moves up and down
tide_speed = random_range(0.1, 1);      // How fast the tide moves
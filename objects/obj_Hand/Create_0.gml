collected_sand = false          // Tracks if we are holding sand or not

prev_mx   = device_mouse_x(0);  // Previous mouse x position for shake detection
prev_dir  = 0;                  // Previous direction of mouse movement (-1, 0, 1)
shake_cnt = 0;                  // Counts the number of direction changes (shakes)
shake_timer = 0;                // A timer to reset the shake count if the user stops shaking

min_delta   = 6;                // Minimum pixels the mouse must move to register movement
shake_threshold   = 5;                // How many direction changes are needed to trigger a shake
shake_timer_max = 0.25 * 1000000;   // How many frames the user has to continue a shake

sparkle_chance_base = 0.10; // Base chance of finding nathinum
sparkle_chance_increment = 0.01; // Increase amount
sparkle_chance = sparkle_chance_base; // Current chance

goal_amount = 100; // Amount to complete the task

// Hand stuff
hand_xscale = 268 / sprite_get_width(spr_hand_finished);
hand_yscale = 650 / sprite_get_height(spr_hand_finished);

// Feedback stuff
feedback_text = ""; // Text to display
feedback_timer = 0; // Countdown timer
feedback_duration = 5 * 1000000; // How long to show text

image_speed = 0.5;

// Define possible states
enum HAND_STATE {
    COLLECTING,
    HOLDING,
	SHAKING,
	TRANSPORTING
}

state = HAND_STATE.COLLECTING;  // Set the starting state
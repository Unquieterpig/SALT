// --- GENERAL BEHAVIOR ---

// Make the object's horizontal position always follow the mouse.
x = mouse_x;

// --- STATE 1: NOT HOLDING SAND ---

// This block runs if the 'collected_sand' flag is false.
if collected_sand == false {
	
	// Clamp y position Nate-e-poo
	y = max(300, mouse_y);

	// Use fancy ternary operator Nate-e-poo
	sprite_index = mouse_check_button(mb_left) ? spr_hand_grasp : spr_hand_open;
	
	if mouse_check_button_released(mb_left){
		collected_sand = true
	}
}
else{
	if mouse_check_button(mb_right){
		collected_sand = false
	}
	
	var mx = device_mouse_x(0);
	var dx = mx - prev_mx;
	var dir = (abs(dx) >= min_delta) ? sign(dx) : 0;

	if (dir != 0 && dir != prev_dir) {
	    shake_cnt++;
	    prev_dir = dir;
	    shake_timer = timeout_max;
	}

	if (shake_timer > 0) {
	    shake_timer--;
	}
	else {
	    shake_cnt = 0;
	    prev_dir = 0;
	}

	if (shake_cnt >= threshold) {
	    show_debug_message("SHAKE!");
	    shake_cnt = 0;
	    prev_dir = 0;
	    shake_timer = 0;
	}

	prev_mx = mx;
}
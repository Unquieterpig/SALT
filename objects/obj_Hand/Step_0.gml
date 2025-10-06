// --- GENERAL BEHAVIOR ---

// Make the object's horizontal position always follow the mouse.
x = mouse_x;

switch(state){
	// --- STATE 1: COLLECTING SAND ---
	case HAND_STATE.COLLECTING: {
		
		y = max(300, mouse_y);
		
		// Collecting -> Holding
		if (mouse_check_button_released(mb_left)) {
			state = HAND_STATE.HOLDING;
		}
		
		// Tell beach object to add circles
		if (mouse_check_button(mb_left)){
			obj_beach_dugup.circle_add(x,y, 48);
		}
	break;
	}
	// --- STATE 2: HOLDING SAND ---	
	case HAND_STATE.HOLDING: {
	
		if (mouse_check_button_pressed(mb_right)) {
			state = HAND_STATE.COLLECTING;
			break;
		}
		
		// -- SHAKE LOGIC ---
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
	break;	
		}
}
// --- GENERAL BEHAVIOR ---

// Make the object's horizontal position always follow the mouse.
x = mouse_x;
y = max(300, mouse_y);

if (feedback_timer > 0) {
	feedback_timer -= delta_time;
}


switch(state){
	// --- STATE 1: COLLECTING SAND ---
	case HAND_STATE.COLLECTING: {
		
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
	
		// Cancel
		if (mouse_check_button_pressed(mb_right)) {
			state = HAND_STATE.COLLECTING;
			break;
		}
		
		// is shaking
		var mx = device_mouse_x(0);
		var dx = mx - prev_mx;
		var dir = sign(dx);
		
		if (dir != 0 && dir != prev_dir) {
			shake_cnt = 1;
			shake_timer = shake_timer_max;
			state = HAND_STATE.SHAKING;
		}

		prev_dir = dir;
		prev_mx = mx;
		
	break;	
	}
	
	// --- STATE 3: SHAKING SAND ---
	case HAND_STATE.SHAKING: {
		
		// Cancel
        if (mouse_check_button_pressed(mb_right)) {
            state = HAND_STATE.COLLECTING;
            shake_cnt = 0;
        }
		
		// is shaking
        var mx = device_mouse_x(0);
        var dx = mx - prev_mx;
        var dir = sign(dx);

        // --- Handle Shake Timer ---
        if (shake_timer > 0) {
            shake_timer -= delta_time;
        } else {
            // Player took too long; reset.
            state = HAND_STATE.HOLDING;
            shake_cnt = 0;
            break;
        }

        // --- Count Shakes ---
        if (dir != 0 && dir != prev_dir) {
            shake_cnt++;
            shake_timer = shake_timer_max;
        }
        
        prev_dir = dir;
        prev_mx = mx;

        // --- Check for Success ---
        if (shake_cnt >= shake_threshold) {
            // if (random(1.0) < sparkle_chance) {
			if (true) {
				feedback_text = "You found a Nathinum Particle!";
				feedback_timer = feedback_duration;
                state = HAND_STATE.TRANSPORTING;
				
				sparkle_chance = sparkle_chance_base;
            } else {
				feedback_text = "Nothing this time...";
				feedback_timer = feedback_duration;
                state = HAND_STATE.COLLECTING;
				
				sparkle_chance += sparkle_chance_increment;
				sparkle_chance = min(1.0, sparkle_chance);
            }
        }

        break;
	
	}
	
	case HAND_STATE.TRANSPORTING: {
		
		// Cancel
		if (mouse_check_button_pressed(mb_right)) {
            // Nathan-e-poo: You could have the sparkle fall to the ground here
            state = HAND_STATE.COLLECTING;
        }
		
		// Bucket delivery
        if (place_meeting(x, y, obj_bucket)) {
			
			goal_amount--;
			
            feedback_text = "Nice! Only " + string(goal_amount) + " particles left!";
			feedback_timer = feedback_duration;
            state = HAND_STATE.COLLECTING;
        }

        break;
	}
}
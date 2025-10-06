// --- GENERAL BEHAVIOR ---

if hp <= 0{
	room_goto(rm_gameover)
}

// Make the object's horizontal position always follow the mouse.


x = mouse_x;
y = max(380, mouse_y);

if (feedback_timer > 0) {
	feedback_timer -= delta_time;
}


switch(state){
	// --- STATE 1: COLLECTING SAND ---
	case HAND_STATE.COLLECTING: {
		
		var digout_distance = point_distance(dig_x1,dig_y1,dig_x2,dig_y2)
		show_debug_message(digout_distance)
		
		
		// Collecting -> Holding
		if (mouse_check_button_released(mb_left)) {
			audio_play_sound(snd_sand_pickup, 0, false)
			state = HAND_STATE.HOLDING;
			sand_stage = 7 - floor(digout_distance/28)
			show_debug_message(floor(digout_distance/28))
		}
		
		if (mouse_check_button_pressed(mb_left)){
			dig_x1 = x
			dig_y1 = y
			audio_play_sound(snd_sand_pickup, 0, false)
		}
		
		// Tell beach object to add circles
		if (mouse_check_button(mb_left)){
			if instance_position(mouse_x, mouse_y, obj_fent_needle){
				mouse_clear(mb_left)
				hp--;
			}
			obj_beach_dugup.circle_add(x,y, 48);
			dig_x2 = x
			dig_y2 = y
		}
		
		
		if digout_distance >= digout_max_distance{
			audio_play_sound(snd_sand_pickup, 0, false)
			state = HAND_STATE.HOLDING;
			sand_stage = 0
			dig_x1 = 0
			dig_y1 = 0
			dig_x2 = 0
			dig_y2 = 0
		}
	break;
	}
	// --- STATE 2: HOLDING SAND ---	
	case HAND_STATE.HOLDING: {
	
		if sand_stage >= 6
		{
			state = HAND_STATE.COLLECTING;
		}
	
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
			sand_stage++;
			shake_cnt = 0;
			prev_dir = 0;
			shake_timer = 0;
			audio_play_sound(snd_sand_shake, 0, false)
            //if (random(1.0) < sparkle_chance) {
			//	feedback_text = "You found a Nathinum Particle!";
			//	feedback_timer = feedback_duration;
            //    state = HAND_STATE.TRANSPORTING;
				
			//	sparkle_chance = sparkle_chance_base;
            //} else {
			//	feedback_text = "Nothing this time...";
			//	feedback_timer = feedback_duration;
            //    state = HAND_STATE.COLLECTING;
				
			//	sparkle_chance += sparkle_chance_increment;
			//	sparkle_chance = min(1.0, sparkle_chance);
            //}
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
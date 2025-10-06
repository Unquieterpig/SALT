// --- FEEDBACK TEXT ---
if (feedback_timer > 0) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(font_comicsans);
    draw_set_color(c_white);

	// Draw text above hand
    draw_text(x, y - 300, feedback_text);

	// Reset alignment
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}


// --- HAND ---
switch (state) {
    case HAND_STATE.COLLECTING:
        // Draw the main hand sprite
		var _sprite = mouse_check_button(mb_left) ? spr_hand_grasp_finished : spr_hand_finished;
		draw_sprite_ext(_sprite, 0, x, y, hand_xscale, hand_yscale, 0, c_white, 1.0);
		break;

    case HAND_STATE.HOLDING:
	case HAND_STATE.SHAKING:
        // Draw the palm sprite when holding sand.
		draw_sprite_ext(spr_hand_palm_finished, sand_stage, x, y, hand_xscale, hand_yscale, 0, c_white, 1.0);
        break;
		
	case HAND_STATE.TRANSPORTING:
		// Draw hand and sparkle on top
		draw_sprite(spr_hand_palm, 0, x, y);
		draw_sprite(spr_sparkle, -1, x, y);
		break;
}
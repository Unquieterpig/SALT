switch (state) {
    case HAND_STATE.COLLECTING:
        // Draw the main hand sprite
		if mouse_check_button(mb_left){
			draw_sprite(spr_hand_grasp, 0, x, y);
		}
		else {
			draw_sprite_ext(spr_hand_finished, 0, x, y, hand_xscale, hand_yscale, 0, c_white, 1.0);
		}
		break;

    case HAND_STATE.HOLDING:
        // Draw the palm sprite when holding sand.
        draw_sprite(spr_hand_palm, 0, x, 400);
        break;
}
draw_set_alpha(1)

image_xscale = 268 / sprite_get_width(spr_hand_finished)
image_yscale = 300 / sprite_get_width(spr_hand_finished)

if collected_sand == false {
	draw_sprite_ext(spr_hand_finished,0,x,y,image_xscale,image_yscale, 0, c_white,1.0)
	
	if mouse_check_button(mb_left){
		obj_beach_dugup.circle_add(x, y, 48)
	}
}

else{
	draw_sprite(spr_hand_palm,0,x,400)
}
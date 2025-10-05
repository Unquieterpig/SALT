draw_set_alpha(1)
if collected_sand == false {
	draw_self()
	
	if mouse_check_button(mb_left){
		obj_beach_dugup.circle_add(x, y, 48)
	}
}

else{
	draw_sprite(spr_hand_palm,0,x,400)
}
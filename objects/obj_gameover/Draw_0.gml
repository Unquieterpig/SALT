if fade < 100 { fade++;} 

if goto_game == true{
	percent += 1/90;
}

var _position = animcurve_channel_evaluate(ch,percent)

var _start = 0
var _end = 768
var _distance = _end - _start

y = _start + (_distance * _position);

if percent == 1 {
	room_goto(rm_beach)
}

draw_set_alpha((fade/100))
draw_sprite(spr_gameover,0,x,y)
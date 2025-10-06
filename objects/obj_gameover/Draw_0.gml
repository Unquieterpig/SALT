if fade < 100 { fade++;} 

draw_set_alpha((fade/100))
draw_sprite(spr_gameover,0,x,y)
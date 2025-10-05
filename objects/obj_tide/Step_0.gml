time += tide_speed

if (time mod 360) < 0.25 && alarm[0] == -1
{
	alarm[0] = game_get_speed(gamespeed_fps)
}

if floor(time mod 360) == 180
{
	instance_create_layer(x,y,"Instances_3",obj_wet_sand)
}

if time > 360 { time = 0}

y = y + dsin(time)*tide_size
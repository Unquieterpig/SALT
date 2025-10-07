var n = ds_list_size(circles);
for (var i = 0; i < n; i++) {
    var c = circles[| i];
    if (c.alive && position_meeting(c.x,c.y+32,obj_tide)){
        c.alive = false;
        circles[| i] = c;
    }

}
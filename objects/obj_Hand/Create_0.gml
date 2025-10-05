collected_sand = false

prev_mx   = device_mouse_x(0);
prev_dir  = 0;
shake_cnt = 0;
shake_timer = 0;

min_delta   = 6; 
threshold   = 4;     
timeout_max = room_speed / 4; 
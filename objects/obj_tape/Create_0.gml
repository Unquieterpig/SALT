randomize()
tape = irandom_range(1,5)
show_debug_message(tape)
xscale = 400 / sprite_get_width(spr_tape);
yscale = 300 / sprite_get_height(spr_tape);
image_index=tape-1
text = "SALT\n\nProgrammers\nNathan Hammer\nJoshua Partridge\n\nGraphics\nbob Azul\nNathan Hammer\n\nSound and Music\nGavin Redding\n\nOcean Man\nAaron Freeman and Michael Melchiondo\n\n(C) 2025 M.A.G.S.";
scroll_speed = 0.5;

draw_set_font(font_comicsans);
text_height = string_height(text);
x = room_width/2;
y = room_height + 150;

audio_play_sound(snd_credits_song, 0, false);
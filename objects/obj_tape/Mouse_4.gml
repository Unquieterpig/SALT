
switch tape {
	case 1:
		if !audio_is_playing(snd_tape1)
		audio_play_sound(snd_tape1, 1, false, 0.2)
		break;
	case 2:
		if !audio_is_playing(snd_tape2)
		audio_play_sound(snd_tape2, 1, false, 0.2)
		break;
	case 3:
		if !audio_is_playing(snd_tape3)
		audio_play_sound(snd_tape3, 1, false, 0.2)
		break;
	case 4:
		if !audio_is_playing(snd_tape4)
		audio_play_sound(snd_tape4, 1, false, 0.2)
		break;
	case 5:
		if !audio_is_playing(snd_tape5)
		audio_play_sound(snd_tape5, 1, false, 0.2)
		break;
	case 6:
		if !audio_is_playing(snd_tape6)
		audio_play_sound(snd_tape6, 1, false, 0.2)
		break;
	case 7:
		if !audio_is_playing(snd_tape7)
		audio_play_sound(snd_tape7, 1, false, 0.2)
		break;
}
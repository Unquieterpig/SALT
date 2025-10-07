audio_stop_sound(snd_gameover_song)
if !audio_is_playing(snd_annoying_loop_song){
	audio_play_sound(snd_annoying_loop_song, 0, true, 0.2)
}
audio_play_sound(snd_beach_ambience, 0, true)
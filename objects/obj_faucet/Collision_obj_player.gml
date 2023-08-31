/// @description 
if can_use{
	if !audio_is_playing(snd_gokugoku){
		audio_play_sound(snd_gokugoku, 0, false)
	}
	//can_use = false
	//other.drinking = true
	global.player_water += 1
	alarm[0] = 60
	alarm[1] = 180
}
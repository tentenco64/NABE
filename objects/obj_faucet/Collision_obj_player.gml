/// @description 
if can_use{
	audio_play_sound(snd_gokugoku, 0, false)
	can_use = false
	other.operatable = false
	global.player_water = 100
	alarm[0] = 60
	alarm[1] = 180
}
/// @description 

// 水分量の自然減少。何もしなければ1分で空になる
if global.player_water > 0{
	global.player_water -= 100/60/60
}
if global.player_water <= 0 && instance_exists(obj_player){
	global.player_water = 0
	audio_play_sound(snd_scream, 0, false)
	instance_destroy(obj_player)
}
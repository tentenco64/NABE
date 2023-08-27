/// @description 

// 水分量の自然減少。何もしなければ1分で空になる
if global.player_water > 0{
	global.player_water -= 100/60/60 * (global.player_calorie / 100)
}else{
	global.player_water = 0
}

// 熱量の自然減少
if global.player_calorie > 0{
	global.player_calorie -= 100/60/60
}else{
	global.player_calorie = 0
}

// 制限時間
if global.timer > 0{
	global.timer -= 1
}

// 死亡処理
if (global.player_water <= 0 || global.timer == 0) && instance_exists(obj_player){
	global.player_water = 0
	audio_play_sound(snd_scream, 0, false)
	instance_destroy(obj_player)
}
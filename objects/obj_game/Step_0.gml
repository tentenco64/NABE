/// @description 

// 現在フレーム
global.current_frame += 1

// 水分量の最大値
if global.player_water > 100{
	global.player_water = 100
}
// 水分量の自然減少。何もしなければ1分で空になる
if global.player_water > 0{
	global.player_water -= 100/60/60 * (global.player_calorie / 100)
}else{
	global.player_water = 0
}

// 水分量が低い場合のSE
if global.player_water < 20{
	if !audio_is_playing(snd_heartbeat){
		audio_play_sound(snd_heartbeat, 0, false)
	}
}else{
	audio_stop_sound(snd_heartbeat)
}
if global.player_water == 0{
	audio_stop_sound(snd_heartbeat)
}

// 熱量の最大値
if global.player_calorie > 100{
	global.player_calorie = 100
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

// 死亡処理、デバッグ用にPで自殺
if ((global.player_water <= 0 || global.timer == 0) && instance_exists(obj_player)) || keyboard_check(ord("P")){
	global.player_water = 0
	if global.timer == 0{
		audio_play_sound(snd_timeup, 0, false)
	}
	with(obj_player){
	instance_change(obj_player_down,true)
}
	// プレイヤーインスタンスをダウン用のインスタンスに変更
//	with(obj_player){
//		instance_change(obj_player_down, 0)
//	}
}



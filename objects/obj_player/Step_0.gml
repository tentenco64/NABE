/// @description 

// 移動
var _vx = 0
var _vy = 0

if keyboard_check(ord("D")){
	move_right = 1
	dir = 0
}else{
	move_right = 0
}
if keyboard_check(ord("W")){
	move_up = 1
	dir = 1
}else{
	move_up = 0
}
if keyboard_check(ord("A")){
	move_left = 1
	dir = 2
}else{
	move_left = 0
}
if keyboard_check(ord("S")){
	move_down = 1
	dir = 3
}else{
	move_down = 0
}

show_debug_message([move_right, move_left, move_down, move_up])

_vx = (move_right - move_left) * move_speed * global.player_calorie / 100
_vy = (move_down - move_up) * move_speed* global.player_calorie / 100


if _vx > 0{
	sprite_index = spr_player_walk_right
	image_xscale = abs(image_xscale)
}else if _vx < 0{
	sprite_index = spr_player_walk_right
	if image_xscale > 0{
		image_xscale *= -1
	}
}

if _vy > 0{
	sprite_index = spr_player_walk_down
}else if _vy < 0{
	sprite_index = spr_player_walk_up
}

if _vx==0 && _vy==0{
	sprite_index = spr_player
}

if operatable{
	if _vx == 0 && _vy == 0{
		// 待機
	}
	else{
		// 移動
		if !place_meeting(x + _vx, y, obj_wall){
			x += _vx 
		}
		if !place_meeting(x, y + _vy, obj_wall) && y+_vy < (room_height-sprite_get_height(spr_UI_ingredient)-sprite_get_height(spr_player)/2){
			y += _vy
		}
	}
}

// 減速弾の発射コマンド
if mouse_check_button_pressed(mb_left){
	if bullet_ct < 0{
		instance_create_layer(x, y, "Bullet", obj_bullet)
		global.player_water -= 1
	}
}

// クールダウン
bullet_ct -= 1

// 再加熱コマンド
if keyboard_check_pressed(ord("C")){
	operatable = false
	audio_play_sound(snd_fire, 0, true)
	audio_play_sound(snd_lighter, 0, true)
	instance_create_depth(x, y, obj_player.depth+1, obj_fire)
}
if keyboard_check(ord("C")){
	global.player_calorie += 0.5
	sprite_index = spr_player_heatup
}
if keyboard_check_released(ord("C")){
	operatable = true
	audio_stop_sound(snd_fire)
	audio_stop_sound(snd_lighter)
	instance_destroy(obj_fire)
}

// 吸い込みコマンド
if keyboard_check_pressed(ord("R")){
	audio_play_sound(snd_dyson, 0, false)
	instance_create_depth(x, y, obj_player.depth+2, obj_wind)
}
if keyboard_check(ord("R")){
	with(obj_par_enemy){
		var _dir = point_direction(x, y, obj_player.x, obj_player.y)
		motion_add(_dir, 0.5)
	}	
}
if keyboard_check_released(ord("R")){
	audio_stop_sound(snd_dyson)
	instance_destroy(obj_wind)
}
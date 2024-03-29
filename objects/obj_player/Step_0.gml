/// @description 

// スプライトの描画速度の調整
image_speed = max(global.player_calorie / 100, 0.2)

// 移動
var _vx = 0
var _vy = 0

if keyboard_check(vk_right){
	move_right = 1
	dir = 0
}else{
	move_right = 0
}
if keyboard_check(vk_up){
	move_up = 1
	dir = 1
}else{
	move_up = 0
}
if keyboard_check(vk_left){
	move_left = 1
	dir = 2
}else{
	move_left = 0
}
if keyboard_check(vk_down){
	move_down = 1
	dir = 3
}else{
	move_down = 0
}

_vx = (move_right - move_left) * move_speed * max(global.player_calorie, 10) / 100
_vy = (move_down - move_up) * move_speed* max(global.player_calorie, 10) / 100


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
		if !place_meeting(x, y + _vy, obj_wall){
			y += _vy
		}
	}
}

// 再加熱コマンド
// ダイソン中は使えない
if !(dyson_ef > 0){
	if keyboard_check_pressed(ord("C")){
	audio_play_sound(snd_fire, 0, true)
	audio_play_sound(snd_lighter, 0, true)
	instance_create_depth(x, y, obj_player.depth+1, obj_fire)
	}
}
if keyboard_check(ord("C")) && instance_exists(obj_fire){
	global.player_calorie += 0.5
	sprite_index = spr_player_heatup
}
if keyboard_check_released(ord("C")){
	audio_stop_sound(snd_fire)
	audio_stop_sound(snd_lighter)
	instance_destroy(obj_fire)
}



var _dyson_start_flame = 0

// 吸い込みコマンド
if keyboard_check_pressed(ord("X")){
	if global.dyson_ct < 0{
		audio_play_sound(snd_dyson, 0, false)
		instance_create_depth(x, y, obj_player.depth+2, obj_wind)
		// 吸い込みのクールタイム
		global.dyson_ct = 900
		dyson_ef = 150
	}
}
if dyson_ef > 0{
	sprite_index = spr_player_heatup
	with(obj_par_enemy){
		if image_alpha > 0.2{
			var _dir = point_direction(x, y, obj_player.x, obj_player.y)
			motion_add(_dir, 0.5)
		}
	}
	// 効果時間の減少
	dyson_ef -= 1
}else{
	audio_stop_sound(snd_dyson)
	instance_destroy(obj_wind)
}


// カメラをプレイヤーに追従させる
camera_set_view_pos(view_camera[0], x - 550 , y - 300); // If you don't want the y view to move then set it to 0 instead of y - _vy.

// カメラの位置調整
// カメラの位置を取得
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

// カメラの位置を調整
_cam_x = clamp(_cam_x, 0, room_width - _cam_w);
_cam_y = clamp(_cam_y, 0, room_height - _cam_h);

// カメラの位置を設定
camera_set_view_pos(view_camera[0], _cam_x, _cam_y);

// キャラクター操作の可否について条件分岐
if instance_exists(obj_fire) || dyson_ef > 0 || drinking || starting{
	operatable = false
}else{
	operatable = true
}


// 吸い込みクールタイムの減少
global.dyson_ct -= 1
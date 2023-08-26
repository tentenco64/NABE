/// @description 

// 移動
var _vx = 0
var _vy = 0

move_right = keyboard_check(ord("D"))
move_left = keyboard_check(ord("A"))
move_up = keyboard_check(ord("W"))
move_down = keyboard_check(ord("S"))

_vx = (move_right - move_left) * move_speed
_vy = (move_down - move_up) * move_speed

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

// 減速弾の発射
if mouse_check_button_pressed(mb_left){
	if bullet_ct < 0{
		instance_create_layer(x, y, "Bullet", obj_bullet)		
	}
}

// クールダウン
bullet_ct -= 1
/// @description 

// 移動
var _vx = 0
var _vy = 0

move_right = keyboard_check(vk_right)
move_left = keyboard_check(vk_left)
move_up = keyboard_check(vk_up)
move_down = keyboard_check(vk_down)

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
	if !place_meeting(x, y + _vy, obj_wall){
		y += _vy
	}
}

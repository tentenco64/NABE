/// @description 
var _move_speed

// 減速中は移動速度が1/10になる

if slow == true{
	_move_speed = initial_move_speed * 0.5
}else{
	_move_speed = initial_move_speed
}

// プレイヤーを追いかけるような移動をする
if instance_exists(obj_player){
	// プレイヤーとの距離
	var _distance_to_player = point_distance(x, y, obj_player.x, obj_player.y)

	// 吸い込み中は動かない
	if !keyboard_check(ord("R")){
		// プレイヤーが視界内に来たら追いかける
		if _distance_to_player < view_range{
			var _angle_to_player = point_direction(x, y, obj_player.x, obj_player.y)
			direction = _angle_to_player
			speed += (_move_speed - speed)*0.1
		}
	}
}
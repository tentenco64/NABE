/// @description 

// プレイヤーから逃げるような移動をする

// プレイヤーとの距離
var _distance_to_player = point_distance(x, y, obj_player.x, obj_player.y)

// プレイヤーが視界内に来たら逃げる
if _distance_to_player < view_range{
	var _angle_to_player = point_direction(x, y, obj_player.x, obj_player.y)
	x += lengthdir_x(move_speed, _angle_to_player+180)
	y += lengthdir_y(move_speed, _angle_to_player+180)
}


/// @description Insert 吸い込み

// 推し続けている間、敵を吸い込む
with(obj_par_enemy){
	var _dir = point_direction(x, y, obj_player.x, obj_player.y)
	motion_add(_dir, 0.5)
}
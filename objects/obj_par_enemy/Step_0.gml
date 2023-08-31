/// @description 
var _move_speed

// 徐々にアルファ値を上げていく
if image_alpha < 1{
	image_alpha += 0.02
}

// 徐々に腐敗していく
if fleshness > 0{
	fleshness -= 100/60/60
}else{
	fleshness = 0
}

// 鮮度の割合を計算
fleshness_ratio = fleshness / init_fleshness

// 青色の成分を計算
var _blue = 255 * (1 - fleshness_ratio);

// スプライトの色を設定
image_blend = make_color_rgb(255 - _blue, 255 , 255- _blue);

if fleshness = 0{
	can_eat = false
}


// 減速中は移動速度が1/10になる

if slow == true{
	_move_speed = initial_move_speed * 0.5
}else{
	_move_speed = initial_move_speed
}

// プレイヤーから逃げるような移動をする
if instance_exists(obj_player){
	// プレイヤーとの距離
	var _distance_to_player = point_distance(x, y, obj_player.x, obj_player.y)

	// 吸い込み中は逃げない
	if !(obj_player.dyson_ef > 0){
		// プレイヤーが視界内に来た
		if _distance_to_player < view_range{
			var _angle_to_player = point_direction(x, y, obj_player.x, obj_player.y)
			// 食材は逃げる
			if can_eat{
				direction = _angle_to_player + 180
				speed += (_move_speed - speed)*0.1
				speed *= fleshness_ratio
			// 食材以外は追いかけてくる
			}else{
				direction = _angle_to_player
				speed += (_move_speed - speed)*0.1
			}
		}
	}
}

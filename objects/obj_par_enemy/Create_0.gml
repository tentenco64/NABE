/// @description 基本的な敵

view_range = 1000
slow = false
fleshness_ratio = 0

if fleshness > 1{
	init_fleshness = fleshness
	// レア敵としてポップ
	if irandom(4) == 0{
		rare = true
	}
}else{
	init_fleshness = 1
}

// レア敵の場合、サイズと逃走速度と栄養価が2倍
if rare{
	image_xscale *= 2
	image_yscale *= 2	
	n_value *= 2
	initial_move_speed *= 2
}

show_debug_message(rare)
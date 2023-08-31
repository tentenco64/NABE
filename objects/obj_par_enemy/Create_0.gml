/// @description 基本的な敵

view_range = 1000
slow = false
fleshness_ratio = 0

// 最初は透明でスポーンする
image_alpha = 0

// 敵キャラの大きさはランダム
scale = random_range(1,2)

// 各種ステータスは大きさに準じる
image_xscale *= scale / IMAGE_MAGNIFICATION
image_yscale *= scale / IMAGE_MAGNIFICATION
n_value = round(n_value*scale)
initial_move_speed *= scale

if fleshness > 1{
	init_fleshness = fleshness
	// 稀にレア敵としてポップ
	if irandom(9) == 0{
		rare = true
		// レア敵の場合、サイズと逃走速度と栄養価が2倍
		scale *= 2
		image_xscale *= 2
		image_yscale *= 2	
		n_value *= 2
		initial_move_speed *= 2
	}
}else{
	init_fleshness = 1
}
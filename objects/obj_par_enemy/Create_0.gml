/// @description 基本的な敵

view_range = 1000
slow = false
fleshness_ratio = 0

// 腐敗時の変身先
spoiled_enemy = [obj_carrot_spoiled,
				obj_cheese_spoiled,
				obj_chicken_spoiled,
				obj_curry_spoiled,
				obj_daikon_spoiled,
				obj_donteat_spoiled,
				obj_egg_spoiled,
				obj_fish_spoiled,
				obj_gyouza_spoiled,
				obj_hakusai_spoiled,
				obj_kimuchi_spoiled,
				obj_konnnyaku_spoiled,
				obj_meatball_spoiled,
				obj_mushroom_spoiled,
				obj_negi_spoiled,
				obj_onion_spoiled,
				obj_poke_spoiled,
				obj_potato_spoiled,
				obj_rice_spoiled,
				obj_shirataki_spoiled,
				obj_tofu_spoiled,
				obj_tomato_spoiled,
				obj_tsumire_spoiled,
				obj_udon_spoiled,
				obj_usagi_spoiled]

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
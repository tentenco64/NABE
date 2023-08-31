/// @description 

// 透明な敵には触れない
if other.image_alpha > 0.2{
	var _enemy = 0

	// SE再生
	if other.can_eat{
		audio_play_sound(snd_slice, 0, false)
	}else{
		audio_play_sound(snd_damaged, 0, false)
	}

	// 食材キューに追加
	ds_queue_enqueue(global.ingredients_queue, other)
	// 食材キューの最大数を超えたらデキュー
	if ds_queue_size(global.ingredients_queue) > max_ingredients{
		_enemy = ds_queue_dequeue(global.ingredients_queue)
	}

	// 食材から水分を吸収
	global.player_water += other.water

	// 食材に熱を奪われる
	global.player_calorie += other.calorie

	// 捕まえた敵の数
	global.get_enemy += 1

	// インスタンスはまだ削除しない
	// instance_destroy(other)	
}

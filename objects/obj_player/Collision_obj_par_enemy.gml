/// @description 
var _enemy = 0

// SE再生
audio_play_sound(snd_drop, 0, false)

// 食材キューに追加
ds_queue_enqueue(global.ingredients_queue, other)
// 食材キューの最大数を超えたらデキュー
if ds_queue_size(global.ingredients_queue) > max_ingredients{
	_enemy = ds_queue_dequeue(global.ingredients_queue)
}

// 食材から水分を吸収
global.player_water += other.water

instance_destroy(other)
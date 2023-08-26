/// @description 

// スコア追加
global.player_score += other.n_value

// SE再生
audio_play_sound(snd_drop, 0, false)

// 食材キューに追加
ds_queue_enqueue(global.ingredients_queue, other.name)

instance_destroy(other)
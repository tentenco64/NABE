/// @description 

// 食材キューの最大数を超えたら、敵が近くにスポーンする
if ds_queue_size(global.ingredients_queue) > max_ingredients{
	var _enemy_name = ds_queue_dequeue(global.ingredients_queue)
	var _enemy_x = obj_player.x + 200
	var _enemy_y = obj_player.y + 200
	switch _enemy_name{
		case "hakusai":{
			instance_create_layer(_enemy_x, _enemy_y, "Enemy", obj_hakusai)
		}break
		case "chicken":{
			instance_create_layer(_enemy_x, _enemy_y, "Enemy", obj_chicken)
		}break
	}
}
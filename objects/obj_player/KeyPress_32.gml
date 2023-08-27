/// @description スコア化

// ボーナスマップのーの取得
var _keys = ds_map_keys_to_array(global.bonus_combinations)


// キューの中身（インスタンス)を受け取る
while ds_queue_size(global.ingredients_queue){
	array_push(ingredient_array, ds_queue_dequeue(global.ingredients_queue))
}

// 素点追加
for(var _i = 0;_i < array_length(ingredient_array);_i++){
	var _point = ingredient_array[_i].n_value
	global.player_score += _point
}

for (var _i = 0; _i < array_length(_keys); _i++){
	var _key = _keys[_i]
	var _combination = string_split(_key, ",")
	var _is_bonus = true
	// 文字列配列が条件を満たすかチェック
	for(var _j = 0;_j < array_length(_combination); _j++){
		if !scr_bonus_contains(ingredient_array, _combination[_j]){
			_is_bonus = false
			break
		}
	}
	show_debug_message(_is_bonus)
    if (_is_bonus) {
        var _points = global.bonus_combinations[? _key];
        global.player_score += _points;
    }
}

ingredient_array = array_create(0, "")
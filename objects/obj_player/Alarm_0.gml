/// @description スコア化
// ボーナスマップのーの取得
var _keys = ds_map_keys_to_array(global.bonus_combinations)


// キューの中身（インスタンス)を受け取る
while ds_queue_size(global.ingredients_queue){
	array_push(ingredient_array, ds_queue_dequeue(global.ingredients_queue))
}

var _score = 0

// 素点追加
for(var _i = 0;_i < array_length(ingredient_array);_i++){
	var _point = ingredient_array[_i].n_value
	_score += _point
}

for (var _i = 0; _i < array_length(_keys); _i++){
	var _key = _keys[_i]
	var _combination = string_split(_key, ",")
	var _is_bonus = true
	// 文字列配列が条件を満たすかチェック
	for(var _j = 0;_j < array_length(_combination); _j++){
		// _combination[_j]の食材がまな板の上にあるかを確認
		// なければ_is_bonus = false
		if !scr_bonus_contains(ingredient_array, _combination[_j]){
			_is_bonus = false
			break
		}
	}
    if (_is_bonus) {
		audio_play_sound(snd_bonus, 0, false)
        var _bonus_name = global.bonus_combinations[? _key];
		var _multiplier = 1
		switch _bonus_name{
			case "締めのおじや":{
				global.nabe_message = "締めのおじやが完成！食材の出汁が染み込んでるぞ！"
				_multiplier = 1.5
			}break
			case "締めのうどん":{
				global.nabe_message = "締めのうどんが完成！食材の出汁が染み込んでるぞ！"
				_multiplier = 1.5
			}break
			case "カレー鍋":{
				global.nabe_message = "カレー鍋が完成！大抵のものはカレー味にすれば美味しくなるぞ！"
				_multiplier = 1.5
			}break
			case "肉鍋":{
				global.nabe_message = "肉鍋が完成！肉！肉！！肉！！！野性味あふれる！"
				_multiplier = 2
			}break
			case "野菜鍋":{
				global.nabe_message = "野菜鍋が完成！野菜！野菜！！野菜！！！とってもヘルシー！"
				_multiplier = 2
			}break
			case "ウサギ鍋":{
				global.nabe_message = "ウサギ鍋が完成！肉だけどヘルシーであっさり味な鍋！日本ではあんまり食べる機会はないぞ！"
				_multiplier = 2.5
			}break
			case "キムチ鍋":{
				global.nabe_message = "キムチ鍋が完成！キムチの辛味が具材に染みて身体が温まる！"
				_multiplier = 2.5
			}break
			case "ミルフィーユ鍋":{
				global.nabe_message = "豚と白菜のミルフィーユが完成！ぎゅうぎゅう詰めの豚肉と白菜が旨味と共に鍋にあふれている！"
				_multiplier = 2.5
			}break
			case "鶏団子鍋":{
				global.nabe_message = "鶏団子鍋が完成！鶏肉と鳥つみれ、Wの旨味が染みている！"
				_multiplier = 2.5
			}break
			case "魚介鍋":{
				global.nabe_message = "魚介鍋が完成！ほくほくの白身魚が美味いぞ！"
				_multiplier = 2.5
			}break
			case "おでん":{
				global.nabe_message = "おでんが完成！からしと一緒にどうぞ！(ちくわは付属しておりません)"
				_multiplier = 3
			}break
			case "チーズリゾット":{
				global.nabe_message = "チーズリゾットが完成！土鍋で生まれたおこげが美味いぞ！"
				_multiplier = 3
			}break
			case "ハヤシライス":{
				global.nabe_message = "ハヤシライスが完成！一般的なデミグラスではなく伝統的なトマト風味だ！"
				_multiplier = 3
			}break
			case "カレーライス":{
				global.nabe_message = "カレーライスが完成！みんな大好き、カレーライスが鍋界に殴り込みだ！"
				_multiplier = 3
			}break
			case "月見うどん":{
				global.nabe_message = "月見うどんが完成！つゆに浮かべた卵が月を模しているぞ！風流だね！"
				_multiplier = 3
			}break
			case "肉無しすき焼き":{
				global.nabe_message = "すき焼きが完成！………肉が入ってないぞ！！！！！"
				_multiplier = 3
			}break
		}
        _score *= _multiplier;		
    }
}

global.player_score += _score

ingredient_array = array_create(0, "")
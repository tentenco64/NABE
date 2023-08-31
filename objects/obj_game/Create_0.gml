/// @description ゲームマネージャ
audio_stop_all()

// ゲーム開始時にシード値をランダマイズ
random_set_seed(date_current_datetime());
randomize()

layer_sequence_create("Transition", 0, 0, seq_transition_end)

// スコア関係
global.player_score = 0

// スポーンレート
spawn_rate = 60
alarm[0] = spawn_rate

// スポーンする敵配列
enemy_obj_array = [obj_hakusai, obj_chicken, obj_usagi, obj_donteat, obj_egg, obj_curry, obj_udon,
obj_daikon,obj_konnnyaku,obj_tofu,obj_rice,obj_fish,obj_mushroom,obj_tsumire,obj_gyouza,obj_onion,
obj_tomato,obj_cheese,obj_shirataki,obj_negi,obj_meatball,obj_potato,obj_poke, obj_carrot, obj_kimuchi]
// リスト化
enemy_obj_list = ds_list_create()
for(var _i = 0; _i < array_length(enemy_obj_array); _i++){
	ds_list_add(enemy_obj_list, enemy_obj_array[_i])
}
enemy_obj_list_init = ds_list_create()
ds_list_copy(enemy_obj_list_init, enemy_obj_list) 


// ステージBGM
audio_play_sound(snd_stage, 0, true)
audio_play_sound(snd_gutugutu, 0, true)

global.ingredients_queue = ds_queue_create()


// スコアボーナス
global.bonus_combinations = ds_map_create()
ds_map_add(global.bonus_combinations, "rice", "締めのおじや")
ds_map_add(global.bonus_combinations, "udon", "締めのうどん")
ds_map_add(global.bonus_combinations, "curry", "カレー鍋")
ds_map_add(global.bonus_combinations, "poke,chicken,rabbit", "肉鍋")
ds_map_add(global.bonus_combinations, "daikon,hakusai,negi", "野菜鍋")
ds_map_add(global.bonus_combinations, "usagi,hakusai,carrot", "ウサギ鍋")
ds_map_add(global.bonus_combinations, "mushroom,tofu,kimuchi", "キムチ鍋")
ds_map_add(global.bonus_combinations, "hakusai,poke", "ミルフィーユ鍋")
ds_map_add(global.bonus_combinations, "chicken,tsumire,tofu", "鶏団子鍋")
ds_map_add(global.bonus_combinations, "fish,negi,hakusai", "魚介鍋")
ds_map_add(global.bonus_combinations, "egg,konnnyaku,daikon", "おでん")
ds_map_add(global.bonus_combinations, "rice,cheeze,onion", "チーズリゾット")
ds_map_add(global.bonus_combinations, "poke,onion,tomato,mushroom", "ハヤシライス")
ds_map_add(global.bonus_combinations, "onion,poke,curry", "カレーライス")
ds_map_add(global.bonus_combinations, "negi,egg,udon", "月見うどん")
ds_map_add(global.bonus_combinations, "negi,shirataki,tofu,mushroom", "肉無しすき焼き")

// 水分量
global.player_water = 70
// 熱量
global.player_calorie = 100
// タイマー
global.timer = 60 * 120
// 現在のフレーム数
global.current_frame = 0

global.coocked_queue = ds_queue_create()

// 捕まえた敵の数
global.get_enemy = 0

// 作った鍋の数
global.nabe_num = 0

// ダイソンのCT
global.dyson_ct = 0
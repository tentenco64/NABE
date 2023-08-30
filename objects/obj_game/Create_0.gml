/// @description ゲームマネージャ
audio_stop_all()

layer_sequence_create("Transition", 0, 0, seq_transition_end)

// スコア関係
global.player_score = 0

// スポーンレート
spawn_rate = 60
alarm[0] = spawn_rate

// スポーンする敵リスト
enemy_obj_list = [obj_hakusai, obj_chicken, obj_usagi, obj_donteat, obj_egg, obj_curry, obj_udon,
obj_daikon,obj_konnnyaku,obj_tofu,obj_rice,obj_fish,obj_mushroom,obj_tsumire,obj_gyouza,obj_onion,
obj_tomato,obj_cheese,obj_shirataki,obj_negi,obj_meatball,obj_potato,obj_poke, obj_faucet, obj_carrot, obj_kimuchi]

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
ds_map_add(global.bonus_combinations, "daikon,hakusai,mushroom,negi", "野菜鍋")
ds_map_add(global.bonus_combinations, "usagi,hakusai,carrot,tofu", "ウサギ鍋")
ds_map_add(global.bonus_combinations, "hakusai,mushroom,tofu,kimuchi", "キムチ鍋")
ds_map_add(global.bonus_combinations, "hakusai,mushroom,tofu,poke", "ミルフィーユ鍋")
ds_map_add(global.bonus_combinations, "chicken,tsumire,tofu", "鶏団子鍋")
ds_map_add(global.bonus_combinations, "fish,negi,hakusai,tofu", "魚介鍋")
ds_map_add(global.bonus_combinations, "egg,konnnyaku,daikon", "おでん")
ds_map_add(global.bonus_combinations, "rice,cheeze,onion", "チーズリゾット")
ds_map_add(global.bonus_combinations, "poke,onion,tomato,mushroom", "ハヤシライス")
ds_map_add(global.bonus_combinations, "onion,carrot,potato,poke,curry", "カレーライス")
ds_map_add(global.bonus_combinations, "negi,chicken,egg,udon", "月見うどん")
ds_map_add(global.bonus_combinations, "negi,shirataki,tofu,mushroom", "肉無しすき焼き")

// 水分量
global.player_water = 100
// 熱量
global.player_calorie = 50
// タイマー
global.timer = 60 * 180
// 現在のフレーム数
global.current_frame = 0

global.coocked_queue = ds_queue_create()

// 捕まえた敵の数
global.get_enemy = 0
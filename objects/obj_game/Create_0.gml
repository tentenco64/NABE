/// @description ゲームマネージャ
audio_stop_all()

layer_sequence_create("Transition", 0, 0, seq_transition_end)

global.player_score = 0

spawn_rate = 60
alarm[0] = spawn_rate

// スポーンする敵リスト
enemy_obj_list = [obj_hakusai, obj_chicken, obj_usagi, obj_donteat, obj_egg, obj_curry, obj_udon,
obj_daikon,obj_konnnyaku,obj_tofu,obj_rice,obj_fish,obj_mushroom,obj_tsumire,obj_gyouza,obj_onion,
obj_tomato,obj_cheese,obj_shirataki,obj_negi,obj_meatball,obj_potato,obj_poke, obj_faucet]

// ステージBGM
audio_play_sound(snd_stage, 0, true)
audio_play_sound(snd_gutugutu, 0, true)

global.ingredients_queue = ds_queue_create()

global.bonus_combinations = ds_map_create()
global.bonus_combinations[? "hakusai,chicken"] = 100
global.bonus_combinations[? "usagi,chicken"] = 200

// 水分量
global.player_water = 100
// 熱量
global.player_calorie = 50
// タイマー
global.timer = 60 * 180
// 現在のフレーム数
global.current_frame = 0
/// @description ゲームマネージャ

global.player_score = 0

spawn_rate = 60
alarm[0] = spawn_rate

// スポーンする敵リスト
enemy_obj_list = [obj_hakusai, obj_chicken, obj_usagi, obj_donteat]

audio_play_sound(snd_stage, 0, true)

global.ingredients_queue = ds_queue_create()

global.bonus_combinations = ds_map_create()
global.bonus_combinations[? "hakusai,chicken"] = 100
global.bonus_combinations[? "usagi,chicken"] = 200

global.player_water = 10
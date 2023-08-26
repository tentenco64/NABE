/// @description ゲームマネージャ

global.player_score = 0

spawn_rate = 60
alarm[0] = spawn_rate

enemy_obj_list = [obj_hakusai, obj_chicken]

audio_play_sound(snd_stage, 0, true)

global.ingredients_queue = ds_queue_create()
max_ingredients = 5

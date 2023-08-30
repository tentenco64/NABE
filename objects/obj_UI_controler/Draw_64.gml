if keyboard_check_pressed(vk_space){
	score_start_flame = global.current_frame
	alarm[0] = 120
}

// スコアを右上に描画
draw_set_font(fnt_score)
draw_text(camera_get_view_width(view_camera[0]) - x_offset_score, y_offset_score, string(global.player_score))

// 水分を右上に描画
draw_set_font(fnt_score)
draw_text(camera_get_view_width(view_camera[0]) - x_offset_water, y_offset_water, string(global.player_water))

// 制限時間を右上に描画
draw_set_font(fnt_score)
draw_text(camera_get_view_width(view_camera[0]) - x_offset_timer, y_offset_timer, string(global.timer))

// まな板をGUI表示
draw_sprite_ext(spr_UI_manaita, 0, 0, cam_h, 1, 0.6591215, 0, c_white, 1)

// 包丁をGUI表示
var _start_x = -683.4454 + cam_w/2
var _start_y = 429.1507+cam_h/2
var _gui_x = _start_x
var _gui_y = _start_y
if !score_start_flame == 0{
	current_frame = global.current_frame - score_start_flame
	_gui_x = _start_x + (move_distance_houtyou * (current_frame / 50))
	if current_frame >= 50{
		_gui_x = _start_x + move_distance_houtyou - (move_distance_houtyou * ((current_frame - 50) / 50))
	}
	// _gui_xの最小値を制限
	_gui_x = max(_gui_x, _start_x);
}
draw_sprite_ext(spr_UI_houtyou, 0, _gui_x, _gui_y, 0.3200687, 0.3200687, 62.77554, c_white, 1)	

// 土鍋をGUI表示
draw_sprite_ext(spr_UI_donabe, 0, 152.6981 + cam_w/2, 225.3948+cam_h/2, 0.9033908, 0.9033908, 0, c_white, 1)

// 土鍋の蓋をGUI表示
_start_x =  364.242 + cam_w/2
_start_y = 296.0652+cam_h/2
var _start_dir = 0
_gui_x = _start_x
_gui_y = _start_y
var _gui_dir = _start_dir
if !score_start_flame == 0{
	_gui_dir = _start_dir + (move_direction_futa * (current_frame / 60))
	if current_frame >= 60{
		_gui_dir = _start_dir + move_direction_futa - (move_direction_futa * ((current_frame - 60)/60))
	}
}
draw_sprite_ext(spr_UI_donabe_futa, 0, _gui_x, _gui_y, 0.8830242, 0.8830242, _gui_dir, c_white, 1)

// 水分をGUI表示
draw_sprite_ext(spr_UI_water, 0, 521.3362 + cam_w/2, 354+cam_h/2, 1,  1*global.player_water/100, 0, c_white, 1)

// 水面をGUI表示
var _water_height = 92*global.player_water/100-1
draw_sprite_ext(spr_UI_water_surface, 0, 521.3362 + cam_w/2, 354+cam_h/2-_water_height, 0.7,  1, 0, c_white, 1)

// 土鍋の水をGUI表示
draw_sprite_ext(spr_UI_donabe_water, 0, 521.3362 + cam_w/2, 354+cam_h/2, 0.7416475, 0.8571429, 0, c_white, 1)

// 温度をGUI表示
draw_sprite_ext(spr_UI_calorie, 0, 521.3362 + cam_w/2, 201.3948+cam_h/2, 1,  1*global.player_calorie/100, 0, c_white, 1)

// 温度計をGUI表示
draw_sprite_ext(spr_UI_thermo, 0, 521.3362 + cam_w/2, 201.3948+cam_h/2, 1, 1, 0, c_white, 1)

// まな板に食材を表示
ds_queue_copy(spr_queue, global.ingredients_queue)

_gui_y = start_y_enemy
for(var _i=0; _i < ds_queue_size(global.ingredients_queue); _i++){
	var _inst = ds_queue_dequeue(spr_queue)
	switch _i+1{
		case 1:{
			_gui_x = start_x_one
			if score_start_flame >= 10{
				_gui_x = start_x_one + (move_distance_one * (current_frame / 60))
			}
		}break
		case 2:{
			_gui_x = start_x_onehalf
			if score_start_flame >= 15{
				_gui_x = start_x_onehalf + (move_distance_onehalf * (current_frame / 60))
			}
		}break
		case 3:{
			_gui_x = start_x_two
			if score_start_flame >= 20{
				_gui_x = start_x_two + (move_distance_two * (current_frame / 60))
			}
		}break
		case 4:{
			_gui_x = start_x_twohalf
			if score_start_flame >= 25{
				_gui_x = start_x_twohalf + (move_distance_twohalf * (current_frame / 60))
			}
		}break
		case 5:{
			_gui_x = start_x_three
			if score_start_flame >= 30{
				_gui_x = start_x_three + (move_distance_three * (current_frame / 60))
			}
		}break
		case 6:{
			_gui_x = start_x_threehalf
			if score_start_flame >= 35{
				_gui_x = start_x_threehalf + (move_distance_threehalf * (current_frame / 60))
			}
		}break
		case 7:{
			_gui_x = start_x_four
			if score_start_flame >= 40{
				_gui_x = start_x_four + (move_distance_four * (current_frame / 60))
			}
		}break
		case 8:{
			_gui_x = start_x_fourhalf
			if score_start_flame >= 45{
				_gui_x = start_x_fourhalf + (move_distance_fourhalf * (current_frame / 60))
			}
		}break
		case 9:{
			_gui_x = start_x_five
			if score_start_flame >= 50{
				_gui_x = start_x_five + (move_distance_five * (current_frame / 60))
			}
		}break
		case 10:{
			_gui_x = start_x_fivehalf
			if score_start_flame >= 55{
				_gui_x = start_x_fivehalf + (move_distance_fivehalf * (current_frame / 60))
			}
		}break
	}
	draw_sprite_ext(_inst.sprite_index, 0, _gui_x, _gui_y, _inst.scale/IMAGE_MAGNIFICATION, _inst.scale/IMAGE_MAGNIFICATION, 0, c_white, 1)
	// インスタンスをここで削除する
	instance_destroy(_inst)
}

// プレイヤー死亡時の処理
//if !instance_exists(obj_player) && restart_now == false{
//	layer_sequence_create("Dead", camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), seq_dead)
//	restart_now = true
//}

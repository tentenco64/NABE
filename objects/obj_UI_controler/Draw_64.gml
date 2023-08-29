
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
draw_sprite_ext(spr_UI_houtyou, 0, -683.4454 + cam_w/2, 429.1507+cam_h/2, 0.3200687, 0.3200687, 62.77554, c_white, 1)

// 土鍋をGUI表示
draw_sprite_ext(spr_UI_donabe, 0, 152.6981 + cam_w/2, 225.3948+cam_h/2, 0.9033908, 0.9033908, 0, c_white, 1)

// 土鍋の蓋をGUI表示
draw_sprite_ext(spr_UI_donabe_futa, 0, 364.242 + cam_w/2, 296.0652+cam_h/2, 0.8830242, 0.8830242, 0, c_white, 1)

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

var _space = 110

for(var _i=0; _i < ds_queue_size(global.ingredients_queue); _i++){
	var _inst = ds_queue_dequeue(spr_queue)
	draw_sprite_ext(_inst.sprite_index, 0, 180 + _space * _i, camera_get_view_height(view_camera[0]) - sprite_get_height(spr_UI_manaita)/2, _inst.scale/IMAGE_MAGNIFICATION, _inst.scale/IMAGE_MAGNIFICATION, 0, c_white, 1)
}

// プレイヤー死亡時の処理
if !instance_exists(obj_player) && restart_now == false{
	layer_sequence_create("Dead", camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), seq_dead)
	restart_now = true
}

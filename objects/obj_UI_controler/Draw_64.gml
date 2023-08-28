
// スコアを右上に描画
draw_set_font(fnt_score)
draw_text(camera_get_view_width(view_camera[0]) - x_offset_score, y_offset_score, string(global.player_score))

// 水分を右上に描画
draw_set_font(fnt_score)
draw_text(camera_get_view_width(view_camera[0]) - x_offset_water, y_offset_water, string(global.player_water))

// 制限時間を右上に描画
draw_set_font(fnt_score)
draw_text(camera_get_view_width(view_camera[0]) - x_offset_timer, y_offset_timer, string(global.timer))

// 食材キューをGUI表示
draw_sprite(spr_UI_ingredient, 0, 0, camera_get_view_height(view_camera[0]) - sprite_get_height(spr_UI_ingredient))

// 食材をキューに表示
ds_queue_copy(spr_queue, global.ingredients_queue)

for(var _i=0; _i < ds_queue_size(global.ingredients_queue); _i++){
	var _inst = ds_queue_dequeue(spr_queue)
	draw_sprite_ext(_inst.sprite_index, 0, sprite_get_width(spr_UI_ingredient)/5 * _i + 50, camera_get_view_height(view_camera[0]) - sprite_get_height(spr_UI_ingredient)/2, _inst.scale/IMAGE_MAGNIFICATION, _inst.scale/IMAGE_MAGNIFICATION, 0, c_white, 1)
}

// 水分を右側にGUI表示
draw_sprite_ext(spr_UI_water, 0, camera_get_view_width(view_camera[0])-sprite_get_width(spr_UI_water), camera_get_view_height(view_camera[0]), 1,  1*global.player_water/100, 0, c_white, 1)

// 熱量を右側にGUI表示
draw_sprite_ext(spr_UI_calorie, 0, camera_get_view_width(view_camera[0])-sprite_get_width(spr_UI_calorie), camera_get_view_height(view_camera[0]), 1,  1*global.player_calorie/100, 0, c_white, 1)
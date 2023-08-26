
// スコアを右上に描画
draw_set_font(fnt_score)
//draw_text(view_xview[0] + view_wview[0] - x_offset_score, view_yview[0] + y_offset_score, string(global.player_score))
draw_text(camera_get_view_width(view_camera[0]) - x_offset_score, y_offset_score, string(global.player_score))

// 食材キューをGUI表示
draw_sprite(spr_UI_ingredient, 0, 0, camera_get_view_height(view_camera[0]) - sprite_get_height(spr_UI_ingredient))

// 食材をキューに表示
ds_queue_copy(name_queue, global.ingredients_queue)
show_debug_message(ds_queue_size(name_queue))
for(var _i=0; _i <= ds_queue_size(global.ingredients_queue); _i++){
	show_debug_message(_i)
	var _ingredient_name = ds_queue_dequeue(name_queue)
	switch _ingredient_name{
		case "hakusai":{
			draw_sprite(spr_hakusai, 0, sprite_get_width(spr_UI_ingredient)/5 * _i + 50, camera_get_view_height(view_camera[0]) - sprite_get_height(spr_UI_ingredient)/2)
		}break
		case "chicken":{
			draw_sprite(spr_chicken, 0, sprite_get_width(spr_UI_ingredient)/5 * _i + 50, camera_get_view_height(view_camera[0]) - sprite_get_height(spr_UI_ingredient)/2)	
		}break
	}
}
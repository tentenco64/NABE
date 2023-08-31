/// @description 

for(var _i = 0; _i < total_buttons; _i++){
	var _spr = (_i == selected_button) ? spr_UI_button_over : spr_UI_button
	draw_sprite_ext(_spr, 0, button_x, button_y + _i * button_height, 0.8, 0.8, 0, c_white, 1)
	var _color = (_i == selected_button) ? c_yellow : c_white
	draw_set_font(fnt_score)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text_color(button_x, button_y + _i * button_height, button_labels[_i], _color, _color, _color, _color, 1)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}


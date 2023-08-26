/// @description 

// スコアを右上に描画
draw_set_font(fnt_score)
draw_text(view_xview[0] + view_wview[0] - x_offset, view_yview[0] + y_offset, string(global.player_score))
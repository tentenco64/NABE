/// @description Insert description here
// You can write your code in this editor

draw_self()

draw_set_font(fnt_score)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text_color(x, y, 
"得点: " + string(global.player_score) + 
"\n最高得点: " + string(global.high_score) +
"\n捕まえた食材数: " + string(global.get_enemy)
, c_black, c_black, c_black, c_black, 1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

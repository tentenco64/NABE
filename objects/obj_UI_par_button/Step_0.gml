/// @description 

// マウスがボタンの上にあるかどうかをチェック
if (mouse_check_button(mb_left) && point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)){
    sprite_index = spr_UI_button_over;  // ボタンが押されたスプライト
}else{
    sprite_index = spr_UI_button;   // 通常のボタンのスプライト
}
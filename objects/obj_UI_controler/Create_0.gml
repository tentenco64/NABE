/// @description 

cam_h = camera_get_view_height(view_camera[0])
cam_w = camera_get_view_width(view_camera[0])

x_offset_score = 50
y_offset_score = 50

x_offset_water = 50
y_offset_water = 250

x_offset_timer = cam_w / 2
y_offset_timer = 30

spr_queue = ds_queue_create()

restart_now = false

score_start_flame = 0
current_frame = 0

// 包丁の移動量
move_distance_houtyou = 571
// 蓋の目標角度
move_direction_futa = -60

// 食材の初期値
start_x_one = -440 + cam_w/2
start_x_two = -330+ cam_w/2
start_x_three = -220+ cam_w/2
start_x_four = -110+ cam_w/2
start_x_five = 0+ cam_w/2
start_x_onehalf = -385 + cam_w/2
start_x_twohalf = -275+ cam_w/2
start_x_threehalf = -165+ cam_w/2
start_x_fourhalf = -55+ cam_w/2
start_x_fivehalf = 55+ cam_w/2
start_y_enemy = 290 +cam_h/2

// 食材の移動量
move_distance_one = 252 + 440
move_distance_two = 252 + 330
move_distance_three = 252 + 220
move_distance_four = 252 + 110
move_distance_five = 252
move_distance_onehalf = 252 + 385
move_distance_twohalf = 252 + 275
move_distance_threehalf = 252 + 165
move_distance_fourhalf = 252 + 55
move_distance_fivehalf = 252 - 55

// 掲示板用
board_x = 2;
board_y = 0;
board_width = sprite_get_width(spr_UI_keijiban)*0.5;
board_height = sprite_get_height(spr_UI_keijiban)*0.5;
global.nabe_message = "どんな鍋が出来上がるのか楽しみ!";
pre_text = global.nabe_message
text_x = board_width;
surf = surface_create(board_width-10, board_height);


// 鍋のスコア表示用
pre_nabe_score = 0
nabe_x = 152.6981 + cam_w/2 + 116
nabe_y = 225.3948+cam_h/2 + 95
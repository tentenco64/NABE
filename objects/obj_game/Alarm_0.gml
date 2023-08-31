/// @description スポーナー

if instance_number(obj_par_enemy) < 20 {
	show_debug_message(ds_list_size(enemy_obj_list))
	if ds_list_size(enemy_obj_list) == 0{
		ds_list_copy(enemy_obj_list, enemy_obj_list_init) 
	}
	var _enemy_index = irandom(ds_list_size(enemy_obj_list) - 1)
	var _spawn_obj = ds_list_find_value(enemy_obj_list, _enemy_index)
	// 一度出現した敵はスポーンリストから削除される
	var _remove_index = ds_list_find_index(enemy_obj_list, _spawn_obj)
	ds_list_delete(enemy_obj_list, _remove_index)
	
    var _spawn_point_x = random(room_width)
    var _spawn_point_y = random(room_height)

    // カメラプロパティの取得
    var _cam_x = camera_get_view_x(view_camera[0])
    var _cam_y = camera_get_view_y(view_camera[0])
    var _cam_w = camera_get_view_width(view_camera[0])
    var _cam_h = camera_get_view_height(view_camera[0])

    // スポーン地点がプレーヤーの視界内にあるかチェック
    while !(_spawn_point_x > _cam_x && _spawn_point_x < _cam_x + _cam_w && 
           _spawn_point_y > _cam_y && _spawn_point_y < _cam_y + _cam_h) {
        _spawn_point_x = random(room_width)
        _spawn_point_y = random(room_height)
    }
    var _inst = instance_create_layer(_spawn_point_x, _spawn_point_y, "Enemy", _spawn_obj)
}

alarm[0] = spawn_rate
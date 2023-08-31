/// @description スポーナー

if instance_number(obj_par_enemy) < 20 {
	var _enemy_index = irandom(array_length(enemy_obj_list) - 1)
	var _spawn_obj = enemy_obj_list[_enemy_index]
	// 同じ種類がフィールドに居る場合再生成
	// まな板の上はチェックされていないらしい
	while instance_exists(_spawn_obj){
		_enemy_index = irandom(array_length(enemy_obj_list) - 1)
		_spawn_obj = enemy_obj_list[_enemy_index]
	}
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
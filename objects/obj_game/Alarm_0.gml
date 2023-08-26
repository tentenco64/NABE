/// @description スポーナー

if instance_number(obj_par_enemy) < 5{
	instance_create_layer(random(room_width), random(room_height), "Enemy", obj_hakusai)
}
alarm[0] = spawn_rate
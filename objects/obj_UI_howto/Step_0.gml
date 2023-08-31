/// @description 

if keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_down){
	page += 1
}
if keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_up){
	if page > 0{
		page -= 1
	}
}

show_debug_message(page)
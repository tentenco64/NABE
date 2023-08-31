/// @description 

if image_alpha < 1 && fade {
	image_alpha += 0.01
}

if image_alpha >= 1 && fade{
	alarm[0] = 60
	fade = false
}

if keyboard_check(ord("Z")) || keyboard_check(vk_enter){
	room_goto(rm_title)
}
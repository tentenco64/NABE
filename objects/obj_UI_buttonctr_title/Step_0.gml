/// @description 

if selected == false{
	if keyboard_check_pressed(vk_up){
		selected_button -= 1
		audio_play_sound(snd_button_over, 0, false)
		if selected_button < 0{
			selected_button = total_buttons - 1
		}
	}
	if keyboard_check_pressed(vk_down){
		audio_play_sound(snd_button_over, 0, false)
		selected_button += 1
		if selected_button >= total_buttons{
			selected_button = 0
		}
	}
}

if keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")){
	flame = 0
	if selected == false{
		selected = true
		audio_play_sound(snd_button_select, 0, false)
	}
	switch selected_button{
		case 0:{
			layer_sequence_create("Transition",0,0,seq_transition_start)
			alarm[0] = 60
		}break
		case 1:{
			alarm[1] = 2
		}break
		case 2:{
			layer_sequence_create("Transition",0,0,seq_transition_start)
			alarm[2] = 60
		}break
	}
}
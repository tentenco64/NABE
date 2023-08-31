/// @description 

switch page{
	case 0:{
		draw_sprite(spr_manual_image_character, 0, 0, 0)
	}break
	case 1:{
		draw_sprite(spr_manual_image_operation, 0, 0, 0)
	}break
	case 2:{
		draw_sprite(spr_manual_image_screen, 0, 0, 0)
	}break
	case 3:{
		room_goto(rm_title)
	}break
}
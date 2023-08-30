/// @description 

text_x -= 2

if text_x + string_width(global.nabe_message) < 0{
	text_x = 700
}

if pre_text != global.nabe_message{
	text_x = 700
}

pre_text = global.nabe_message
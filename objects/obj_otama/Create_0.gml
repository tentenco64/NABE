/// @description 近接攻撃で召喚

// サイズ調整
image_xscale /= IMAGE_MAGNIFICATION 
image_yscale /= IMAGE_MAGNIFICATION

// ちょっと大きくする
image_xscale *= 1.5
image_yscale *= 1.5

var _sounds = [snd_attack01, snd_attack02]
var _index = irandom(array_length(_sounds)-1)
audio_play_sound(_sounds[_index], 0, false)

if obj_player.dir = 0{
	image_angle = 270
}else if obj_player.dir = 1{
	image_angle = 0
}else if obj_player.dir = 2{
	image_angle = 90
}else if obj_player.dir = 3{
	image_angle = 180
}

alarm[0] = 20
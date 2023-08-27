/// @description 近接攻撃で召喚
var _sounds = [snd_attack01, snd_attack02]
var _index = irandom(array_length(_sounds)-1)
audio_play_sound(_sounds[_index], 0, false)

alarm[0] = 30
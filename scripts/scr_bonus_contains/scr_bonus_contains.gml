// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro IMAGE_MAGNIFICATION 6

function scr_bonus_contains(_array, _value){
    for (var _i = 0; _i < array_length(_array); _i++) {
		/*
		if (_array[_i].can_eat == false){
			return false
		}
		*/
        if (_array[_i].name == _value) {
			show_debug_message("true")
            return true;
        }
    }
    return false;
}
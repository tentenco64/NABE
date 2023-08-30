// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro IMAGE_MAGNIFICATION 6

global.high_score = 0

ini_open("highscore.ini");
global.highscore = ini_read_real("Highscore", "Score", 0);
ini_close();

function scr_bonus_contains(_array, _value){
    for (var _i = 0; _i < array_length(_array); _i++) {
        if (_array[_i].name == _value) {
            return true;
        }
    }
    return false;
}
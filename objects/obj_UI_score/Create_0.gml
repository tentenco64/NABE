/// @description 

// デバッグ用
global.player_score = 0
global.high_score = 0
global.get_enemy = 0
global.nabe_num = 0

// ハイスコアの記録
if (global.player_score > global.high_score) {
    global.high_score = global.player_score;
    ini_open("highscore.ini");
    ini_write_real("Highscore", "Score", global.high_score);
    ini_close();
}
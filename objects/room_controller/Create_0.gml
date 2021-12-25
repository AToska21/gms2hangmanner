/// @description Code code code

//sets window caption
var caption_flavor = choose("Come hang out", "Hello");
window_set_caption(Title + " - " + caption_flavor);

//state machine vars
enum wordStates {
	
	STARTING,
	WORDPACKCHOOSE,
	WORDPACKCHOSEN,
	WORDCHOOSE,
	WORDCHOSEN,
	PLAYING,
	GAMEOVER
	
}
game_state = wordStates.STARTING;
game_win_lose = game.NONE;

//attemt vars
tries_left = MAXTRIES; //the number of guesses player has left
incorrect_letters = "";
correct_letters = "";

//misc vars
input_delay = 10; //delay for inputs
wordpack_index = 0; //index of selected word pack
word_index = 0; //index of selected word within word pack

//sets alarm (temp)
alarm[0] = room_speed;
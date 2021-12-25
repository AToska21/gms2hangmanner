/// @description Code code code

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

//misc vars
input_delay = 10; //delay for inputs
wordpack_index = 0; //index of selected word pack
word_index = 0; //index of selected word within word pack
tries_left = MAXTRIES; //the number of guesses player has left

//sets alarm (temp)
alarm[0] = room_speed;
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

//Loads chosen word pack
 //will most likely change as game is built; rn this is enough for testing
#region

//grabs right file
var wordpack_file = "";
switch(global.chosen_wordpack) {
	
	default: wordpack_file = "default_wordpack.txt";
	
}

//reads file and saves words
global.wordpack_words = []; //clears global holding words array
	//unencrypt here//
var wordpack_file_open = file_text_open_read(WORDPACKDIRECTORY + wordpack_file);
var i = 0;
while (!file_text_eof(wordpack_file_open)) {
	
	global.wordpack_words[i++] = file_text_readln(wordpack_file_open);
	
}
file_text_close(wordpack_file_open);

#endregion
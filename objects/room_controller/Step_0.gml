/// @description State machine

//restarts game
if(keyboard_check_pressed(vk_alt)) {game_restart();}


if(alarm[0] > 0) {exit;} //prevents inputs while alarm is counting down

//game logic state machine
switch(game_state) {
	
	case(wordStates.STARTING):
		
		//method to change file name into a readable string
		var file_string_name = function(file_str) {
			
			if(is_string(file_str)) {
				
				//gets rid of file format string and forces all remaining letters into uppercase
				file_str = string_upper(string_replace(file_str,".txt",""));
				file_str = string_replace_all(file_str,"_"," ");//replaces all underscores with spaces
				
			}
			
			return file_str;
			
		}
		
		//Loads available word packs and saves name to a readable list
		
		//clears global holding wordpack list
		global.wordpack_list = [];
		
		//finds first wordpack
		var file = file_find_first(WORDPACKDIRECTORY + "*.txt",0);
		
		//fills in global with wordpack struct (holds name and file)
		var i = 0;
		while(file != "") {
			
			global.wordpack_list[i] = {
				
				wordpack_name : file_string_name(file),
				wordpack_file : file
				
			}
			
			file = file_find_next();
			i++;
			
		}
		file_find_close();
		
		//moves to next state while setting up vars
		game_state = wordStates.WORDPACKCHOOSE;
		wordpack_index = 0;
		word_index = 0;
		tries_left = MAXTRIES;
		incorrect_letters = "";
		correct_letters = "";
		display_str = "";
		global.chosenword = "";
		game_win_lose = game.NONE;
		
	break;
	
	case(wordStates.WORDPACKCHOOSE):
	
		//to-do: update to work with mobile
		//scrolls between available word packs
		if(mouse_wheel_up()) {wordpack_index--;}
		else if(mouse_wheel_down()) {wordpack_index++;}
		wordpack_index = clamp(wordpack_index,0,array_length(global.wordpack_list)-1);
		
		//detects confirmation input
		if(keyboard_check_released(vk_enter)) || (mouse_check_button_released(mb_left)) { //mouse if gonna have to check if cursor is within proper area
			
			global.chosen_wordpack = global.wordpack_list[wordpack_index].wordpack_file;
			game_state = wordStates.WORDPACKCHOSEN;
			
		}
	
	break;
	
	case(wordStates.WORDPACKCHOSEN):
	
		//populate list of words from chosen word pack
		global.wordpack_words = []; //clears global holding words array
		
		var wordpack_file_open = file_text_open_read(WORDPACKDIRECTORY + global.chosen_wordpack);
		var i = 0;
		while (!file_text_eof(wordpack_file_open)) {
	
			global.wordpack_words[i++] = file_text_read_string(wordpack_file_open);
			file_text_readln(wordpack_file_open);
	
		}
		file_text_close(wordpack_file_open);
		
		//moves to next state
		game_state = wordStates.WORDCHOOSE;
		alarm[0] = input_delay*2;
	
	break;
	
	case(wordStates.WORDCHOOSE):
	
		//note: may need to add another state machine here depending on game modes considered
		
		//game auto choses a random word and capitalizes it
		global.chosenword = string_upper(global.wordpack_words[irandom(array_length(global.wordpack_words)-1)]);
	
		//moves to next state
		game_state = wordStates.WORDCHOSEN;
		alarm[0] = input_delay;
	
	break;
	
	case(wordStates.WORDCHOSEN):
	
		//sets up display string
		display_str = "";
		repeat(string_length(global.chosenword)) {display_str += "_";}
	
		//moves to next state after delay
		game_state = wordStates.PLAYING;
		keyboard_string = "";
		alarm[0] = input_delay;
	
	break;
	
	case(wordStates.PLAYING):
	
		//checks if game is over
		if(tries_left <= 0) {game_win_lose = game.LOSE; game_state = wordStates.GAMEOVER;}
		else if(display_str == global.chosenword) {game_win_lose = game.WIN; game_state = wordStates.GAMEOVER;}
		
		//Handles tries
		#region
		
		//formats keyboard string
		if(string_length(keyboard_string) >= 1) {keyboard_string = string_upper(string_copy(keyboard_string,1,1));} //keeps guess one letter long and capitalizes it
		if(ord(keyboard_string) < 65) || (ord(keyboard_string) > 90) {keyboard_string = "";} //gets rid of anything that's not a capital letter
		if(string_count(keyboard_string,correct_letters) + string_count(keyboard_string,incorrect_letters) > 0) {keyboard_string = "";} //prevents duplicate guesses
		
		//letter checking
		if(keyboard_string != "") {
			
			//sorts keyboard string into correct or incorrect vars
			for(var i = 1; i <= string_length(global.chosenword); i++;) {
			
				if(keyboard_string == string_char_at(global.chosenword,i)) {correct_letters += keyboard_string; break;}
				else if(i >= string_length(global.chosenword)) {incorrect_letters += keyboard_string; tries_left--;}
			
			}
			
			//replaces the right index in display string with correct guess
			for(var j = 1; j <= string_length(global.chosenword); j++;) {
				
				if(keyboard_string == string_char_at(global.chosenword,j)) {display_str = string_replace_pos(keyboard_string,display_str,j);}
				
			}
			
			//resets keyboard string
			keyboard_string = "";
		
		}
		
		
		#endregion
	
	break;
	
	case(wordStates.GAMEOVER):
	
		
	
	break;
	
}
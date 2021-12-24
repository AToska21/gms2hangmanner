/// @description State machine

switch(game_state) {
	
	case(wordStates.STARTING):
		
		//method to change file name into a readable string
		var file_string_name = function(file_str) {
			
			if(is_string(file_str)) {
				
				//gets rid of file format string and forces all remaining letters into uppercase
				file_str = string_upper(string_replace(file_str,"_wordpack.txt",""));
				
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
		
		//moves to next state
		game_state = wordStates.WORDPACKCHOOSE;
		
	break;
	
	case(wordStates.WORDPACKCHOOSE):
	
		
	
	break;
	
	case(wordStates.WORDPACKCHOSEN):
	
		
	
	break;
	
	case(wordStates.WORDCHOOSE):
	
		//note: may need to add another state machine here depending on game modes considered
		
		//game auto choses a random word
		
	
	break;
	
	case(wordStates.WORDCHOSEN):
	
		
	
	break;
	
	case(wordStates.PLAYING):
	
		
	
	break;
	
	case(wordStates.GAMEOVER):
	
		
	
	break;
	
}
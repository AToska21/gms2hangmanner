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
		//finds first wordpack
		var file = file_find_first(WORDPACKDIRECTORY + "*.txt", fa_directory); //change to fa_readonly once files are read only
		
		//clears global holding wordpack list
		global.wordpack_list = [];
		
		//fills in global with wordpack names
		var i = 0;
		while(file != "") {
			
			global.wordpack_list[i] = file_string_name(file);
			file = file_find_next();
			i++;
			
		}
		file_find_close();
		
		//moves to next state
		game_state = wordStates.WORDCHOOSE;
		
	break;
	
}
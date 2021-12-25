/// @description Draws stuff

//text vars
var font = -1;
var outline_c = c_black;
var string_c = c_white;

//methods
//method to draw the now loading string
var now_loading = function(fnt,outln_c,str_c) {
	
	//draws now loading string
	var xx = room_width/2;
	var yy = room_height/2;
	var str = "Now Loading...";
	draw_text_outlined_ext(xx,yy,-1,-1,outln_c,str_c,1,1,1,str,fnt,fa_center,-1);

}

//draws everything needed for specific state
switch(game_state) {
	
	case(wordStates.STARTING):
		
		//draws now loading string
		now_loading(font,outline_c,string_c);
		
	break;
	
	case(wordStates.WORDPACKCHOOSE):
	
		//draws word pack list
		var xx = room_width/2;
		var yy = room_height/2;
		var str = "Scroll to choose a word pack" + "\n\n" + global.wordpack_list[wordpack_index].wordpack_name;
		draw_text_outlined_ext(xx,yy,-1,-1,outline_c,string_c,1,1,1,str,font,fa_center,-1);
	
	break;
	
	case(wordStates.WORDPACKCHOSEN):
	
		//draws now loading string
		now_loading(font,outline_c,string_c);
	
	break;
	
	case(wordStates.WORDCHOOSE):
	
		//draws word selection string
		var xx = room_width/2;
		var yy = room_height/2;
		var str = "Selecting a random word";
		draw_text_outlined_ext(xx,yy,-1,-1,outline_c,string_c,1,1,1,str,font,fa_center,-1);
	
	break;
	
	case(wordStates.WORDCHOSEN):
	
		//draws confirmation string
		var xx = room_width/2;
		var yy = room_height/2;
		var str = "Word selected";
		draw_text_outlined_ext(xx,yy,-1,-1,outline_c,string_c,1,1,1,str,font,fa_center,-1);
		
	break;
	
	case(wordStates.PLAYING):
	
		//draws spaces for each letter in chosen word
		var xx = room_width/2;
		var yy = room_height/2;
		var str = "";
			repeat(string_length(global.chosenword)) {str += "_";}
		draw_text_outlined_ext(xx,yy,-1,-1,outline_c,string_c,1,1,1,str,font,fa_center,-1);
	
		//draws selected word if debugging
		if(Debugging) {
			
			var xx = 5;
			var yy = 5;
			var str = "Selected word: " + global.chosenword;
			draw_text_outlined_ext(xx,yy,-1,-1,outline_c,string_c,0.5,0.5,1,str,font,-1,-1);
			
		}
	
	break;
	
	case(wordStates.GAMEOVER):
	
		
	
	break;
	
}
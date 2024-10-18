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
		var str = "Press enter to start with a default pack or scroll to pick a pack!" + "\n\n" + global.wordpack_list[wordpack_index].wordpack_name;
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
		var str = "Selecting a random word...";
		draw_text_outlined_ext(xx,yy,-1,-1,outline_c,string_c,1,1,1,str,font,fa_center,-1);
	
	break;
	
	case(wordStates.WORDCHOSEN):
	
		//draws confirmation string
		var xx = room_width/2;
		var yy = room_height/2;
		var str = "Word selected!";
		draw_text_outlined_ext(xx,yy,-1,-1,outline_c,string_c,1,1,1,str,font,fa_center,-1);
		
	break;
	
	case(wordStates.PLAYING):
	
		//draws display string
		var xx = room_width/2;
		var yy = room_height/2;
			
		draw_text_outlined_ext(xx,yy,-1,-1,outline_c,string_c,1,1,1,display_str,font,fa_center,-1);
	
		//draws debug info
		if(Debugging) {
			
			var str =	"DEBUG INFO" + "\n" +
						"Selected word:      " + global.chosenword + "\n" +
						"Incorrect letters:  " + incorrect_letters + "\n" +
						"Correct letters:    " + correct_letters + "\n" +
						"Tries left - " + string(tries_left)
			
						;
			
			draw_text_outlined_ext(5,5,-1,-1,outline_c,string_c,0.5,0.5,1,str,font,-1,-1);
			
		}
	
	break;
	
	case(wordStates.GAMEOVER):
	
		//draws game over message
		var xx = room_width/2;
		var yy = room_height/2;
		var str = "";
			if(game_win_lose = game.WIN) {str = global.chosenword + "\nYou did it!";}
			else if(game_win_lose = game.LOSE) {str = "You lost.\nThe word was " + global.chosenword + ".";}
			
		draw_text_outlined_ext(xx,yy,-1,-1,outline_c,string_c,1,1,1,str+"\n\nPress Alt to play again.",font,fa_center,-1);
	
	break;
	
}

//draws hanged man
if(tries_left < MAXTRIES) {
	
	//hangman spr vars
	var hm_x = 200;
	var hm_y = 200;
	var hm_scale = 2;
	
	//draws sprite
	draw_sprite_ext(global.hangman_skins[skin_index],tries_left,hm_x,hm_y,hm_scale,hm_scale,0,c_white,1);
	
}
/// @description Draws stuff

//Draws words loaded from chosen word pack
var temp_arr = global.wordpack_words; //saved to temp array to save on multiple calls to global
if(array_length(temp_arr) > 0) {
	
	var xx = room_width/2;
	var yy = 0;
	var line_spacing = 20;
	
	for(var i = 0; i < array_length(temp_arr); i++) {
		
		draw_text(xx, yy + line_spacing * i, temp_arr[i]);
		
	}
	
}
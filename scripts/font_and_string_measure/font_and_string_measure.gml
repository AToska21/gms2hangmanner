/// @description gets the height of a font in pixels
/// @function font_get_pix_h(font)
/// @param font
function font_get_pix_h(test_font){
	
	var current_font = draw_get_font();
	var font_height = 0;
	var test_string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ ";
	
	//Sets default font to new font, measures it then sets it back to default
	draw_set_font(test_font);
	font_height = string_height(test_string);
	draw_set_font(current_font);
	
	return font_height;

}//end of function

/// @description gets the height of a string in pixels depending on provided font
/// @function string_get_pix_h(string, font)
///@param string
/// @param font
function string_get_pix_h(str,test_font){
	
	var current_font = draw_get_font();
	var str_size = 0;
	var test_string = string(str);
	
	//Sets default font to new font, measures string (line breaks and all) then sets font back to default
	draw_set_font(test_font);
	str_size = string_height(test_string);
	draw_set_font(current_font);
	
	return str_size;

}//end of function
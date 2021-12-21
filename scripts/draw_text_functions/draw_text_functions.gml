///@function draw_text_outlined_ext(x, y, sep, w, outline color, string color, x scale, y scale, alpha, string, font, font halign, font valign, angle)  
///@param x
///@param y
///@param sep
///@param w
///@param outline_color
///@param string_color
///@param xscale
///@param yscale
///@param alpha
///@param string
///@param font
///@param font_halign
///@param font_valign
///@param angle
function draw_text_outlined_ext(xx, yy, sep, w, outline_color, string_color, xscale, yscale, alpha, str, fnt, fnt_halign, fnt_valign, angle=0) {

	//grabs current font to reset to it later
	var cur_font   = draw_get_font();
	var cur_halign = draw_get_halign();
	var cur_valign = draw_get_valign();
	
	//Sets font and alignment
	draw_set_font(fnt);
	draw_set_halign(fnt_halign)
	draw_set_valign(fnt_valign);

	//Outline  
	var c_color = outline_color;
	draw_text_ext_transformed_colour(xx + 1, yy + 1, str, sep, w, xscale, yscale, angle, c_color, c_color, c_color, c_color, alpha);  
	draw_text_ext_transformed_colour(xx - 1, yy - 1, str, sep, w, xscale, yscale, angle, c_color, c_color, c_color, c_color, alpha);  
	draw_text_ext_transformed_colour(xx, yy + 1, str, sep, w, xscale, yscale, angle, c_color, c_color, c_color, c_color, alpha);  
	draw_text_ext_transformed_colour(xx + 1, yy, str, sep, w, xscale, yscale, angle, c_color, c_color, c_color, c_color, alpha);  
	draw_text_ext_transformed_colour(xx, yy - 1, str, sep, w, xscale, yscale, angle, c_color, c_color, c_color, c_color, alpha);  
	draw_text_ext_transformed_colour(xx - 1, yy, str, sep, w, xscale, yscale, angle, c_color, c_color, c_color, c_color, alpha);  
	draw_text_ext_transformed_colour(xx - 1, yy + 1, str, sep, w, xscale, yscale, angle, c_color, c_color, c_color, c_color, alpha);  
	draw_text_ext_transformed_colour(xx + 1, yy - 1, str, sep, w, xscale, yscale, angle, c_color, c_color, c_color, c_color, alpha);  

	//Text  
	c_color = string_color; 
	draw_text_ext_transformed_colour(xx, yy, str, sep, w, xscale, yscale, angle, c_color, c_color, c_color, c_color, alpha);

	//Sets font and alignment to default
	draw_set_font(cur_font);
	draw_set_halign(cur_halign);
	draw_set_valign(cur_valign);

	/*
	Available alignments for fonts

	valign
		fa_top
		fa_middle
		fa_bottom
	
	halign
		fa_left
		fa_center
		fa_right
	*/


} //end of function

/// @description Inserts line breaks into a string to word wrap it within a desired width
/// @function string_wordwrap(string,max_width,ignore_string,ignore_length)
/// @param {string} string
/// @param {real} max_width

function string_wordwrap (str,max_width,ignore="|",ignore_len=3) {
	
	//vars initialization
	var str_len = string_length(str);
	var last_space = 1;
	var count = 1;
	var substr;
	
	//finds how many times the ignore substring is in the string
	var ignore_times = string_count(ignore,str);
	var ignore_str = "";
	repeat(ignore_times*ignore_len) {ignore_str += " ";}
	
	repeat(str_len) {
		
		substr = string_copy(str,1,count);
		if (string_char_at(str,count) == " ") {last_space = count;}
		
		if ((string_width(substr) - string_width(ignore_str)) > max_width) {
			
			str = string_delete(str,last_space,1);
			str = string_insert("\n",str,last_space);
			
		}
		
		count++;
		
	}
	
	return str
	
} //end of function
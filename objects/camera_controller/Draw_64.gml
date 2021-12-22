/// @description Draws Border and debug info

//draws custom border (unused)
/*
if window_get_fullscreen() {
	
	var border_width = 100;
	var border_height = window_get_height();
	var border_color = c_black;
	
	draw_rectangle_color(0, 0, border_width, border_height, border_color, border_color, border_color, border_color,  false);
	draw_rectangle_color(display_get_gui_width() - border_width, 0, display_get_gui_width(), border_height, border_color, border_color, border_color, border_color,  false);

}*/

//Draws various debug info if debugging macro is set to true
if Debugging {
	
	//if window_get_fullscreen() {
	
		//Draws grid outline//
		//grid vars
		var gridcell_size = GridCellSize;
		var view_x = camera_get_view_x(view_camera[0]);
		var view_y = camera_get_view_y(view_camera[0]);
		var c_grid = c_ltgray;
		var x1 = 0;
		var y1 = 0;
		var x2 = 0;
		var y2 = 0;
		var grid_alpha = 0.25;
	
		//draws vertical line
		for(var i = 1; i < display_get_gui_width()/gridcell_size; i++) {
		
			//calculates points for lines
			var view_gui_offset = roundto_nearest_x(view_x,gridcell_size) - view_x;
			var x1 = i * gridcell_size + view_gui_offset;
			var y1 = 0;
			var x2 = x1;
			var y2 = display_get_gui_height();
		
			//draws lines
			draw_set_alpha(grid_alpha);
			draw_line_color(x1,y1,x2,y2,c_grid,c_grid);
			draw_set_alpha(1); //resets alpha
		
		}
	
		//draws horizontal line
		for(var i = 1; i < display_get_gui_height()/gridcell_size; i++) {
		
			//calculates points for lines
			var view_gui_offset = roundto_nearest_x(view_y,gridcell_size) - view_y;
			var x1 = 0;
			var y1 = i * gridcell_size + view_gui_offset;
			var x2 = display_get_gui_width();
			var y2 = y1;
		
			//draws lines
			draw_set_alpha(grid_alpha);
			draw_line_color(x1,y1,x2,y2,c_grid,c_grid);
			draw_set_alpha(1); //resets alpha
		
		}
	
	//}
	
	//Draws game meta data and debug info
	
	var debug_font = -1;
	
	var text_string =	"Authors " + Author1 + " & " + Author2 + "\n" +
						Title + " v" + GameVersion + "\n" +
						"FPS  " + string(fps) + "\n" +
						"Instances Active  " + string(instance_count) + "\n" +
						"Camera Coordinates  " + string(x) + " , " + string(y) + "\n" +
						"Screen Scaling  x" + string_format(window_get_fullscreen() ? view_full_scale : view_scale,2,2) + "\n" +
						"View Dimensions  " + string(camera_get_view_width(view)) + " x " + string(camera_get_view_height(view)) + "\n"
						;
	var debug_text_padding = 10;
	var debug_x = debug_text_padding;
	var debug_y = display_get_gui_height() - string_get_pix_h(text_string,debug_font) - debug_text_padding;
	
	draw_text_outlined_ext(debug_x,debug_y,-1,-1,c_black,c_white,1,1,1,text_string,debug_font,fa_left,fa_top);
	
}//end of Debug check
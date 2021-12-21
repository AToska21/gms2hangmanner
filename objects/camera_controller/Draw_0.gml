/// @description Draws a representation when Debugging

//Sets it to invisible (alpha = 0) when out of debug mode
image_alpha = (Debugging ? 0.5 : 0);

if Debugging {
	
	//draws camera position
	draw_circle_color(x,y,7,c_ltgray,c_ltgray,false);
	
	//draws view positions
	var view_xx = camera_get_view_x(view_camera[0]);
	var view_yy = camera_get_view_y(view_camera[0]);
	var view_ww = camera_get_view_width(view_camera[0]);
	var view_hh = camera_get_view_height(view_camera[0]);
	var view_center_x = view_xx + view_ww/2;
	var view_center_y = view_yy + view_hh/2;
	var dot_r = 2;
	var line_len = 30;
	var line_w = 2;
	var view_color = c_red;
		//center
	draw_circle_color(view_center_x,view_center_y,dot_r,view_color,view_color,false);
		//up
	draw_line_width_color(view_center_x-line_len,view_yy,view_center_x+line_len,view_yy,line_w,view_color,view_color);
		//down
	draw_line_width_color(view_center_x-line_len,view_yy+view_hh-line_w,view_center_x+line_len,view_yy+view_hh-line_w,line_w,view_color,view_color);
		//left
	draw_line_width_color(view_xx,view_center_y+line_len,view_xx,view_center_y-line_len,line_w,view_color,view_color);
		//right
	draw_line_width_color(view_xx+view_ww-line_w,view_center_y+line_len,view_xx+view_ww-line_w,view_center_y-line_len,line_w,view_color,view_color);
	
}
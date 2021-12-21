//camera scripts

//Grabs view dimensions
function camera_view_update(view_cam = view_camera[0]) {
	
	view_xx = camera_get_view_x(view_cam);
	view_yy = camera_get_view_y(view_cam);
	view_ww = camera_get_view_height(view_cam);
	view_hh = camera_get_view_height(view_cam);
	view_center_x = view_xx + view_ww/2;
	view_center_y = view_yy + view_hh/2;

}
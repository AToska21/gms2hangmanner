/// @description Code

//Preps Resolution and Aspect Ratio
#region

//Finds right scale
view_full_zoom_factor = 2;
view_scale = floor(display_get_height() / global.gameresheight);
view_w = global.gamereswidth * view_scale;
view_h = global.gameresheight * view_scale;
view_full_scale = (display_get_height() / global.gameresheight);
view_full_w = display_get_width()/view_full_zoom_factor;
view_full_h = display_get_height()/view_full_zoom_factor;
//Sets camera and view size
view = view_camera[0];
camera_set_view_size(view,window_get_fullscreen() ? view_full_w : global.gamereswidth,window_get_fullscreen() ? view_full_h : global.gameresheight);

//resizes window to appropriate res
window_set_size((window_get_fullscreen()) ? view_full_w : view_w,(window_get_fullscreen()) ? view_full_h : view_h);

//resizes gui to game's resolution
display_set_gui_size(window_get_fullscreen() ? view_full_w : global.gamereswidth, window_get_fullscreen() ? view_full_h : global.gameresheight);

//Resizes application surface
surface_resize(application_surface,((window_get_fullscreen()) ? view_full_w : view_w), ((window_get_fullscreen()) ? view_full_h : view_h));

//centers window in alarm
alarm[0] = 1;

#endregion

//Camera Vars
#region

//Sets states for camera
enum cameraStates {
	
	SETUP,
	HOLD,
	FOLLOWPLAYER,
	FOLLOWSCENE,
	CENTER
	
}
camera_state = cameraStates.CENTER;

//Follow Vars
follow_dist = 50;
follow_lerp_factor = 0.05;

//Player vars
var pl_obj = instance_nearest(x,y,Player); //change this to whatever the player object is called
player_view_id = instance_exists(pl_obj) ? pl_obj.id : noone;

#endregion
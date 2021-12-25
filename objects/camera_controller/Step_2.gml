/// @description Camera Movement

//Sets method to follow the camera controller
var cam_pos = function () {
	
	//Positions Camera on the Controller
	var view_x = clamp(x - camera_get_view_width(view)/2, 0, room_width - camera_get_view_width(view));
	var view_y = clamp(y - camera_get_view_height(view)/2, 0, room_height - camera_get_view_height(view));

	camera_set_view_pos(view,view_x,view_y);
	
}

//State Machine for Camera
switch(camera_state) {
	
	case(cameraStates.SETUP):
	break;
	
	case(cameraStates.HOLD):
		//Holds camera in place
	break;
	
	case(cameraStates.FOLLOWPLAYER):
		
		//positions camera controller
		if instance_exists(player_view_id) {
			
			//Follows player
			if point_distance(x,y,player_view_id.x,player_view_id.y) > follow_dist {
	
			x = lerp(x,player_view_id.x, follow_lerp_factor);
			y = lerp(y,player_view_id.y, follow_lerp_factor);

			}
			
		}
		
		//positions view
		cam_pos();
	
	break;
	
	case(cameraStates.FOLLOWSCENE):
	break;
	
	case(cameraStates.CENTER):
	
		//Keeps view centered on camera
		camera_set_view_pos(view, x - camera_get_view_width(view)/2, y - camera_get_view_height(view)/2);
	
		//Keeps camera centered in room
		x = room_width/2;
		y = room_height/2;
	
	break;
	
}

//keeps view at proper size
camera_set_view_size(view,window_get_fullscreen() ? view_full_w : global.gamereswidth, window_get_fullscreen() ? view_full_h : global.gameresheight);

/*
//Toggles full screen
if keyboard_check_pressed(vk_f4) {
	
	//sets or gets out of full screen
	window_set_fullscreen(!window_get_fullscreen());
	surface_resize(application_surface,(window_get_fullscreen()) ? view_full_w : view_w, (window_get_fullscreen()) ? view_full_h : view_h);
	
	//resizes window to appropriate res
	window_set_size((window_get_fullscreen()) ? view_full_w : view_w,(window_get_fullscreen()) ? view_full_h : view_h);

	//Recenters window
	if !window_get_fullscreen() {alarm[0] = 10;}
	
	//maintains gui layer scale and position
	display_set_gui_size(window_get_fullscreen() ? view_full_w : global.gamereswidth, window_get_fullscreen() ? view_full_h : global.gameresheight);
	
}

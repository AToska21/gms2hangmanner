/// @description Enables Views at the Start of Every Room

//snaps to correct position
switch(camera_state) {
	
	case(cameraStates.SETUP):
	break;
	
	case(cameraStates.FOLLOWPLAYER):
	
		if instance_exists(player_view_id) {
			
			x = player_view_id.x;
			y = player_view_id.y;
			
		}
	
	break;
	
	case(cameraStates.FOLLOWSCENE):
	break;
	
}

//enables views
view_enabled = true;
view_visible[0] = true;
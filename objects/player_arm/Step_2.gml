/// @description Insert description here
// You can write your code in this editor
if (player.light == "tubelight" or player.light == "flashlight") {
	if (player.light == "tubelight") {sprite_index = spr_arm_tubelight}
	else if (player.light == "flashlight") {sprite_index = spr_arm_flashlight}
	image_alpha = 1;
	switch (player.sprite_index) {
	case spr_player_idle_armless: 
		image_index = 1;
		if (floor(player.image_index) == 0) {snap_x = 8; snap_y = -28.5;}
		if (floor(player.image_index) == 1) {snap_x = 8; snap_y = -29;}
		if (floor(player.image_index) == 2) {snap_x = 8; snap_y = -30;}
	break;
	case spr_player_run_armless:
		image_index = 0;
		if (floor(player.image_index) == 0) {snap_x = -3; snap_y = -17;}
		if (floor(player.image_index) == 1) {snap_x = -3; snap_y = -11.8;}
		if (floor(player.image_index) == 2) {snap_x = -3.1; snap_y = -10.9;}
		if (floor(player.image_index) == 3) {snap_x = -5; snap_y = -15}
		if (floor(player.image_index) == 4) {snap_x = -3; snap_y = -14}
		if (floor(player.image_index) == 5) {snap_x = -3; snap_y = -13}
		if (floor(player.image_index) == 6) {snap_x = -5; snap_y = -10;}
		if (floor(player.image_index) == 7) {snap_x = -4; snap_y = -16;}
	break;
	default:
	break;
	}
	
	if (player.image_xscale >= 0) {x = player.x + snap_x}
	else if (player.image_xscale < 0) {x = player.x - snap_x}
	y = player.y + snap_y;
	
	var mouse_angle = radtodeg(arctan2((mouse_x-x),(mouse_y-y)));
	image_angle = mouse_angle
	
	if (player.image_xscale <= 0) {
		if (
		//(mouse_angle <= -45 and mouse_angle > -180) or 
		//(mouse_angle < 180 and mouse_angle > 135)
		mouse_angle < 0
		) {
			image_xscale = abs(image_xscale)
		}
		else {
			image_xscale = -abs(image_xscale)
		}
	}
	else {
		if (
		(mouse_angle <= -135 and mouse_angle > -180) or 
		(mouse_angle < 180 and mouse_angle > 45)
		//mouse_angle > 0
		) {
			image_xscale = -abs(image_xscale)
		}
		else {
			image_xscale = abs(image_xscale)
		}
	}
	
	
	
	
}

else {
	image_alpha = 0;
};
show_debug_message(radtodeg(arctan2((mouse_x-x),(mouse_y-y))));
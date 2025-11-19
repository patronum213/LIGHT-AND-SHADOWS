/// @description Insert description here
// You can write your code in this editor
if (player.light == "tubelight" or player.light == "flashlight") {
	if (player.light == "tubelight") {sprite_index = spr_arm_tubelight}
	else if (player.light == "flashlight") {sprite_index = spr_arm_flashlight}
	image_alpha = 1;
	switch (player.sprite_index) {
	case spr_player_idle_armless: 
		if (floor(player.image_index) == 0) {snap_x = 8; snap_y = -28.5;}
		if (floor(player.image_index) == 1) {snap_x = 8; snap_y = -29;}
		if (floor(player.image_index) == 2) {snap_x = 8; snap_y = -30;}
	break;
	case spr_player_run_armless:
		if (floor(player.image_index) == 0) {snap_x = 5; snap_y = 5;}
		if (floor(player.image_index) == 1) {snap_x = 5; snap_y = 5;}
		if (floor(player.image_index) == 2) {snap_x = 5; snap_y = 5;}
		if (floor(player.image_index) == 3) {snap_x = 5; snap_y = 5;}
		if (floor(player.image_index) == 4) {snap_x = 5; snap_y = 5;}
		if (floor(player.image_index) == 5) {snap_x = 5; snap_y = 5;}
		if (floor(player.image_index) == 6) {snap_x = 5; snap_y = 5;}
		if (floor(player.image_index) == 7) {snap_x = 5; snap_y = 5;}
	break;
	default:
	break;
	}
	
	x = player.x + snap_x
	y = player.y + snap_y
	
	if (radtodeg(arctan2((mouse_x-x),(mouse_y-y)))<0) {
		image_angle = radtodeg(arctan2((mouse_x-x),(mouse_y-y)))
				image_xscale = abs(image_xscale)}
			else {
				image_angle = radtodeg(arctan2((mouse_x-x),(mouse_y-y)))
				image_xscale = -abs(image_xscale)}
	
}

else {
	image_alpha = 0;
};
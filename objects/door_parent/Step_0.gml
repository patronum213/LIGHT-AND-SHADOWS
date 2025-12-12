// @description Insert description here
// You can write your code in this editor
if (distance_to_point(player.x, player.y) <= 200 and 
	position_meeting(mouse_x, mouse_y, id)) {
		image_alpha = 1;
		if (mouse_check_button_pressed(mb_left)) {
			global.enemies_in_queue = array_concat(global.enemies_in_room, global.enemies_in_queue);
			global.enemies_in_room = [];
			global.prev_room = previous;
			global.entry_point = entry_point;
			room_goto(target);
		}
}
else {image_alpha = 0;};



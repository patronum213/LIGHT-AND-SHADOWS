/// @description Insert description here
// You can write your code in this editor
if (distance_to_point(player.x, player.y) <= 200 and 
	position_meeting(mouse_x, mouse_y, id) and 
	mouse_check_button_pressed(mb_left)) {
	room_goto(Room2);
}
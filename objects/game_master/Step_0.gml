/// @description Insert description here
// You can write your code in this editor
/*if (new_room) {
player.xstart = entry_point.x;
player.ystart = entry_point.y;
player.x = player.xstart;
player.y = player.ystart;
new_room = false;
}*/
camera = {
	id : camera_get_active(),
	x : camera_get_view_x(view_camera[0]),
	y : camera_get_view_y(view_camera[0])
}; 


if (keyboard_check(vk_shift) and keyboard_check_pressed(ord("R"))) {game_restart();}
else if (keyboard_check_pressed(ord("R"))) {room_restart(); new_room = true;};

if (keyboard_check_pressed(vk_escape)) {global.paused = !global.paused;};
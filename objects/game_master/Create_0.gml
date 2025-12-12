/// @description Insert description here
// You can write your code in this editor
// Create the lighting system.
var width, height, color;
randomize();
width = camera_get_view_width(view_get_camera(0));
height = camera_get_view_height(view_get_camera(0));
color = make_color_hsv(0, 0, 0.075 * 255);
//global.system = light_init(width, height, 1024, color, 1, -1, noone);
global.paused = false;
global.enemies_in_room = [];
global.enemies_in_queue = [];
global.prev_room = Room1;
global.entry_point = starting_pos;

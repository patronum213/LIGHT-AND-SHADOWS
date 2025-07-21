/// @description Insert description here
// You can write your code in this editor
vel_x = 0;
vel_y = 0;
collided = false;
_speed = 35;
pull_force = 20;
RGing = false;
if (abs(mouse_x-x) >= abs(mouse_y-y)) {
	vel_x = _speed*(mouse_x-x)/abs(mouse_x-x);
	vel_y = _speed*(mouse_y-y)/abs(mouse_x-x);
}
else if (abs(mouse_x-x) <= abs(mouse_y-y)) {
	vel_x = _speed*(mouse_x-x)/abs(mouse_y-y);
	vel_y = _speed*(mouse_y-y)/abs(mouse_y-y);
}
image_angle = (arctan2(mouse_x-x, mouse_y-y)*57.2958)-135

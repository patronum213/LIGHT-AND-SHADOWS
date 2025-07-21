/// @description Insert description here
// You can write your code in this editor
vel_x = 0;
vel_y = 0;
collided = false;
_speed = 25;
force = -30;
curving_value = 0.4//how sharp the drop off should be, closer to 0 = sharper
distance_normalising = 200;//distance at which we want the force to start dropping off
grav = 1.2;
delay = 25;
if (abs(mouse_x-x) >= abs(mouse_y-y)) {
	vel_x = _speed*(mouse_x-x)/abs(mouse_x-x);
	vel_y = _speed*(mouse_y-y)/abs(mouse_x-x);
}
else if (abs(mouse_x-x) <= abs(mouse_y-y)) {
	vel_x = _speed*(mouse_x-x)/abs(mouse_y-y);
	vel_y = _speed*(mouse_y-y)/abs(mouse_y-y);
}
image_angle = (arctan2(mouse_x-x, mouse_y-y)*57.2958)-135
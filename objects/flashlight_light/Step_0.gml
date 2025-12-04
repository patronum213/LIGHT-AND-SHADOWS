/// @description Insert description here
// You can write your code in this editor
image_angle = radtodeg(arctan2((mouse_x-x),(mouse_y-y)))
light_set_rotation(light, image_angle);
light_set_position(light, x, y);

event_inherited()



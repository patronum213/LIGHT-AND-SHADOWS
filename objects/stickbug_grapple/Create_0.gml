/// @description Insert description here
// You can write your code in this editor

landed = false;
vel_mult = 20;

vel_x = cos(degtorad(target_angle))*vel_mult;
vel_y = sin(degtorad(target_angle))*vel_mult;
remainder_x = 0;
remainder_y = 0;

image_xscale = 0.05;
image_yscale = 0.05;
image_angle = target_angle;
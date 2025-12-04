/// @description Insert description here
// You can write your code in this editor
color = make_color_hsv(20, 50, 255);
light = light_create(global.system, sp_light, 1, color, 0.05, 0, true);
light_set_position(light, x, y);
image_xscale = 1;
image_yscale = 1;
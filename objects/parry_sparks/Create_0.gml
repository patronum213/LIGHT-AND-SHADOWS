/// @description Insert description here
// You can write your code in this editor
image_xscale = 0.25;
image_yscale = 0.25;
alpha = 1;
color = make_color_hsv(20, 50, 255);
light = light_create(global.system, sp_light, 1, color, 0.5, 0, true);
light_set_position(light, x, y);
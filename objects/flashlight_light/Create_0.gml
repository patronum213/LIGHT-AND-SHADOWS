/// @description Insert description here
// You can write your code in this editor
damage = 1;

color = make_color_hsv(255, 0, 255);
light = light_create(global.system, sp_spotlight, 2, color, 0.5, 0, true);
light_set_rotation(light, image_angle);
light_set_position(light, x, y);
event_inherited()
/// @description Insert description here
// You can write your code in this editor
owner = player.id;
damage = 100;
alpha = 1;

color = make_color_hsv(20, 50, 255);
light = light_create(global.system, sp_light, 2, color, 0.5, 0, true);
light_set_position(light, x, y);
if (mouse_x > player.x) {light_set_position(light, x+50, y);};
if (mouse_x < player.x) {light_set_position(light, x-50, y);};


event_inherited()

image_xscale = 2;
image_yscale = 2;

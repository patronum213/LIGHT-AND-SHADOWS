/// @description Insert description here
// You can write your code in this editor
damage = 40;

if (!(variable_instance_exists(id, "color"))) {color = "red";};

if (color = "red") {var light_color = make_colour_rgb(255, 0, 0)}
if (color = "blue") {var light_color = make_colour_rgb(0, 0, 255)}
if (color = "yellow") {var light_color = make_colour_rgb(255, 255, 0)}
if (color = "green") {var light_color = make_colour_rgb(0, 255, 0)}
light = light_create(global.system, sp_light, 1, light_color, 0.5, 0, true);
light_set_position(light, x, y);

event_inherited()
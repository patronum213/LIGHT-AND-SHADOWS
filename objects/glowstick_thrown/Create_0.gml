/// @description Insert description here
// You can write your code in this editor
owner = player.id;
damage = 40;
charge = 100;

if !(variable_instance_exists(id, "vel_x")) {vel_x=0};
if !(variable_instance_exists(id, "vel_y")) {vel_y=0};
remainder_x = 0;
remainder_y = 0;
_friction = 0.2;
friction_clamp_threshhold = 1;

if !(variable_instance_exists(id, "color")) {color = make_color_hsv(random_range(0, 255), 200, 255)};
light = light_create(global.system, sp_light, 1, color, 0.5, 0, true);
light_set_position(light, x, y);
image_xscale = 0.8;
image_yscale = 0.8;
image_angle = random(360);
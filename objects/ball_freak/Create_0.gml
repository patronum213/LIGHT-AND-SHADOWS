/// @description Insert description here
// You can write your code in this editor
max_health = 200;

image_xscale = 0.1;
image_yscale = 0.1;
randomise();
angle = random(360);
show_debug_message(angle)
vel_x = cos(angle)*6;
vel_y = sin(angle)*6;



event_inherited();
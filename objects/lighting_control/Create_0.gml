// Create the lighting system.
var width, height, color;
randomize();

max_brightness_pct = 0.5//0.03125;
min_brightness_pct = 0.5//0.005;
acclimation_time = 1000;

width = camera_get_view_width(view_get_camera(0));
height = camera_get_view_height(view_get_camera(0));
color = make_color_hsv(0, 0, min_brightness_pct * 255);
global.system = light_init(width, height, 1024, color, 1, -1, noone);

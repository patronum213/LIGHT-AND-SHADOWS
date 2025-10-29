var color;
color = make_color_hsv(floor(random(255)), 255, 255);
light = light_create(global.system, sp_light, 2, color, 1, 0, true);
light_set_position(light, x, y);

scale = 1;
max_scale = 2;
min_scale = 0.5;
scale_inc = 0.01;
going_up = true;

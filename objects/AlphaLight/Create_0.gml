var color;
color = make_color_hsv(floor(random(255)), 255, 255);
light = light_create(global.system, sp_spotlight, 2, color, 1, 0, true);
light_set_position(light, x, y);

alpha = 0.5;
max_alpha = 1;
min_alpha = 0;
alpha_inc = 0.01;
going_up = true;

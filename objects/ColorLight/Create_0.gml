var color;
hue = floor(random(255));
color = make_color_hsv(hue, 255, 255);
light = light_create(global.system, sp_light, 2, color, 1, 0, true);
light_set_position(light, x, y);

next_hue = floor(random(255));
hue_inc = 1;
going_up = next_hue > hue;

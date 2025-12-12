var color;
color = make_color_hsv(255, 0, 127.5);
light = light_create(global.system, sp_spotlight, 2, color, 1, 0, true);
light_set_position(light, x, y);
var draw_x, draw_y;

draw_x = camera_get_view_x(view_get_camera(0));
draw_y = camera_get_view_y(view_get_camera(0));

light_draw(global.system, draw_x, draw_y, true, true, 0);
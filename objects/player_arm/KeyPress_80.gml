/// @description Insert description here
// You can write your code in this editor
show_debug_message("frame index");
show_debug_message(floor(player.image_index));
show_debug_message("x");
show_debug_message(mouse_x-player.x);
show_debug_message("y");
show_debug_message(mouse_y-player.y);
player.image_index += 1;
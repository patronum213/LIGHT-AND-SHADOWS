/// @description Insert description here
// You can write your code in this editor
if (distance_to_point(mouse_x, mouse_y) <= 200) {
	if (alpha_monitor) > 0 {alpha_monitor-=0.01}
	else {alpha_monitor = 1}
	
	if (keyboard_check(ord("E"))) {
		array_push(player.inventory, item_id);
		instance_deactivate_object(id);
	}
}
else {alpha_monitor = 1}
image_alpha = abs(alpha_monitor-0.5)+0.5

if (place_meeting(x, y, player)) {
	array_push(player.inventory, "test_flower");
	instance_destroy()
}
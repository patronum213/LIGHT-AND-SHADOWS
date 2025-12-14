/// @description Insert description here
// You can write your code in this editor
decoration_layer = layer_get_id("Decoration")
placement_interval = 200;
billboard_streak = 0;
randomise();
for (x = placement_interval; x + placement_interval < room_width; x += placement_interval) {
	var object_choice = choose(
			freak_1,
			ball_freak,
			nautilus_freak,
			stickbug_freak
		);
	show_debug_message(object_choice)
	var enemy = instance_create_layer(x, y, "Instances", object_choice);
	variable_instance_set(enemy, "image_xscale", 0.1)
	variable_instance_set(enemy, "image_yscale", 0.1)
}





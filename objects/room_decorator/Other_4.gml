/// @description Insert description here
// You can write your code in this editor
decoration_layer = layer_get_id("Decoration")
placement_interval = 250;
billboard_streak = 0;
randomise();
for (x = placement_interval; x + placement_interval < room_width; x += placement_interval) {
	if (billboard_streak >= 2) {
		var object_choice = choose(
			bench,
			side_sign,
			ad_sign_1,
			ad_sign_2
		);
	}
	else {
		var object_choice = choose(
			bench,
			side_sign,
			ad_billboard_1,
			ad_billboard_2,
			ad_billboard_3,
			ad_billboard_4,
			ad_sign_1,
			ad_sign_2
		);
	}
	switch (object_choice) {
	case ad_billboard_1:
	case ad_billboard_2:
	case ad_billboard_3:
	case ad_billboard_4:
		billboard_streak += 1;
	case bench:
		//placement_interval = 250;
	break;
	case ad_sign_1:
	case ad_sign_2:
	case side_sign:
		//placement_interval = 100;
	break;
	default:
		show_debug_message("what the fuck")
	break;
	}
	show_debug_message("creating light: ") 
	show_debug_message(object_choice)
	var sprite = layer_sprite_create(decoration_layer, x, y, object_choice);
	layer_sprite_xscale(sprite, 0.2);
	layer_sprite_yscale(sprite, 0.2);
}


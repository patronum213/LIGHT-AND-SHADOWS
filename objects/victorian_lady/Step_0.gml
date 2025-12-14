/// @description Insert description here
// You can write your code in this editor
show_debug_message(player.in_dialogue)
if (
mouse_check_button(mb_right) and 
collision_point(mouse_x, mouse_y, id, false, false) and
(sqrt(power(player.x - x, 2) + power(player.y - y, 2)) < 300) and 
!player.in_dialogue and !in_dialogue_with_player) {
	
	if (global.lady_spoken == true) {
	dialogue = ["Ah, hello again.", "I'm afraid I can't offer you much in these times, but please feel free to sit within the light as long as you may desire."
	
	]
	}
	
	
	global.lady_spoken = true;
	player.in_dialogue = true;
	in_dialogue_with_player = true; 
	interaction_progress = 0;
	
	dialogue_text = layer_text_create(game_master.dialogue_layer, game_master.camera.x + text_x, game_master.camera.y + text_y, Font_1, dialogue[interaction_progress]);
	layer_text_framew(dialogue_text, framew);
	layer_text_frameh(dialogue_text, frameh);
	layer_text_wrap(dialogue_text, true);
	layer_text_xscale(dialogue_text, 0.66)
	layer_text_yscale(dialogue_text, 0.66)

	dialogue_box = layer_sprite_create(game_master.dialogue_layer, game_master.camera.x + spr_x, game_master.camera.y + spr_y, box_sprite);
	layer_sprite_xscale(dialogue_box, size_multiplier);
	layer_sprite_yscale(dialogue_box, size_multiplier);
	
	layer_set_visible(game_master.dialogue_layer, true);
	if (is_array(dialogue[interaction_progress])) {
			layer_text_text(dialogue_text, dialogue[interaction_progress][0]);
			array_push(do_dialogue_functions, dialogue[interaction_progress][1])
		}
		else { 
			
			layer_text_text(dialogue_text, dialogue[interaction_progress]);
		}
}
if (in_dialogue_with_player and keyboard_check_pressed(vk_space)) {
	if (interaction_progress < array_length(dialogue)-1) {
		interaction_progress += 1;
		if (is_array(dialogue[interaction_progress])) {
			layer_text_text(dialogue_text, dialogue[interaction_progress][0]);
			array_push(do_dialogue_functions, dialogue[interaction_progress][1])
		}
		else { 
			layer_text_text(dialogue_text, dialogue[interaction_progress]);
		}
		/*for (var i = 0; i < array_length(do_dialogue_functions); i += 1) {
			if (is_array(do_dialogue_functions[i])) {
				
			}
			else {
				switch (do_dialogue_functions, i)
			}
		}*/
		if (array_contains(do_dialogue_functions, "set_state_moon")) {
			player.state = "moon"; array_pop(do_dialogue_functions);
		};
	}
	else if (interaction_progress >= array_length(dialogue)-1) {
	layer_sprite_destroy(dialogue_box);
	layer_text_destroy(dialogue_text);
	player.in_dialogue = false;
	in_dialogue_with_player = false;
	layer_set_visible(game_master.dialogue_layer, false);
	}
}

if (in_dialogue_with_player) {
	sprite_index = spr_victorian_lady_talking
}else {sprite_index = spr_victorian_lady}


///@description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, player) and !player_reading) {
	player.in_dialogue  = true;
	player_reading = true;
	layer_set_visible(game_master.dialogue_layer, true);
	image = layer_sprite_create(game_master.dialogue_layer, game_master.camera.x + 682, game_master.camera.y + 383, sprite);
	layer_sprite_xscale(image, 0.7);
	layer_sprite_yscale(image, 0.7);
	array_push(player.codexes, codex_id);
};
if (player_reading and keyboard_check_pressed(vk_space)) {
	player.in_dialogue  = false;
	player_reading = false;
	layer_sprite_destroy(image);
	layer_set_visible(game_master.dialogue_layer, false);
	instance_deactivate_object(id);
	
}
else {
	t = t < 2 ? t + (1/90) : 0
	y = ystart + 10*sin(t*pi)
	
}


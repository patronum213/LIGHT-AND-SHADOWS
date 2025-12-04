/// @description Insert description here
// You can write your code in this editor
collision_tilemap = layer_tilemap_get_id("Collision_Tiles");
tile_layers = [collision_tilemap];
//dialogue_layer = layer_get_id("Dialogue");
dialogue_layer = layer_get_id("UI");
//dialogue_text = layer_text_get_id(game_master.dialogue_layer, "dialogue _text");
player.xstart = starting_pos.x;
player.ystart = starting_pos.y;

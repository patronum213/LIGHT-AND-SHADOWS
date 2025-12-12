/// @description Insert description here
// You can write your code in this editor
show_debug_message("room started")
collision_tilemap = layer_tilemap_get_id("Collision_Tiles");
tile_layers = [collision_tilemap];
dialogue_layer = layer_get_id("UI");
player.xstart = global.entry_point.x;
player.ystart = global.entry_point.y;
player.x = player.xstart;
player.y = player.ystart;


/// @description Insert description here
// You can write your code in this editor
tile_size = 60;
placement_interval = tile_size*4;
randomise();
for (x = placement_interval; x + placement_interval < room_width; x += placement_interval) {
	if (random_range(1,5) <= 3) {
		y += tile_size*random_range(-1,1)
		tilemap_set_at_pixel(game_master.collision_tilemap, 2, x-tile_size, y)
		tilemap_set_at_pixel(game_master.collision_tilemap, 2, x, y)
		tilemap_set_at_pixel(game_master.collision_tilemap, 2, x+tile_size, y)
	}
}



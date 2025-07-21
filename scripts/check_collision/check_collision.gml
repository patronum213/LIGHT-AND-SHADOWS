// This function checks if the instance is colliding with an object, or a tile, at the current
// position + the given movement values (_move_x and _move_y).
// The function returns true if a collision was found, or false if a collision was not found.
function check_collision(_move_x, _move_y) 
{
	for (var i = 0; i < array_length(game_master.tile_layers); i++) {
		if (
			tilemap_get_at_pixel(game_master.tile_layers[i], bbox_left + _move_x, bbox_top + _move_y) or
			tilemap_get_at_pixel(game_master.tile_layers[i], bbox_right + _move_x, bbox_top + _move_y) or
			tilemap_get_at_pixel(game_master.tile_layers[i], bbox_right + _move_x, bbox_bottom + _move_y) or
			tilemap_get_at_pixel(game_master.tile_layers[i], bbox_left + _move_x, bbox_bottom + _move_y) or
			instance_place(x+_move_x, y+_move_y, all) != -4
		) {
			return true;
		}
		else {
			return false;
		}
	}
}
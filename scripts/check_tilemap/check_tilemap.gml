// This function takes a tilemap id (the tilemap to check for), an x offset and a y offset
// The function returns true if the tilemap was found at the specified offset of the bounding box,
// or false if it was not found there.
function check_tilemap(tilemap, move_x, move_y) 
{
		if (
			tilemap_get_at_pixel(tilemap, bbox_left + move_x, bbox_top + move_y) or
			tilemap_get_at_pixel(tilemap, bbox_right + move_x, bbox_top + move_y) or
			tilemap_get_at_pixel(tilemap, bbox_right + move_x, bbox_bottom + move_y) or
			tilemap_get_at_pixel(tilemap, bbox_left + move_x, bbox_bottom + move_y)
		) {
			return true;
		}
		else {
			return false;
		}
	
}
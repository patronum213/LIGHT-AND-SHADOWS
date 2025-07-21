function is_touching(id, x, y, colliding_objects = [all]) {
		for (var i = 0; i < array_length(colliding_objects); i++) {
			if (instance_place(x, y, colliding_objects[i]) != -4) {
				return instance_place(x, y, colliding_objects[i])
			}
			if (instance_place(x+1, y+1, colliding_objects[i]) != -4) {
				return instance_place(x+1, y+1, colliding_objects[i])
			}
			if (instance_place(x-1, y+1, colliding_objects[i]) != -4) {
				return instance_place(x-1, y+1, colliding_objects[i])
			}
			if (instance_place(x+1, y-1, colliding_objects[i]) != -4) {
				return instance_place(x+1, y-1, colliding_objects[i])
			}
			if (instance_place(x-1, y-1, colliding_objects[i]) != -4) {
				return instance_place(x-1, y-1, colliding_objects[i])
			}
			else {
				var _layer_ids = layer_get_all()
				for (var i = 0; i < array_length(_layer_ids); i++) {
					var _tile_id = layer_tilemap_get_id(i)
					if (_tile_id == colliding_objects[i]) {	
							if(
								tilemap_get_at_pixel(_tile_id, bbox_left, bbox_top + _move_once) or
								tilemap_get_at_pixel(_tile_id, bbox_right, bbox_top + _move_once) or
								tilemap_get_at_pixel(_tile_id, bbox_right, bbox_bottom + _move_once) or
								tilemap_get_at_pixel(_tile_id, bbox_left, bbox_bottom + _move_once)) 
								{
									return _tile_id
								};
					}
				}
			}
		}

};
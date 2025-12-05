function move_with_collision(_id, x, y, vel_x, vel_y, colliding_objects = [all], colliding_blacklist = [], remainder_x = "remainder_x", remainder_y = "remainder_y") {
// remainder varibles default to remainder_x and  remainder_y for collection
// The section below handles pixel-perfect collision checking.
// It does collision checking twice, first on the X axis, and then on the Y axis.
// On each axis, it moves the character pixel-by-pixel until its velocity for that axis is covered, or a collision is found.
// this is a bandaid fix, but it will do for now.
var collided_object_x = noone;
var collided_object_y = noone;
// 'move_count' is how many total pixels the character needs to move this frame. It is the absolute value of the velocity on an axis.
// 'move_once' is the amount of pixels it needs to move once, before checking for a collision. It is 1, 0, or -1.
var _move_count = abs(vel_x);
var _move_count_remaining = vel_x
var _move_once = sign(vel_x);
// This runs a loop, which runs 'move_count' times. All code in this block is repeated that many amount of times.
repeat (_move_count)
{
	// This calls the check_collision function to check for collisions on the X axis, if moved by the move_once value.
	// The result of the function, either true or false, is stored in the 'collision_found' variable, which is temporary.
	var _collision_found = check_collision(_move_once, 0)
	// This checks if collision_found is false, meaning a collision was not found, and the player is free to move once on the X axis.
	if (_collision_found)
	{	
		var collided_object = noone
		if (instance_place(x + _move_once, y, colliding_objects) != noone){ //if it's an object
		collided_object = instance_place(x + _move_once, y, colliding_objects)
		}
		else //otherwise we know it's a tilemap as those are the only other things check_collision checks for
		{
			for (var i = 0; i < array_length(game_master.tile_layers); i++) {//check every tilemap in the game by corners
				if (
					(tilemap_get_at_pixel(game_master.tile_layers[i], bbox_left + _move_once, bbox_top) or
					tilemap_get_at_pixel(game_master.tile_layers[i], bbox_right + _move_once, bbox_top) or
					tilemap_get_at_pixel(game_master.tile_layers[i], bbox_right + _move_once, bbox_bottom) or
					tilemap_get_at_pixel(game_master.tile_layers[i], bbox_left + _move_once, bbox_bottom)) and
					array_contains(colliding_objects, game_master.tile_layers[i])
				) {
					collided_object = game_master.tile_layers[i];//if the tile map we're currently checking both is touching us, and is on the list, then make it the colliding object 
				}
			}
		}
		if (collided_object != noone and !array_contains(colliding_blacklist, collided_object))
		{	
			variable_instance_set(_id, remainder_x, _move_count_remaining);
			//variable_instance_set(_id, remainder_y, vel_y);
			collided_object_x = collided_object;
			break;
		}
		else {
			// In that case, move_once is added to the X coordinate of the character.
			_id.x += _move_once
			_move_count_remaining -= sign(_move_count_remaining);
		};
	}
	else
	{
		// In that case, move_once is added to the X coordinate of the character.
		_id.x += _move_once
		_move_count_remaining -= sign(_move_count_remaining);
	}	
};
// We now repeat all of the previous steps to check for collisions on the Y axis.
// Everything is the same, but vel_x is replaced by vel_y, and the check_collision function takes a Y value (its second argument).
var _move_count = abs(vel_y);
var _move_count_remaining = vel_y;
var _move_once = sign(vel_y);
// This runs a loop, which runs 'move_count' times. All actions attached to this are repeated that many amount of times.
repeat (_move_count)
{
	// This calls the check_collision function to check for collisions on the Y axis, if moved by the move_once value.
	// The result of the function, either true or false, is stored in the 'collision_found' variable, which is temporary.
	var _collision_found = check_collision(0, _move_once);
	
	// This checks if collision_found is false, meaning a collision was not found, and the player is free to move once on the Y axis.
	if (_collision_found)
	{	
		var collided_object = noone
		if (instance_place(x, y + _move_once, colliding_objects) != noone){ //if it's an object
		collided_object = instance_place(x, y + _move_once, colliding_objects)
		}
		else //otherwise we know it's a tilemap as those are the only other things check_collision checks for
		{
			for (var i = 0; i < array_length(game_master.tile_layers); i++) {//check every tilemap in the game by corners
				if (
					(tilemap_get_at_pixel(game_master.tile_layers[i], bbox_left, bbox_top + _move_once) or
					tilemap_get_at_pixel(game_master.tile_layers[i], bbox_right, bbox_top + _move_once) or
					tilemap_get_at_pixel(game_master.tile_layers[i], bbox_right, bbox_bottom + _move_once) or
					tilemap_get_at_pixel(game_master.tile_layers[i], bbox_left, bbox_bottom + _move_once)) and
					array_contains(colliding_objects, game_master.tile_layers[i])
				) {
					collided_object = game_master.tile_layers[i];//if the tile map we're currently checking both is touching us, and is on the list, then make it the colliding object 
				}
			}
		}
		if (collided_object != noone and !array_contains(colliding_blacklist, collided_object))
		{	
			variable_instance_set(_id, remainder_y, _move_count_remaining);
			collided_object_y = collided_object;
			break;
		}
		else {
			// In that case, move_once is added to the X coordinate of the character.
			_id.y += _move_once
			_move_count_remaining -= sign(_move_count_remaining);
		};
	}
	else
	{
		// In that case, move_once is added to the Y coordinate of the character.
		_id.y += _move_once
		_move_count_remaining -= sign(_move_count_remaining);
	}
};
if (collided_object_y == noone and collided_object_x == noone) {
	
}
else {
	if (collided_object_y != noone) {
		return collided_object_y;
	}
	else {
		variable_instance_set(_id, remainder_y, 0);
	}
	if (collided_object_x != noone) {
		return collided_object_x;
	}
	else {
		variable_instance_set(_id, remainder_x, 0);
	}
}
};
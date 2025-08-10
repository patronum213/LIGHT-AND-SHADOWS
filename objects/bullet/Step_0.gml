/// @description Insert description here
// You can write your code in this editor
/*
if (place_meeting(x, y, [combat_entity_parent])) {
			var _list = ds_list_create();
			var _num = instance_place_list(x, y, combat_entity_parent, _list, false);
			for (var i = 0; i < _num; ++i;)
			{
				if (!(_list[| i] == owner)) {
				do_damage(_list[| i], damage, owner)
				}
			}
			ds_list_destroy(_list);
		}
*/



//move with pixel-perfect collision checking
collision_blacklist = [];
collided_object = move_with_collision(id, x, y, vel_x, vel_y, [combat_entity_parent, game_master.collision_tilemap, collides_with_player], collision_blacklist);
while (remainder_x != 0 or remainder_y != 0) {
	if (collided_object != undefined) {
		if (collided_object != game_master.collision_tilemap 
		and !object_is_ancestor(collided_object.object_index, collides_with_player)) {
			if (object_is_ancestor(collided_object.object_index, combat_entity_parent) and collided_object != owner) 
			{
					show_debug_message("combat entity case")
					do_damage(collided_object, damage, owner);
			}
		}
		else if (collided_object == game_master.collision_tilemap) {
			show_debug_message("collides with player/tilemap case")
			instance_destroy();
		}
		array_push(collision_blacklist, collided_object);
		collided_object = move_with_collision(id, x, y, remainder_x, remainder_y, [combat_entity_parent, game_master.collision_tilemap, collides_with_player], collision_blacklist);
	}
	else {
		remainder_x = 0;
		remainder_y = 0;
	};
}

if (lifetime <= 0) {instance_destroy()} else {lifetime -= 1};

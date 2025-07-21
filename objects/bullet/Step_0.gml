/// @description Insert description here
// You can write your code in this editor
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
	
};
lifetime -= 1;
if (lifetime <= 0) {instance_destroy();};



{
//move with pixel-perfect collision checking

collided_object = move_with_collision(id, x, y, vel_x, vel_y, [combat_entity_parent, game_master.collision_tilemap, collides_with_player]);
while (remainder_x != 0 or remainder_y != 0) {
	show_debug_message(remainder_x)
	show_debug_message(remainder_y)
	show_debug_message(collided_object)
		
		
		
	if (object_is_ancestor(collided_object.object_index, combat_entity_parent) 
	or collided_object == combat_entity_parent
	) {
			show_debug_message("combat entity case")
			var _list = ds_list_create();
			var _num = instance_place_list(x, y, combat_entity_parent, _list, false);
			for (var i = 0; i < _num; ++i;)
			{
				if (!(_list[| i] == owner)) {
				do_damage(_list[| i], damage, owner)
				}
			}
			ds_list_destroy(_list);
			remainder_x = 0;
			remainder_y = 0;
	}
	else if (object_is_ancestor(collided_object.object_index, collides_with_player)
	or collided_object == game_master.collision_tilemap
	) {
			show_debug_message("collides with player/tilemap case")
			remainder_x = 0;
			remainder_y = 0;
			instance_destroy();
	}
	else {
			show_debug_message("default collision case");
			collided_object = move_with_collision(id, x, y, remainder_x, remainder_y, [combat_entity_parent, game_master.collision_tilemap, collides_with_player]);
	};
	//collision arrays, each if corrisponds to the effect of colliding with something
	//old collsion code, incorperate in to if/else statement at some point
	/*switch (collided_object)
		{
		case combat_entity_parent:
		show_debug_message("combat entity case")
			var _list = ds_list_create();
			var _num = instance_place_list(x, y, combat_entity_parent, _list, false);
			for (var i = 0; i < _num; ++i;)
			{
				if (!(_list[| i] == owner)) {
				do_damage(_list[| i], damage, owner)
				}
			}
			ds_list_destroy(_list);
			remainder_x = 0;
			remainder_y = 0;
		break;
		case game_master.collision_tilemap:
		case collides_with_player:
		show_debug_message("collides with player/tilemap case")
		remainder_x = 0;
		remainder_y = 0;
		instance_destroy();
		break;
		default:
		show_debug_message("default collision case");
			collided_object = move_with_collision(id, x, y, remainder_x, remainder_y, [combat_entity_parent, game_master.collision_tilemap, collides_with_player]);
		}*/
}
}
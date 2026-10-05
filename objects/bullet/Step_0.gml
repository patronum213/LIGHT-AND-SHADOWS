/// @description Insert description here
// You can write your code in this editor

collided_object = physics_motion(id, x, y, vel_x, vel_y, [game_master.collision_tilemap, collides_with_player]);

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




if (lifetime <= 0) {instance_destroy()} else {lifetime -= 1};

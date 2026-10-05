/// @description Insert description here
// You can write your code in this editor

collided_object = physics_motion(id, x, y, vel_x, vel_y, [game_master.collision_tilemap, collides_with_player, player]);
if (collided_object != noone and 
	(collided_object == game_master.collision_tilemap
	or object_is_ancestor(collided_object.object_index, collides_with_player)
	or collided_object.object_index == player)) {
			vel_x = 0;
			remainder_x = 0;
			vel_y = 0;
			remainder_y = 0;
			landed = true;
	}
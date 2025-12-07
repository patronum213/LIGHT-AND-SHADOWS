/// @description Insert description here
// You can write your code in this editor

collided_object = move_with_collision(id, x, y, vel_x, vel_y, [game_master.collision_tilemap, collides_with_player, player]);
while (remainder_x != 0 or remainder_y != 0) {
	collided_object = move_with_collision(id, x, y, remainder_x, remainder_y, [game_master.collision_tilemap, collides_with_player, player]);
	//collision arrays, each if corrisponds to the effect of colliding with something
	if (collided_object == game_master.collision_tilemap
		or object_is_ancestor(collided_object.object_index, collides_with_player)
		or collided_object.object_index == player) {
			vel_x = 0;
			remainder_x = 0;
			vel_y = 0;
			remainder_y = 0;
			landed = true;
		}
		
		
}
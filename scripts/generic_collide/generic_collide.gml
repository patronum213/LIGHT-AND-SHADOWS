// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function generic_collide(id){
with (id) {
collided_object = move_with_collision(id, x, y, vel_x, vel_y, [game_master.collision_tilemap, collides_with_player]);
while (remainder_x != 0 or remainder_y != 0) {
	//collision arrays, each if corrisponds to the effect of colliding with something
	switch (collided_object)
		{
		case game_master.collision_tilemap:
			if (
			check_tilemap(game_master.collision_tilemap, 1, 0) or
			check_tilemap(game_master.collision_tilemap, -1, 0)
			) {
				vel_x = 0;
				remainder_x = 0;
				show_debug_message("xcol")
			}
			if (
			check_tilemap(game_master.collision_tilemap, 0, 1) or
			check_tilemap(game_master.collision_tilemap, 0, -1)
			) {
				vel_y = 0;
				remainder_y = 0;
				show_debug_message("ycol")
			}
		break;
		case collides_with_player:
			if (
			(instance_place(x+1, y, collides_with_player) != noone) or
			(instance_place(x-1, y, collides_with_player) != noone)
			) {
				vel_x = 0;
				remainder_x = 0;
			}
			if (
			(instance_place(x, y+1, collides_with_player) != noone) or
			(instance_place(x, y-1, collides_with_player) != noone)
			) {
				vel_y = 0;
				remainder_y = 0;
			}
		break;
		default:
			collided_object = move_with_collision(id, x, y, remainder_x, remainder_y, [game_master.collision_tilemap, collides_with_player]);
		}
		collided_object = move_with_collision(id, x, y, remainder_x, remainder_y, [game_master.collision_tilemap, collides_with_player]);
		
}
}
}
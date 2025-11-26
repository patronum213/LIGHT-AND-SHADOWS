/// @description Insert description here
// You can write your code in this editor
event_inherited();
if (!global.paused) {
/*if (place_meeting(x, y, combat_entity_parent)) {
	var _list = ds_list_create();
	var _num = instance_place_list(x, y, combat_entity_parent, _list, false);
	for (var i = 0; i < _num; ++i;)
	{
		do_damage(_list[| i], 5, id, ["none"])
	}
	ds_list_destroy(_list);
};*/
//movement
{
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
			}
			if (
			check_tilemap(game_master.collision_tilemap, 0, 1) or
			check_tilemap(game_master.collision_tilemap, 0, -1)
			) {
				vel_y = 0;
				remainder_y = 0;
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
		}
}		
}
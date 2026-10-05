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
collided_object = physics_motion(id, x, y, vel_x, vel_y, [game_master.collision_tilemap, collides_with_player]);
}
/// @description Insert description here
// You can write your code in this editor
if (charge > 0) {
	light_set_position(light, x, y);
	if (place_meeting(x, y, combat_entity_parent)) {
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
	charge -= 1;
}
else {instance_destroy()};
image_blend = color

//grounding
grounded = (instance_place(x, y+2, [game_master.collision_tilemap, collides_with_player]) != noone) 
//friction
if (grounded) {
	if (!(vel_x = 0)) {vel_x -= (vel_x+_friction)* _friction} 
	else if (abs(vel_x) < friction_clamp_threshhold) {vel_x = 0}
}
//gravity
vel_y += 1

generic_collide(id);
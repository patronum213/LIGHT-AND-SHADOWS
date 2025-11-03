/// @description Insert description here
// You can write your code in this editor
light_set_position(light, x, y);
light_set_color(light, color);
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



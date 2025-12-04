/// @description Insert description here
// You can write your code in this editor
x = owner.x
y = owner.y
if (place_meeting(x, y, combat_entity_parent)) {
	var _list = ds_list_create();
	var _num = instance_place_list(x, y, combat_entity_parent, _list, false);
	for (var i = 0; i < _num; ++i;)
	{
		if (!(_list[| i] == owner)) {
		do_damage(_list[| i], damage, owner, ["grab"])
		}
	}
	ds_list_destroy(_list);
	
};
lifetime -= 1;
if (lifetime <= 0) {instance_destroy();};
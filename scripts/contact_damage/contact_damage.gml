// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function contact_damage(amount, special = ["none"]){
	if (place_meeting(x, y, combat_entity_parent)) {
	var _list = ds_list_create();
	var _num = instance_place_list(x, y, combat_entity_parent, _list, false);
	
	if (variable_instance_exists(id, "owner")) {
		for (var i = 0; i < _num; ++i;)
		{
			if (!((_list[| i] == id.owner) or 
			(variable_instance_exists(_list[| i], "owner") and _list[| i].owner == id.owner))) {
				do_damage(_list[| i], damage, owner, special)
			}
		}
	}
	else {
		for (var i = 0; i < _num; ++i;)
		{
			do_damage(_list[| i], amount, id, special)
		}
	}
	ds_list_destroy(_list);
};
}
/// @description Insert description here
// You can write your code in this editor
owner = player.id;
damage = 100;
alpha = 1;

color = make_color_hsv(20, 50, 255);
light = light_create(global.system, sp_light, 2, color, 0.5, 0, true);
light_set_position(light, x, y);
if (mouse_x > player.x) {light_set_position(light, x+50, y);};
if (mouse_x < player.x) {light_set_position(light, x-50, y);};

image_xscale = 2;
image_yscale = 2;
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

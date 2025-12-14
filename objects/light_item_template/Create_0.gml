/// @description Insert description here
// You can write your code in this editor
image_xscale = 0.1;
image_yscale = 0.1;
if (!(variable_instance_exists(id, "item_id"))) {item_id = "flashbeacon"};
item_id = "lantern"
item = get_light_item_data(item_id);
sprite_index = spr_light_lantern
my_tooltip = noone;
charge = 100;
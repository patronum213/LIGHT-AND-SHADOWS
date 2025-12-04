/// @description Insert description here
// You can write your code in this editor
if (!(variable_instance_exists(id, "item_id"))) {item_id = "flashbeacon"};
item = get_light_item_data(item_id);
sprite_index = item.image;
my_tooltip = noone;
charge = 100;
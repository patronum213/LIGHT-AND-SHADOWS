/// @description Insert description here
// You can write your code in this editor
image_xscale = 0.1;
image_yscale = 0.1;
if (!(variable_instance_exists(id, "item_id"))) {item_id = "tbag"};
item = get_item_data(item_id);
sprite_index = item.image;
my_tooltip = noone;

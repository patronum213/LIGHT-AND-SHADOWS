/// @description Insert description here
// You can write your code in this editor
image_xscale = 0.1;
image_yscale = 0.1;
depth = parent.depth - 1
if !(variable_instance_exists(id, "item")) {
	show_error("inventory item with no assigned item: " + id, false)
	item = get_item_data("no_item")
};
my_tooltip = noone
sprite_index = item.image
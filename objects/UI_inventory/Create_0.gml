/// @description Insert description here
// You can write your code in this editor
children = [];
if !(variable_instance_exists(id, "my_inventory")) {
	show_error("my_inventory object created with no my_inventory: " + id, true)
	my_inventory = [];
};
for (var i = 0; i < array_length(my_inventory); i += 1) {
			var _item = my_inventory[i]
			var item_object = instance_create_layer(x+400*i-700*floor(y/7), y + 50*floor(y/7), "UI", UI_inventory_item, 
			{item: get_item_data(_item), number: i, parent: id});
			array_push(children, item_object);
		}
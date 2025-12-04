/// @description Insert description here
// You can write your code in this editor
if (item_holding != "no_item") {
	instance_create_layer(x, y, "Instances", item, {item_id: item_holding});
}
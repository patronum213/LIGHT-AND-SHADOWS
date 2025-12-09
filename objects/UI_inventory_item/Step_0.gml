/// @description Insert description here
// You can write your code in this editor
x = parent.x + 70*number-370*floor(number/7)
y = parent.y + 50*floor(number/7)
if (position_meeting(mouse_x, mouse_y, id)) {
	if !(instance_exists(my_tooltip)) {
		my_tooltip = instance_create_layer(mouse_x + 20, mouse_y + 20,"UI", UI_item_tooltip, {title: item.name, desc: item.tooltip, flavor: "waaa"});
	}
}
else {if (instance_exists(my_tooltip)) {instance_destroy(my_tooltip)}}
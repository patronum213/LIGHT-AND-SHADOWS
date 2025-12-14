/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if (instance_place(x, y, player)) {
	global.enemies_in_queue = array_concat(global.enemies_in_room, global.enemies_in_queue);
	global.enemies_in_room = [];
	global.prev_room = previous;
	global.entry_point = entry_point;
	room_restart();
};



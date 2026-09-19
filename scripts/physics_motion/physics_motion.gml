function physics_motion(_id, x, y, vel_x_dirty, vel_y_dirty, colliding_objects = [all]) {
// the fuction moves pixel by pixel along the vector angle by normalizing the x/y values by the largest one
// it then moves both x and y in each step the normalized x/y step increments
// if it encounters a tilemap or colliding hitbox at any time, it ends the fuction and returns the object or tilemap
// this fuction is for physics motion only, meaning only things that have physics collision with eachother
// it should not be used for any other collision detection 
// this including objects that have physics-related effect as long as they arn't actual physics objects
var vel_x = round(vel_x_dirty);
var vel_y = round(vel_y_dirty);
if (vel_x == 0 and vel_y == 0) {return instance_place(x, y, colliding_objects)};

var x_move_step = normalize_vector_components(vel_x, vel_y)[0];
var y_move_step = normalize_vector_components(vel_x, vel_y)[1];

var move_count = 0; 
if (abs(vel_x) > abs(vel_y)) {
	move_count = vel_x/x_move_step;
}
else {
	move_count = vel_y/y_move_step;
}
var step_number = 0;
repeat (move_count) {
	step_number += 1
	/*show_debug_message("tick")
	show_debug_message(y)
	show_debug_message(instance_place(x - x_move_step, y - y_move_step, colliding_objects))
	show_debug_message(instance_place(x + x_move_step, y + y_move_step, colliding_objects))
	*/if (place_meeting(x + x_move_step*step_number, y + y_move_step*step_number, colliding_objects)) {
		if (place_meeting(x + x_move_step*step_number, y, colliding_objects)) {_id.vel_x = 0}
		if (place_meeting(x, y + y_move_step*step_number, colliding_objects)) {_id.vel_y = 0}
		return instance_place(x + x_move_step*step_number, y + y_move_step*step_number, colliding_objects)
	}
	else {//no collision
		_id.x += x_move_step;
		_id.y += y_move_step;
	}	
};
return noone;
};
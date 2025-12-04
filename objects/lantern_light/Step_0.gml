/// @description Insert description here
// You can write your code in this editor
if (player.motion_state ==  "walking") {
	light_set_position(light, x+(sin(light_wobble_var)*wobble_intensity), y);
	light_wobble_var += 0.25
}
else {light_set_position(light, x, y);}
event_inherited()



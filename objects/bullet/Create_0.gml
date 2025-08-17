/// @description Insert description here
// You can write your code in this editor
lifetime = 1000
if !(variable_instance_exists(id, "owner")) {show_error("no owner passed to instance " + id, true)};
if !(variable_instance_exists(id, "damage")) {damage = 0;};
if !(variable_instance_exists(id, "vel_x")) {vel_x = 0;};
if !(variable_instance_exists(id, "vel_y")) {vel_y = 0;};
remainder_x = 0;
remainder_y = 0;

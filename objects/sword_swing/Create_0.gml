/// @description Insert description here
// You can write your code in this editor
lifetime = 10
if !(variable_instance_exists(id, "owner")) {show_error("no owner passed to instance" + id, true)};
if !(variable_instance_exists(id, "damage")) {damage = 0;};

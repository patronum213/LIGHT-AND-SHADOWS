/// @description Insert description here
// You can write your code in this editor
if !(variable_instance_exists(id, "owner")) {show_error("no owner passed to instance" + id, true)};
if !(variable_instance_exists(id, "damage")) {damage = 0;};
if !(variable_instance_exists(id, "lifetime")) {lifetime = 10;};

image_xscale = 1;
image_yscale = 1;

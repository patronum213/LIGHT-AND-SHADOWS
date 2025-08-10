/// @description Insert description here
// You can write your code in this editor
if (my_health <= 0) {instance_destroy();}
if (iframes > 0) {damagable = false; iframes -=1;}
else {damagable = true;}
array_foreach(effects, function (_item, _index) {
	if (_item[1] > 0) {_item[1] -= 1}
	else if (_item[1] <= 0) {array_delete(effects, _index, 1)}
})
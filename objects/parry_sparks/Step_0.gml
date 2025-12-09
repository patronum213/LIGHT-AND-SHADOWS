/// @description Insert description here
// You can write your code in this editor
light_set_alpha(light, alpha)
alpha -= 0.04
if (alpha <= 0) {
	light_delete(light);
	instance_destroy(id, true);
	};
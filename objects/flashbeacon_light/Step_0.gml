/// @description Insert description here
// You can write your code in this editor
light_set_alpha(light, alpha)
alpha -= 0.02
if (alpha <= 0) {instance_destroy(id, true)};


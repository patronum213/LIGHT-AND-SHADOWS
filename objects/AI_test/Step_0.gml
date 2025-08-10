/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (keyboard_check_pressed(vk_shift)) {
instance_create_layer(x, y, "Instances", sword_swing, {owner : id, damage: 10});
}

test_AI();
/// @description Insert description here
// You can write your code in this editor
///////////// v Melee AI v /////////////
/*required Create varibles:
cooldown = 0;
atk_progress = 0;
*/

var attack_distance_x = 100;
var attack_distance_y = 100;
var motion_vel = 1;//positive as a default
if (!global.paused) {
if (item_holding == "no_item") {
	//targeting
	//if (!(point_distance(x, y, player.x, player.y) < attack_distance)) {}
	//when not in range, move towards player
	if (x < (player.x-attack_distance_x)) {
		vel_x = motion_vel; unit_state = "walk"
	}
	else if (x > (player.x+attack_distance_x)) {
		vel_x = -motion_vel; unit_state = "walk"
	}
	else {vel_x = 0}
	
	if (y < (player.y-attack_distance_y)) {
		vel_y = motion_vel; unit_state = "walk"
	}
	else if (y > (player.y+attack_distance_y)) {
		vel_y = -motion_vel; unit_state = "walk"
	}
	else {vel_y = 0;}


	//attacking when able
	if (cooldown <= 0 and unit_state != "attack" and
	abs(x - player.x) <= attack_distance_x and
	abs(y - player.y) <= attack_distance_y
	) {
		
		if (choose(1,2) == 1 and !(player.inventory == [])) {
			unit_state = "grab_attack" 
			cooldown = 280;
		}
		else {
			unit_state = "basic_attack"
			cooldown = 280;
		}
	}

	if (cooldown > 0) {cooldown -=1;}
}
else {
	vel_x = flee_vels[0];
	vel_y = flee_vels[1];
	unit_state = "walk";
	if !(instance_exists(light_object)) {
		light_object = instance_create_layer(x, y,"Instances", naut_item_light, {owner: id});
	}
}
if (my_health <= 0 and item_holding != "no_item") {
	instance_create_layer(x, y, "Instances", item_template, {item_id: item_holding});
}
switch (unit_state)
{
	case "basic_attack":
		sprite_index = spr_freak_naut_attack_basic
		atk_progress += 1;
		if (atk_progress == 44) {//when to render the hitbox
			if (player.x < x) {
				image_xscale = abs(image_xscale);
				instance_create_layer(x, y, "Instances", freak_naut_attack_1, {owner : id, damage: 10})
			} else {
				image_xscale = -abs(image_xscale);
				instance_create_layer(x, y, "Instances", freak_naut_attack_1, {owner : id, damage: 10})
			}
		}
		else if (atk_progress == 47) {//when to render the hitbox
			if (player.x < x) {
				image_xscale = abs(image_xscale);
				instance_create_layer(x, y, "Instances", freak_naut_attack_2, {owner : id, damage: 10})
			} else {
				image_xscale = -abs(image_xscale);
				instance_create_layer(x, y, "Instances", freak_naut_attack_2, {owner : id, damage: 10})
			}
		}
		if (image_index >= image_number-1) {unit_state = "free"; atk_progress = 0;}
	break;
	case "grab_attack":
		sprite_index = spr_freak_naut_attack_grab
		atk_progress += 1;
		if (atk_progress == 80) {//when to render the hitbox
			flee_vels = multiplied_vector_to_target(x, y, player.x, player.y, motion_vel*-2);
			if (player.x < x) {
				image_xscale = abs(image_xscale);
				instance_create_layer(x, y, "Instances", freak_naut_attack_grab, {owner : id, damage: 10})
			} else {
				image_xscale = -abs(image_xscale);
				instance_create_layer(x, y, "Instances", freak_naut_attack_grab, {owner : id, damage: 10})
			}
		}
		if (image_index >= image_number-1) {unit_state = "free"; atk_progress = 0;}
	break;
	
	case "walk":
		sprite_index = spr_freak_naut_idle
		if (vel_x > 0) {image_xscale = -abs(image_xscale);}
		else if (vel_x < 0) {image_xscale = abs(image_xscale);}
	break;
	case "free":
	default: 
		sprite_index = spr_freak_naut_idle
		
}
}
event_inherited();

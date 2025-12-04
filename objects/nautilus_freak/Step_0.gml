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
	abs(x - player.x) < attack_distance_x and
	abs(y - player.y) < attack_distance_y
	) {
		cooldown = 100;
		if (choose(1,2) == 1) {
			unit_state = "grab_attack" 
		}
		else {unit_state = "basic_attack"}
	}

	if (cooldown > 0) {cooldown -=1;}
}
else {
	var flee_values = [cos(flee_angle), sin(flee_angle)];
	vel_x = motion_vel*flee_values[0];
	vel_y = motion_vel*flee_values[1];
	
	if !(instance_exists(light_object)) {
		light_object = instance_create_layer(x, y,"Instances", naut_item_light);
	}
}
if (my_health <= 0 and item_holding != "no_item") {
	instance_create_layer(x, y, "Instances", item_template, {item_id: item_holding});
}

switch (unit_state)
{
	case "basic_attack":
		sprite_index = spr_freak_1_atk_shield
		atk_progress += 1;
		if (atk_progress == 72) {//when to render the hitbox
			if (player.x < x) {
				instance_create_layer(x, y, "Instances", freak_naut_attack, {owner : id, damage: 10, image_xscale: -1})
				image_xscale = -abs(image_xscale);
			} else {
				instance_create_layer(x, y, "Instances", freak_naut_attack, {owner : id, damage: 10})
				image_xscale = abs(image_xscale);
			}
		}
		if (image_index >= image_number-1) {unit_state = "free"; atk_progress = 0;}
	break;
	case "grab_attack":
		sprite_index = spr_freak_1_atk_shield
		atk_progress += 1;
		if (atk_progress == 72) {//when to render the hitbox
			if (player.x < x) {
				instance_create_layer(x, y, "Instances", freak_naut_attack_grab, {owner : id, damage: 10, image_xscale: -1})
				image_xscale = -abs(image_xscale);
			} else {
				instance_create_layer(x, y, "Instances", freak_naut_attack_grab, {owner : id, damage: 10})
				image_xscale = abs(image_xscale);
			}
		}
		if (image_index >= image_number-1) {unit_state = "free"; atk_progress = 0;}
	break;
	
	case "walk":
		sprite_index = spr_freak_1_walk_shield
		if (vel_x > 0) {image_xscale = abs(image_xscale);}
		else if (vel_x < 0) {image_xscale = -abs(image_xscale);}
	break;
	case "free":
	default: 
		sprite_index = spr_freak_1_idle_shield
		
}
event_inherited();

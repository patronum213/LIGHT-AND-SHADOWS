/// @description Insert description here
// You can write your code in this editor
event_inherited();


///////////// v Melee AI v /////////////
/*required Create varibles:
cooldown = 0;
atk_progress = 0;
*/

var attack_distance = 100;//radius to start attacking the player
var motion_vel = 1;//positive as a default

//attack at range
	if (point_distance(x, y, player.x, player.y) <= attack_distance and cooldown <= 0 and atk_progress = 0) {
		cooldown = 100;
		unit_state = "attack" 
	}//lateral targeting
	 else if (unit_state != "attack") {
		if (point_distance(x, y, player.x, player.y) < attack_distance) 
		{vel_x = 0;}
		else if (x < (player.x-attack_distance)) {
			vel_x = motion_vel; unit_state = "walk"
		}
		else if (x > (player.x+attack_distance)) {
			vel_x = -motion_vel; unit_state = "walk"
		}	
		//show_debug_message(x < player.x-attack_distance)
	}
	//gravity
	if (instance_place(x, y+1, [game_master.collision_tilemap, collides_with_player]) = noone) 
	{vel_y+=1} else {vel_y=0}
	
if (cooldown > 0) {cooldown -=1;}

switch (unit_state)
{
	case "idle":
	if (shielded) {
			if (sprite_index != spr_freak_1_idle_shield) {
				sprite_index = spr_freak_1_idle_shield
			}
		}
		else {
			if (sprite_index != spr_freak_1_idle_no_shield) {
				sprite_index = spr_freak_1_idle_no_shield
			}
		}
	break;
	case "attack":
		atk_progress += 1;
		if (atk_progress == 55) {
			if (player.x < x) {
				instance_create_layer(x, y, "Instances", freak_1_attack, {owner : id, damage: 10, image_xscale: -1})
				image_xscale = -abs(image_xscale);
			} else {
				instance_create_layer(x, y, "Instances", freak_1_attack, {owner : id, damage: 10})
				image_xscale = abs(image_xscale);
			}
			
		}
		if (image_index >= image_number-1) {unit_state = "free"; atk_progress = 0;}
		
		if (shielded) {
			if (sprite_index != spr_freak_1_atk_shield) {
				sprite_index = spr_freak_1_atk_shield
			}
		}
		else {
			if (sprite_index != spr_freak_1_atk_no_shield) {
				sprite_index = spr_freak_1_atk_no_shield
			}
		}
	break;
	case "walk":
		if (shielded) {
			if (sprite_index != spr_freak_1_walk_shield) {
				sprite_index = spr_freak_1_walk_shield
			}
		}
		else {
			if (sprite_index != spr_freak_1_walk_no_shield) {
				sprite_index = spr_freak_1_walk_no_shield
			}
		}
		if (vel_x > 0) {image_xscale = abs(image_xscale);}
		else if (vel_x < 0) {image_xscale = -abs(image_xscale);}
	break;
	case "free":
	default: 
		sprite_index = spr_freak_1_idle_shield
		
}

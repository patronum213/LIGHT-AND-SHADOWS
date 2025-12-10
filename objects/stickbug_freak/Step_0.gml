/// @description Insert description here
// You can write your code in this editor
///////////// v Melee AI v /////////////
/*required Create varibles:
cooldown = 0;
atk_progress = 0;
*/

var attack_distance_x = 1000;
var attack_distance_y = 1000;
var motion_vel = 1;//positive as a default
if (!global.paused) {
	

switch (unit_state)
{
	case "hang":
		sprite_index = spr_freak_stickbug_hang;
		if (cooldown > 0) {cooldown -=1;}
		if (cooldown <= 0 and
			abs(x - player.x) <= attack_distance_x and
			abs(y - player.y) <= attack_distance_y
		) {
				sprite_index = spr_freak_stickbug_shoot_ceiling;
				cooldown = 50;
				grapple_object = instance_create_layer(x, y, "Instances", stickbug_grapple, {owner: id, target_angle: radtodeg(arctan2((player.y-y),(player.x-x)))});
		}
		if (grapple_object != noone and grapple_object.landed) {
			var to_target_vectors = multiplied_vector_to_target(x, y, grapple_object.x, grapple_object.y, grapple_retract_speed);
			vel_x = to_target_vectors[0];
			vel_y = to_target_vectors[1];
			attack_object = instance_create_layer(x, y, "Instances", freak_stickbug_attack, {owner: id, damage: 20});
			unit_state = "grapple_attack";
		}
	break;
	case "grapple_attack":
		sprite_index = spr_freak_stickbug_fly;
		if (instance_place(x, y, player)or 
			check_tilemap(game_master.collision_tilemap, 1, 0) or
			check_tilemap(game_master.collision_tilemap, -1, 0) or
			check_tilemap(game_master.collision_tilemap, 0, 1) or
			check_tilemap(game_master.collision_tilemap, 0, -1)) {//when we hit something
			instance_destroy(grapple_object);
			grapple_object = noone;
			vel_x = 0;
			vel_y = 0;
			instance_destroy(attack_object);
			attack_object = noone;
			unit_state = "stunned";//stop our attack
		}
	break;
	case "stunned":
		sprite_index = spr_freak_stickbug_stunned;
		stun_timer += 1;
		if (stun_timer = 80) {//get up and escape
			sprite_index = spr_freak_stickbug_shoot_floor;
			stun_timer = 0;
			grapple_object = instance_create_layer(x, y, "Instances", stickbug_grapple, {owner: id, target_angle: -random(180)});
		}
		if (grapple_object != noone and grapple_object.landed) {
			var to_target_vectors = multiplied_vector_to_target(x, y, grapple_object.x, grapple_object.y, grapple_retract_speed);
			vel_x = to_target_vectors[0];
			vel_y = to_target_vectors[1];
			unit_state = "escaping";
			break;
		}
		
		
	break;
	case "escaping":
		sprite_index = spr_freak_stickbug_fly;
		if (
			check_tilemap(game_master.collision_tilemap, 1, 0) or
			check_tilemap(game_master.collision_tilemap, -1, 0) or
			check_tilemap(game_master.collision_tilemap, 0, 1) or
			check_tilemap(game_master.collision_tilemap, 0, -1)
			) {
			instance_destroy(grapple_object);
			vel_x = 0;
			vel_y = 0;
			grapple_object = noone;
			unit_state = "hang";
			}
		
	break;
	case "free":
	default: 
		
}
}
event_inherited();

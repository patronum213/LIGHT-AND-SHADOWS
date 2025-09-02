/// @description Insert description here
// You can write your code in this editor
event_inherited();


///////////// v Melee AI v /////////////
/*required Create varibles:
cooldown = 0;
*/

var attack_distance = 100;//radius to start attacking the player
var motion_vel = 1;//positive as a default

//firing at range
	if (point_distance(x, y, player.x, player.y) <= attack_distance and cooldown <= 0) {
		if (player.x < x) {
			instance_create_layer(x, y, "Instances", freak_1_attack, {owner : id, damage: 10, image_xscale: -1})
		} else {
			instance_create_layer(x, y, "Instances", freak_1_attack, {owner : id, damage: 10})
		}
		cooldown = 50;
	}
		
		
	
	//lateral targeting
	if (point_distance(x, y, player.x, player.y) < attack_distance) 
	{vel_x = 0;}
	else if (x < player.x-attack_distance) {vel_x = motion_vel}
	else if (x > player.x+attack_distance) {vel_x = -motion_vel}
	//gravity
	if (instance_place(x, y+1, [game_master.collision_tilemap, collides_with_player]) = noone) 
	{vel_y+=1} else {vel_y=0}
	
	
cooldown -=1;


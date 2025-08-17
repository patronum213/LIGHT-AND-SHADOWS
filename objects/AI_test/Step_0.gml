/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (keyboard_check_pressed(vk_shift)) {
instance_create_layer(x, y, "Instances", evil_sword_swing, {owner : id, damage: 10});
}



///////////// v Shooter AI v /////////////
/*required Create varibles:
cooldown = 0;
*/

var range = 300;//radius
var shooting_cooldown = 50;
var comfort_distance = [200, 200];//ring of comfort, minimum maxamum
var motion_vel = 1;//positive as a default

//firing at range
	if (point_distance(x, y, player.x, player.y) <= range and cooldown <= 0) {
		var vels = multiplied_vector_to_target(x, y, player.x, player.y, 10)
		instance_create_layer(x, y, "Instances", bullet, {owner : id, damage: 10, vel_x: vels[0], vel_y: vels[1]})
		cooldown = 50;
	}
		
		
	
	//lateral targeting
	if (point_distance(x, y, player.x, player.y) > comfort_distance[0] and 
	point_distance(x, y, player.x, player.y) < comfort_distance[1]) 
	{vel_x = 0;}
	else if (x < player.x-200) {vel_x = motion_vel}
	else if (x > player.x+200) {vel_x = -motion_vel}
	//gravity
	if (instance_place(x, y+1, [game_master.collision_tilemap, collides_with_player]) = noone) 
	{vel_y+=1} else {vel_y=0}
	
	
cooldown -=1;


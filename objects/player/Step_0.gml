//innitalize and correct varibles
speed = 0;
hspeed = 0;
vspeed = 0;
gravity = 0;
on_wall = false;


if (!in_dialouge) {
/*------------------------*/
/*     regular motion     */
/*------------------------*/
{
	pinput_x = 0;
	//first get the horizontal velocity the player is trying to achieve
	if (keyboard_check(vk_left)) {pinput_x -= 5;};
	if (keyboard_check(vk_right)) {pinput_x += 5;};
	if ((keyboard_check(vk_right) or keyboard_check(vk_left)) and grounded) {motion_state = "walking";}
	//jumps are checked seporately
	if (keyboard_check_pressed(vk_space) and grounded and can_jump) {
		if (abs(vel_y) < 20) {vel_y -= 20;}
		motion_state = "jumping";
	}
	
	
	
}
/*------------------------*/
/*       abilities        */
/*------------------------*/
{
	////////////////abilities
		//double jump
		if (grounded) {airjump_ready = true}
		if (keyboard_check_pressed(vk_space) and (!grounded) and airjump_ready) {
			vel_y = -20;
			airjump_ready = false
		}
		//wall jump 
			if (keyboard_check_pressed(vk_space) and on_wall) {
				if (image_xscale < 0 and !keyboard_check(vk_right)) {
					if (keyboard_check(vk_left)) {vel_y -= 18; vel_x -=28}
					else {vel_y -= 15; vel_x -=20}; 
				}
				if (image_xscale > 0 and !keyboard_check(vk_left)) {
					if (keyboard_check(vk_right)) {vel_y -= 18; vel_x +=28}
					else {vel_y -= 15; vel_x +=20};
				}
			}
		//dashing 
		if (soul_amount > 0 and keyboard_check_pressed(vk_shift) and dashtank >= 30) {
			if (keyboard_check(vk_left)) {vel_x -= 100}
			if (keyboard_check(vk_right)) {vel_x += 100}
			dashtank -= 30;
			soul_amount -= 4;
			anamation_state = "dashing";
		}
		if (dashtank < 30*dashmax) {dashtank += 1};
	

}
/*------------------------*/
/*         combat         */
/*------------------------*/
{
	
	if (mouse_check_button_pressed(mb_left) and array_contains(inventory, "test item")) {
		attack = instance_create_layer(x, y, "Instances", sword_swing, {owner : id, damage: 50});
	};
	if (mouse_check_button_pressed(mb_right)) {
		attack = instance_create_layer(x, y, "Instances", bullet, {owner : id, damage: 50, vel_x: 1, vel_y: 0});
	};
	if (iframes > 0) {damagable = false; iframes -=1;}
	else {damagable = true;}
	//show_debug_message(my_health);
	array_foreach(effects, function (_item, _index) {
		if (_item[1] > 0) {_item[1] -= 1}
		else if (_item[1] <= 0) {array_delete(effects, _index, 1)}
	})

	if (my_health <= 0) {x = xstart; y = ystart;my_health = max_health;show_debug_message("player died!")};
}
/*------------------------*/
/*       inventory        */
/*------------------------*/
{
	if (keyboard_check_pressed(vk_tab)) {
		if (inventory_open == false) {
		inventory_open = true;
		};
	};
}
/*------------------------*/
/*        physics         */
/*------------------------*/
{
grounded = (instance_place(x, y+1, [game_master.collision_tilemap, collides_with_player]) != noone) 

//gravtiy
if (grounded) {_grav = 0} 
else if (motion_state  == "dashing") {_grav = 0; vel_y = 0;}
else {_grav = 1}

_grav *= grav_direction

vel_y += _grav;

//friction
if (!(vel_x = 0)) {vel_x -= (vel_x+_friction)* _friction} //friction should be the multiplicative coefficent here
else if (abs(vel_x) < friction_clamp_threshhold) {vel_x = 0}

//player control
if (can_walk) {
		if (abs(vel_x) < 5) {vel_x += pinput_x*walkspeed_mult;}
	};


}
/*------------------------*/
/*         motion!        */
/*------------------------*/

{
//move with pixel-perfect collision checking
collided_object = move_with_collision(id, x, y, vel_x, vel_y, [game_master.collision_tilemap, collides_with_player]);
while (remainder_x != 0 or remainder_y != 0) {
	//collision arrays, each if corrisponds to the effect of colliding with something
	switch (collided_object)
		{
		case game_master.collision_tilemap:
			if (
			check_tilemap(game_master.collision_tilemap, 1, 0) or
			check_tilemap(game_master.collision_tilemap, -1, 0)
			) {
				vel_x = 0;
				remainder_x = 0;
				show_debug_message("xcol")
			}
			if (
			check_tilemap(game_master.collision_tilemap, 0, 1) or
			check_tilemap(game_master.collision_tilemap, 0, -1)
			) {
				vel_y = 0;
				remainder_y = 0;
				show_debug_message("ycol")
			}
		break;
		case collides_with_player:
			if (
			(instance_place(x+1, y, collides_with_player) != noone) or
			(instance_place(x-1, y, collides_with_player) != noone)
			) {
				vel_x = 0;
				remainder_x = 0;
				//show_debug_message("xcol")
			}
			if (
			(instance_place(x, y+1, collides_with_player) != noone) or
			(instance_place(x, y-1, collides_with_player) != noone)
			) {
				vel_y = 0;
				remainder_y = 0;
				//show_debug_message("ycol")
			}
		break;
		default:
			collided_object = move_with_collision(id, x, y, remainder_x, remainder_y, [game_master.collision_tilemap, collides_with_player]);
		}
		show_debug_message(remainder_y)
		
}
}

if (keyboard_check_pressed((ord("T")))) {x = mouse_x; y = mouse_y};//dev hax
}
/*------------------------*/
/*     Motion States      */
/*------------------------*/
{
	if (prev_motion_state == motion_state) {ticks_since_change += 1}
else {ticks_since_change = 0}
switch (motion_state)
{
	case "jumping":
		anamation_state = "jumping";
		if (ticks_since_change >= 2 and !grounded) {motion_state = "in_air";}
	break;
	case "in_air":
		anamation_state = "vault";
		if (grounded) {motion_state = "free"}
		if (vel_y >= 1) {anamation_state = "fall";}
	break;
	case "dashing":
		anamation_state = "dashing"
		if (abs(vel_x) <= 100) {motion_state = "free";}
	break;
	case "walking":
		anamation_state = "walking"
		if (abs(vel_x) < 1) {motion_state = "free";}
		if (abs(vel_y) > 0) {motion_state = "jumping";}
	break;
	default:
	show_debug_message("hit default motion state with case: " + motion_state)
	case "free":
		anamation_state = "free";
		if (abs(vel_x) >= 1) {motion_state = "walking"}
		if (!grounded) {anamation_state = "in_air";}
		
}
prev_motion_state = motion_state;
}
/*------------------------*/
/*    Anamation States    */
/*------------------------*/
{
switch (anamation_state)
{
	case "jumping":
		sprite_index = spr_moon_jump;
		if (image_index >= 2) {anamation_state = "vault";}
	break;
	case "vault":
		sprite_index = spr_moon_vault;
	break;
	case "fall":
		sprite_index = spr_moon_fall;
	break;
	case "dashing":
		sprite_index = spr_moon_dash;
	break;
	case "walking":
		sprite_index = spr_moon_walk;
		
		if (vel_x > 0) {image_xscale = abs(image_xscale);}
		else if (vel_x < 0) {image_xscale = -abs(image_xscale);}
	break;
	case "free":
	default: 
		sprite_index = spr_moon_idle
		
}
}






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
	
//parrying 
	if (parry_cooldown > 0) {parry_cooldown -= 1};
	if (parry_state > 0) {parry_state -= 1};
	
function parry(dealer) {
	parry_state = 0;
	parry_cooldown = 50;
	show_debug_message("parry!")
	sparkle = instance_create_layer(x, y, "Instances", parry_sparks);
	if (!grounded) {
	var _recoil = multiplied_vector_to_target(dealer.x,dealer.y, x, y, [30, 50]);
	}
	else {var _recoil = multiplied_vector_to_target(dealer.x,dealer.y, x, y, [30, 0]);}
	show_debug_message(_recoil[0])
	show_debug_message(_recoil[1])
	vel_x += _recoil[0]
	vel_y += _recoil[1]
	
}
function on_damage(dealer) {
	if (light == "tubelight") {
		tubelight_broken = true;
	};
};
//end
	if (mouse_check_button_pressed(mb_left)) {
		if (mouse_x < x) { 
			attack = instance_create_layer(x, y, "Instances", sword_swing, {owner : id, damage: 50, image_xscale : -1});
		}
		else {
			attack = instance_create_layer(x, y, "Instances", sword_swing, {owner : id, damage: 50});
		}
		parry_state = 5;
	};
	if (mouse_check_button_pressed(mb_right)and array_contains(inventory, "test item")) {
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
		
		if !(instance_exists(inventory_UI_object)) {
			inventory_UI_object = instance_create_layer(game_master.camera.x + 80, game_master.camera.y + 80,"UI", UI_inventory, {my_inventory: inventory});
		}
		else if (instance_exists(inventory_UI_object)) {
			instance_destroy(inventory_UI_object, true)
		}
		inventory_open = !inventory_open
		};
	
	
	
}
/*------------------------*/
/*         lights         */
/*------------------------*/
{
	switch (light) {
		case "flashlight":
			if (mouse_check_button_pressed(mb_right)) {
				if !(instance_exists(light_object)) {
					light_object = instance_create_layer(x, y,"Instances", flashlight_light);
				}
				else if (instance_exists(light_object)) {
					instance_destroy(light_object)
				}
				light_on = !light_on
			};
			if (light_on) {
				light_charge -= 1;
				if (light_charge <= 0) {
					instance_destroy(light_object);
					light_on = false;
				}
			}
		break;
		case "lantern":
			if (mouse_check_button_pressed(mb_right)) {
				if !(instance_exists(light_object)) {
					light_object = instance_create_layer(x, y,"Instances", lantern_light);
				}
				else if (instance_exists(light_object)) {
					instance_destroy(light_object)
				}
				light_on = !light_on
			};
			if (light_on) {
				light_charge -= 1;
				if (light_charge <= 0) {
					instance_destroy(light_object);
					light_on = false;
				}
			}
		break;
		case "flashbeacon":
			if (mouse_check_button_pressed(mb_right) and light_charge > 0) {
				light_object = instance_create_layer(x, y,"Instances", flashbeacon_light);
				light_charge -= 100;
			};
		break;
		case "glowsticks":
				if (mouse_check_button_pressed(mb_right) and keyboard_check(vk_shift)) {
					if (light_charge > 0) {
						glowsticks_held += 1;
						light_charge -= 10;
						if (glowsticks_held == 1) {glowstick_color = make_color_hsv(random_range(0, 255), 200, 255)}
						else {glowstick_color = make_color_hsv(0, 0, 255)}
					}
			}
			
			else if (mouse_check_button_pressed(mb_right) and glowsticks_held >= 1) {
				var vels = multiplied_vector_to_target(x, y, mouse_x, mouse_y, 20)
				if (glowsticks_held == 1) {
				instance_create_layer(x, y, "Instances", glowstick_thrown, {vel_x: vels[0], vel_y: vels[1], color: glowstick_color})
				}
				else {
				instance_create_layer(x, y, "Instances", glowstick_thrown, {vel_x: vels[0], vel_y: vels[1], color: make_color_hsv(random_range(0, 255), 200, 255)})
				}
				glowsticks_held -= 1
				if (glowsticks_held == 1) {glowstick_color = make_color_hsv(random_range(0, 255), 200, 255)}
			};
			if (glowsticks_held >= 1) {
				if (!instance_exists(light_object)) {
				light_object = instance_create_layer(x, y,"Instances", glowsticks_light, {glowsticks: glowsticks_held, color: glowstick_color});
				}
				variable_instance_set(light_object, "color", glowstick_color)
				light_on = true;
			}
			else {
				instance_destroy(light_object)
				light_on = false;
				} 
		break;
		case "tubelight":
			if (!tubelight_broken) {
				if (mouse_check_button_pressed(mb_right)) {
					if !(instance_exists(light_object)) {
						light_object = instance_create_layer(x, y,"Instances", tubelight_light);
					}
					else if (instance_exists(light_object)) {
						instance_destroy(light_object)
					}
					light_on = !light_on
				};
				if (light_on) {
					light_charge -= 1;
					if (light_charge <= 0) {
						instance_destroy(light_object);
						light_on = false;
					}
				}
			}
			else {
				if (instance_exists(light_object)) {
						instance_destroy(light_object)
					}
				if (mouse_check_button_pressed(mb_right)) {
					var vels = multiplied_vector_to_target(x, y, mouse_x, mouse_y, 20)
					instance_create_layer(x, y, "Instances", tubelight_thrown, {vel_x: vels[0], vel_y: vels[1]})
					light = "no_light";
				}
			};
			
		break;
		default:
			show_error("invalid light: " + light, false)
		case "no_light":
			if (instance_exists(light_object)) {
				instance_destroy(light_object)
			}
			light_on = false;
		break;
		
	}


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
		collided_object = move_with_collision(id, x, y, remainder_x, remainder_y, [game_master.collision_tilemap, collides_with_player]);
		//if (collided_object == noone) {remainder_x = 0; remainder_y = 0;}
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
		sprite_index = spr_player_jump;
		if (image_index >= 2) {anamation_state = "vault";}
	break;
	case "vault":
		sprite_index = spr_player_vault;
	break;
	case "fall":
		sprite_index = spr_player_fall;
	break;
	case "dashing":
		sprite_index = spr_moon_dash;
	break;
	case "walking":
		sprite_index = spr_player_run;
		
		if (vel_x > 0) {image_xscale = -abs(image_xscale);}
		else if (vel_x < 0) {image_xscale = abs(image_xscale);}
	break;
	case "free":
	default: 
		sprite_index = spr_player_idle
		
}
}






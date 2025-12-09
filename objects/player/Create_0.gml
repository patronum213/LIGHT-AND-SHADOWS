/// @description Insert description here
// You can write your code in this editor

testing_light_index_number = 1;

anamation_state = "start";
paused = false;
in_dialogue = false;

my_health = 10;

inventory = ["test_flower"];
inventory_open = false;
inventory_UI_object = noone

light = "lantern" 
light_charge = 5000;
light_on = false;

glowsticks_held = 0;
glowstick_tick_down = 0;
glowstick_color = make_color_hsv(0,0,255)
light_object = noone

tubelight_broken = false;

sign_color = "red";

dev_mode = false;

//soul
soul_amount = 100;
//body
integrity = 100

grappling = false;

dashtank = 60;//two dashes to start, 30 each
dashmax = 2;//a maxamum of two

airjump_ready = true;//double jump

bomb_cooldown = 0;






//physics properties
vel_x = 0;
vel_y = 0;

grounded = true;
_grav = 1;
grav_direction = 1;
_friction = 0.2;
friction_clamp_threshhold = 1;
motion_state = "free";
prev_motion_state = "free";
ticks_since_change = 0;

can_walk = true;
can_jump = true;

walkspeed = 5;
jumpforce = 20;

//temp var initalizations
on_wall = false;
flying = false;

//for motion
remainder_x = 0;
remainder_y = 0;



///multipliers
walkspeed_mult = 1;
jumpforce_mult = 1;
damage_mult = 1;
grav_mult = 1;

keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("W"), vk_up);

if (!variable_instance_exists(id, "max_health")) {max_health = 100}
if (!variable_instance_exists(id, "effects_immune")) {effects_immune = [];}
iframes = 0;
my_health = max_health;
effects = [];
damagable = true;

parry_state = 0;

parry_cooldown = 0;

darkness_acclimation = 0;



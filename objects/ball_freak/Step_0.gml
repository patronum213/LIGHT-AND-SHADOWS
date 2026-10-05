/// @description Insert description here
// You can write your code in this editor
///////////// v Melee AI v /////////////
/*required Create varibles:
cooldown = 0;
atk_progress = 0;
*/

if (!global.paused) {
//movement
{
	collided_object = physics_motion(id, x, y, vel_x, vel_y, [game_master.collision_tilemap, collides_with_player]);
	
}		
}

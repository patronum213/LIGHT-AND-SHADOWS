// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_vector_to_target(x, y, tx, ty){

bullet_speed = 5;

vx = (tx - x); // = 256
vy = (ty - y); // = -342

len = sqrt(sqr(vx) + sqr(vy)); // = sqrt(65536 + 116964) = 427.2

vx = vx / len; // = 0.6
vy = vy / len; // = 0.8

speed_x = vx * bullet_speed; // = 3
speed_y = vy * bullet_speed; // = 4

}
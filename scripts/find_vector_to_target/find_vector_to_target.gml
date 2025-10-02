// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function unit_vector_to_target(x, y, tx, ty){
if ((ty-y) = 0) {return [1, 0];}
else if ((tx-x) = 0) {return [0, 1];}
var A = arctan2((tx-x),(ty-y))
var vect_x = sin(A);
var vect_y = cos(A);//proof checked by me
return [vect_x, vect_y];//this better be right
}

function multiplied_vector_to_target(x, y, tx, ty, mult){
if ((ty-y) = 0) {return [1, 0];}
else if ((tx-x) = 0) {return [0, 1];}
var A = arctan2((tx-x),(ty-y))
var vect_x = sin(A);
var vect_y = cos(A);//proof checked by me
if (typeof(mult) == "array") {
	var final_x = vect_x * mult[0]
	var final_y = vect_y * mult[1]
}
else {
	var final_x = vect_x * mult
	var final_y = vect_y * mult
}
return [final_x, final_y]
}
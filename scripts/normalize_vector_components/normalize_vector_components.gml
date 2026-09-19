// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function normalize_vector_components(comp_1, comp_2){
	if (abs(comp_1) > abs(comp_2)) {
			return [sign(comp_1), comp_2/abs(comp_1)]
	}
	else {
		return [comp_1/abs(comp_2), sign(comp_2)]
	}

}
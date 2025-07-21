// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function do_damage(taker, amount, dealer = id, special = ["none"]) {
	if (taker.damagable or array_contains(special, "ignore iframes")) {
		show_debug_message(taker.damagable);
		//show_debug_message(variable_instance_get(taker, "my_health"));
		with (taker) {
			show_debug_message("pre chance")
			show_debug_message(my_health)
			my_health = my_health - amount
			show_debug_message("post chance")
			show_debug_message(my_health)
			iframes = 10;
			show_debug_message("iframes")
			show_debug_message(iframes)
			show_debug_message("hit registered on entity: ")
			show_debug_message(taker)
		};
		//show_debug_message(variable_instance_get(taker, "iframes"))
		//referces for effects: first item in array should be declairative "effect", 
		//2nd should be the actual effect, 3rd should be the duration
		//any other arguments like strenght can be added from there on on a case by case basis
		if (special != ["none"]) {
		array_foreach(special, function (_item, _index) {
			if (is_array(_item)) {//for specials that are passed as arrays
			switch(_item[0]) {
				case "effect":
					variable_instance_set(taker, effects, array_push(effects, array_shift(_item)));
				break;
				default:
				show_debug_message("unknown damage special type: " + _item[0])
				break;
			}
			}
			else {
			switch(_item) {//for specials that are single argument
				default:
				show_debug_message("unknown damage special type: " + _item)
				break;
			}
			}
		});
		}
	
	}
	
}
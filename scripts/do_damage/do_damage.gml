// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function do_damage(taker, amount, dealer = id, special = ["none"]) {
	if  (taker.object_index == player and taker.parry_state > 0) {
		with taker {
			parry(dealer)
		}
		return;
	}
	if (taker.damagable or array_contains(special, "ignore iframes")) {
		show_debug_message(taker.damagable);
		//show_debug_message(variable_instance_get(taker, "my_health"));
		with (taker) {
			my_health = my_health - amount
			iframes = 10;
			show_debug_message("hit registered on entity: ")
			show_debug_message(id)
			if (variable_instance_exists(id, "on_damage")) {
				on_damage(dealer)
				show_debug_message("called on_damage function")
				}
		};
		//show_debug_message(variable_instance_get(taker, "iframes"))
		//referces for effects: first item in array should be declairative "effect", 
		//2nd should be the actual effect, 3rd should be the duration
		//any other arguments like strenght can be added from there on on a case by case basis
		temp_taker = taker
		temp_dealer = dealer
		if (special != ["none"]) {
		array_foreach(special, function (_item, _index) {
			if (is_array(_item)) {//for specials that are passed as arrays
			switch(_item[0]) {
				case "effect":
					variable_instance_set(temp_taker, effects, array_push(effects, array_shift(_item)));
				break;
				default:
				show_debug_message("unknown damage special type: " + _item[0])
				break;
			}
			}
			else {
			switch(_item) {//for specials that are single argument
				case "stick":
					var vector = multiplied_vector_to_target(temp_dealer.x, temp_dealer.y, temp_taker.x, temp_taker.y, 10)
					with (temp_taker) {
					vel_x += vector[0]
					vel_y += vector[1]
					}
				break;
				case "grab":
					var item_grabbed = "";
					with (temp_taker) {
						var picked_item = irandom(array_length(player.inventory-1))
						item_grabbed = player.inventory[picked_item]
						array_delete(player.inventory, picked_item, 1);
						
					}
				break;
				
				default:
				show_debug_message("unknown damage special type: " + _item)
				break;
			}
			}
		});
		}
	
	}
	
}
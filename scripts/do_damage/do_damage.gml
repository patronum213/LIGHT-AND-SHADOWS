/// @param taker The instance taking the damage
/// @param amount The amount of damage dealt
/// @param dealer The instance dealing the damage, if not set defaults to the instance running the script
/// @param special an array that contains any other attributes of the hit, ex: effects, bypasses, extra knockback, ect.
function do_damage(taker, amount, dealer = id, special = ["none"]) {
	if (!object_is_ancestor(taker, combat_entity_parent)) {
		show_error("tried to call do_damage on object (taker) without a combat_entity_parent, id:" + taker, true)
		return;
	}
	else if (!object_is_ancestor(dealer, combat_entity_parent)) {
		show_error("tried to call do_damage on object (dealer) without a combat_entity_parent, id:" + dealer, true)
		return;
	};
	if  (taker.object_index == player and taker.parry_state > 0) {
		with taker {
			parry(dealer)
		}
		return;
	}
	if (taker.damagable or array_contains(special, "ignore iframes")) {
		with (taker) {
			my_health = my_health - amount
			iframes = 10;
			show_debug_message("hit registered on entity: " + id)
			if (variable_instance_exists(id, "on_damage")) {
				on_damage(dealer)
				show_debug_message("called on_damage function")
			}
		};
		
		//specials
		//special should be an array with all special effects in it
		//a simple special effect should be a string specifying it's effect id 
		//more complex special effects, such as status effects, can be passed as arrays, where the first item is the effect id matching to the effects script
		//and subsiquent items can be diffrent properties of it, such as durration or what status effect to give.
		temp_taker = taker
		temp_dealer = dealer
		if (special != ["none"]) {
		array_foreach(special, function (_item, _index) {
			if (is_array(_item)) {//for specials that are passed as arrays
			switch(_item[0]) {
				//referces for effects: first item in array should be declairative "effect" telling us that this special is a status effect, 
				//2nd should be the actual effect, 3rd should be the duration
				//any other arguments like strenght can be added from there on on a case by case basis
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
						var picked_item = irandom(array_length(player.inventory)-1)
						item_grabbed = player.inventory[picked_item]
						array_delete(player.inventory, picked_item, 1);
					}
					with (temp_dealer) {
						item_holding = item_grabbed
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
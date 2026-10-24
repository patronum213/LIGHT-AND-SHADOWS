/// @param taker The instance taking the damage
/// @param amount The amount of damage dealt
/// @param dealer The instance dealing the damage, if not set defaults to the instance running the script
/// @param special an array that contains any other attributes of the hit, ex: effects, bypasses, extra knockback, ect.
function do_damage(taker, amount, dealer = id, special = ["none"]) {
	if (!object_is_ancestor(taker.object_index, combat_entity_parent)) {
		show_error("tried to call do_damage on object (taker) without a combat_entity_parent, id:" + taker, true)
		return;
	}
	else if (!object_is_ancestor(dealer.object_index, combat_entity_parent)) {
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
			my_health = my_health - amount;
			iframes = 10;
			show_debug_message("hit registered on entity: ")
			show_debug_message(id)
			if (variable_instance_exists(id, "on_damage")) {
				on_damage(dealer)
				show_debug_message("called on_damage function")
			}
		};
		//special should be an array with all special effects in it given to 
		//see special_effects script for documentation
		temp_taker = taker
		temp_dealer = dealer
		if (special != ["none"]) {
		array_foreach(special, function (_item, _index) {
			special_effects(_item, temp_taker, temp_dealer);
		});
		}
	
	}
	
}
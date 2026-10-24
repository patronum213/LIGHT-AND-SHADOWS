/// @description
///do_damage should feed each special effect in to special_effects indivigually
///a simple special effect should be a string specifying it's effect id 
///more complex special effects, such as status effects, can be passed as arrays, where the first item is the effect id matching to the effects script
///and subsiquent items can be diffrent properties of it, such as durration or what status effect to give.
function special_effects(effect, taker, dealer){
	if (is_array(effect)) {//for specials that are passed as arrays
			switch(effect[0]) {
				//referces for effects: first item in array should be declairative "effect" telling us that this special is a status effect, 
				//2nd should be the actual effect, 3rd should be the duration
				//any other arguments like strenght can be added from there on on a case by case basis
				case "effect":
					variable_instance_set(taker, effects, array_push(effects, array_shift(effect)));
				break;
				default:
				show_debug_message("unknown damage special type: " + effect[0])
				break;
			}
			}
			else {
			switch(effect) {//for specials that are single argument
				case "stick":
					var vector = multiplied_vector_to_target(dealer.x, dealer.y, taker.x, taker.y, 10)
					with (taker) {
					vel_x += vector[0]
					vel_y += vector[1]
					}
				break;
				case "grab":
					var item_grabbed = "";
					with (taker) {
						var picked_item = irandom(array_length(player.inventory)-1)
						item_grabbed = player.inventory[picked_item]
						array_delete(player.inventory, picked_item, 1);
					}
					with (dealer) {
						item_holding = item_grabbed
					}
				break;
				
				default:
				show_debug_message("unknown damage special type: " + effect)
				break;
			}
			}

}
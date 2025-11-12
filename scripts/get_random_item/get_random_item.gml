/// @description pick a random item from the array given or all items if none is present
/// @param items the items to choose from
/// @param exclude_player_inventory wether items the player already has should be excluded from consideration
function get_random_item(items, exclude_player_inventory = true) {
	var items_possible = items
	if (exclude_player_inventory) {
		var player_inventory = player.inventory
		for (var i = 0; i < array_length(items_possible); ++i;) {
			if (array_contains(player_inventory, items_possible[i])) {
				array_delete(items_possible, i, 1)
			}
		}
	};
	return items_possible[irandom(array_length(items_possible)-1)]
}
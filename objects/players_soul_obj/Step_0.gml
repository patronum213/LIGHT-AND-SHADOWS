/// @description Insert description here
// You can write your code in this editor

array_delete(player_last_positions, 0, 1)
array_push(player_last_positions, [player.x, player.y])

y = player_last_positions[0][1] - 50
if (player.image_xscale > 0) {
	x = player_last_positions[0][0] - 50
};
if (player.image_xscale < 0) {
	x = player_last_positions[0][0] + 50
};
/*switch (player.souls) {
	case ["form", 0]:
		draw_sprite_ext(soul, 0, x, y, 1, 1, 0, #00ff00, 1);
	break;
	case [0, "mind"]:
		draw_sprite_ext(soul, 0, x, y, 1, 1, 0, #ff0000, 1);
	break;
	default:
		draw_sprite_ext(soul, 0, x, y, 1, 1, 0, #ffffff, 1);
	break;
}*/

if (player.souls = []) {
	draw_sprite_ext(soul, 0, x, y, 1, 1, 0, #ffffff, 0);
}
else if (array_contains(player.souls, "form")) {
	draw_sprite_ext(soul, 0, x, y, 1, 1, 0, #00ff00, 1);
}
else if (array_contains(player.souls, "mind")) {
	draw_sprite_ext(soul, 0, x, y, 1, 1, 0, #ff00ff, 1);
}

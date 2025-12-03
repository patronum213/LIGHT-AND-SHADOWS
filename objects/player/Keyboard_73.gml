/// @description Insert description here
// You can write your code in this editor
//test_item = get_random_item(["test_paper", "test_clay", "test_flower"], false)
//instance_create_layer(x+100, y, "Instances", item_parent, {item_id: "test_clay"});
show_debug_message(tilemap_get_at_pixel(game_master.collision_tilemap, x, y))
data = 1;//tilemap_get_at_pixel(game_master.collision_tilemap, x, y)
tilemap_set_at_pixel(game_master.collision_tilemap, data, x+100, y)
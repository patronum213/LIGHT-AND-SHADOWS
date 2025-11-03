/// @description Insert description here
// You can write your code in this editor

ini_open("test_save")
ini_write_real("playerstats", "x", x);
ini_write_real("playerstats", "y", y);
ini_close();
show_debug_message(working_directory)
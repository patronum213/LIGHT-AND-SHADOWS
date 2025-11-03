/// @description Insert description here
// You can write your code in this editor

ini_open("test_save")
x = ini_read_real("playerstats", "x", x);
y = ini_read_real("playerstats", "y", y);

ini_close();
show_debug_message(x)
show_debug_message(y)
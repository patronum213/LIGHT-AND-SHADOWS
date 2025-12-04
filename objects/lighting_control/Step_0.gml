/// @description Insert description here
// You can write your code in this editor


darkness_intensity = max(min_brightness_pct, min(1, player.darkness_acclimation/acclimation_time)*max_brightness_pct);


light_set_ambient_color(global.system, make_color_hsv(0, 0, (darkness_intensity) * 255));
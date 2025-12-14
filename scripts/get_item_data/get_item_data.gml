// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_item_data(Item_Name){


	//ini_open("items")
	if (Item_Name == "bandaid") {
name="Bandaid"
image="spr_item_bandaid"
tooltip="restores health on pickup"
flavor="owwwwieeeee"
}
if (Item_Name == "dagger") {
name="Ritual Dagger"
image="spr_item_dagger"
tooltip="heals you on killing an enemy"
flavor="how many times"
}
if (Item_Name == "bagtrash") {
name="Trash Bag"
image="spr_item_bagtrash"
tooltip="swaps out 1 item for a random other"
flavor="stinkyyy"
}
if (Item_Name == "bagtarget") {
name="Target Bag"
image="spr_item_bagtarget"
tooltip="gives one of 5 random items"
flavor="tarjay"
}
if (Item_Name == "bagikea") {
name="Ikea Bag"
image="spr_item_bagikea"
tooltip="expands your inventory capacity by 3"
flavor="take me away to the land of sharks"
}
if (Item_Name == "bat") {
name="Wooden Baseball bat"
image="spr_item_bat"
tooltip="increases meele damage"
flavor="geologists beware!"
}
if (Item_Name == "butter") {
name="Stick of Butter"
image="spr_item_butter"
tooltip="increases all stats moderately"
flavor="I can believe it"
}
if (Item_Name == "espresso") {
name="Espresso Cup"
image="spr_item_espresso"
tooltip="increases ground spee"
flavor="you're not going to eat this raw, right?"
}
if (Item_Name == "solarpannel") {
name="Solar Panel"
image="spr_item_solarpannel"
tooltip="slightly recharges your light"
flavor="ahh yes, with all the sun here"
}
	/*Item_Data = {
		name: ini_read_string(Item_Name, "name", "no_item_name"), 
		image: asset_get_index(ini_read_string(Item_Name, "image", "test_sprite")), 
		tooltip: ini_read_string(Item_Name, "tooltip", "no_tooltip"), 
		flavor: ini_read_string(Item_Name, "flavor", "no_flavor")
	}*/
	show_debug_message(Item_Name)
	Item_Data = {
		name: name,
		image: asset_get_index(image),
		tooltip: tooltip, 
		flavor: flavor
	}
	show_debug_message("read item data")
	
	//else {show_error("could not fetch item '" + Item_Name, true)}
	ini_close()
	return Item_Data;
}

function get_light_item_data(Item_Name) {
	//ini_open("lights")
	if (Item_Name == "lantern") {
name="Lantern"
image="spr_light_lantern"
tooltip="emmits an aura of light around you"
}
if (Item_Name == "flashlight") {
name="Flashlight"
image="spr_light_flashlight"
tooltip="illuminates a beam towards your cursor"
}
if (Item_Name == "flashbeacon") {
name="Flashbeacon"
image="spr_light_flashbeacon"
tooltip="creates an extermely bright flash with a cooldown"
}
if (Item_Name == "glowsticks") {
name="Glowsticks"
image="spr_light_glowsticks"
tooltip="shift + right click to crack glowsticks, right click to throw them"
}
if (Item_Name == "neonsign") {
name="Neon Sign"
image="spr_light_neonsign"
tooltip="shift + right click to change colors; red grants a damage increase, blue decreases gravity, yellow give a speed boost, and green give passive healing"
}
if (Item_Name == "tubelight") {
name="Tube Light"
image="spr_light_tubelight"
tooltip="illuminates a large area, but breaks easily. press right click to throw the broken tube"
}
Item_Data = {
		name: name,
		image: asset_get_index(image), 
		tooltip: tooltip, 
		flavor: "fully charged",
		light_id: Item_Name
	}
	return Item_Data;
	/*
	Item_Data = {
		name: ini_read_string(Item_Name, "name", "no_item_name"),
		image: asset_get_index(ini_read_string(Item_Name, "image", "test_sprite")), 
		tooltip: ini_read_string(Item_Name, "tooltip", "no_tooltip"), 
		flavor: ini_read_string(Item_Name, "flavor", "fully charged"),
		light_id: Item_Name
	}
	show_debug_message("read item data")
	//else {show_error("could not fetch item '" + Item_Name, true)}
	ini_close()
	return Item_Data;
	/*else if (Item_Name == "no_item") {
		Item_Data = {name: "no item", light_id: "no_light", image: spr_terrain_day, tooltip: "something broke"}
	}*/
	//else {show_error("could not fetch item '" + Item_Name, true)}
};


/*
var Items_File = file_text_open_read(working_directory + "items.txt");
Item_Data = {};
	var Line = file_text_read_string(Items_File);
	while (string_pos(Item_Name + " {", Line) = 0) {
		if (file_text_eof(Items_File)) {
		show_error("could not find item named \"" + Item_Name + "\" in items", true)
		break;
		}
		file_text_readln(Items_File);
		Line = file_text_read_string(Items_File);
	}
	file_text_readln(Items_File);
	Line = file_text_read_string(Items_File);
	while (string_pos("}", Line) = 0) {
		if (string_pos("[", Line) = 0) {
			var Data_Pos = string_pos(": ", Line) + 2;
			var Value = string_copy(Line, Data_Pos, (string_length(Line)+1)-Data_Pos);
			var Key = string_copy(Line, 1, Data_Pos-3);
			Item_Data[$ Key] = Value;
		}
		else {
			/*var Array_Base = Value;
			Array_Base = string_delete(Array_Base, 1, 1);
			var Array_value = [];
			for (i=0; i<string_count(",", Array_Base); i++) {
			Array_value[i] = string_copy(Array_Base, 1, string_pos(",", Array_Base))
			show_debug_message(Array_value[i])
			string_delete(Array_Base, 1, string_pos(",", Array_Base));
			};*/
			/*
		}
		file_text_readln(Items_File);
		Line = file_text_read_string(Items_File);
	}
file_text_close(Items_File);
*/




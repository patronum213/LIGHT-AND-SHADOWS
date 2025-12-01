// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_item_data(Item_Name){


	ini_open("items")
	Item_Data = {
		name: ini_read_string(Item_Name, "name", "no_item_name"), 
		image: asset_get_index(ini_read_string(Item_Name, "image", "test_sprite")), 
		tooltip: ini_read_string(Item_Name, "tooltip", "no_tooltip")
	}
	show_debug_message("read item data")
	//else {show_error("could not fetch item '" + Item_Name, true)}
	ini_close()
	return Item_Data;
}

function get_light_item_data(Item_Name) {
	ini_open("lights")
	Item_Data = {
		name: ini_read_string(Item_Name, "name", "no_item_name"),
		image: asset_get_index(ini_read_string(Item_Name, "image", "test_sprite")), 
		tooltip: ini_read_string(Item_Name, "tooltip", "no_tooltip"),
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




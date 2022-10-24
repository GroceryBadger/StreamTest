#region DETERMINE GRID_X/Y

//Isometric grid
grid_x = floor((mouse_x / iso_width) + (mouse_y / iso_height)); //New
grid_y = floor((mouse_y / iso_height) - (mouse_x / iso_width)); //New

//Cap grid x, y
grid_x = clamp(grid_x, 0, ds_grid_width(ds_terrain_data) - 1);
grid_y = clamp(grid_y, 0, ds_grid_height(ds_terrain_data) - 1);

#endregion

#region CHANGE new_index / Change Part (Basically are we editing the floor or decoration?)

if (keyboard_check_pressed(vk_right)) {
	//Change new index (of current sprite)
	if(keyboard_check(vk_shift) == false) {
		if(new_index + 1) < sprite_get_number(current_sprite) new_index ++;
		else new_index = 0;
	}
	else {
		#region change tile part (cycle between floor/decoration)
			
		//if(current_part + 1) <= e_tile_data.decoration_index current_part++;
		//else current_part = 0;
		current_part = 0;
		current_sprite = global.cell_sprites[current_part]; //Update the current sprite
		new_index = 1; //reset image_index
			
		#endregion
	}
}

if (keyboard_check_pressed(vk_left)) {
	//Change new index (of current sprite)
	if(keyboard_check(vk_shift) == false) {
		if(new_index > 0) new_index --;
		else new_index = (sprite_get_number(current_sprite) - 1);
	}
	else {
		#region change tile part (cycle between floor/decoration)
			
		if(current_part - 1) >= 0 current_part--;
		//else current_part = e_tile_data.decoration_index;
		current_sprite = global.cell_sprites[current_part]; //Update the current sprite
		new_index = 1; //reset image_index
			
		#endregion
	}
}


#endregion
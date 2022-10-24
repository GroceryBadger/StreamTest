for(var yy = 0; yy < ds_grid_height(ds_terrain_data); yy ++){
	for(var xx = 0; xx < ds_grid_width(ds_terrain_data); xx ++){
		
		#region DRAW CELL
		
		list = ds_terrain_data[# xx, yy];
		floor_ind = list[| e_tile_data.floor_index];
		height = list[| e_tile_data.height];

		//Isometric draw x,y
		draw_x = (xx - yy) * (iso_width / 2);

		//Draw a tile for EVERY level of the cell
		for (var draw_height = 0; draw_height <= height; draw_height ++) {
			
			//If we don't want to display all heights, only draw cells up to current height
			if (display_all_heights == false && draw_height <= current_height) || (display_all_heights == true) {

				draw_y = (xx + yy) * (iso_height / 2) - (draw_height * (iso_height / 2));
			
				var rgb_value = 150 + (draw_height * 9);
				var col = make_color_rgb(rgb_value, rgb_value, rgb_value);
				draw_sprite_ext(spr_iso_floor, floor_ind, draw_x, draw_y, 1, 1, 0, col, 1);
				}
			}
		}
		
}
#endregion
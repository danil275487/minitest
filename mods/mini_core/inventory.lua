function mini_core.get_inventory_formspec(playername)
	local creative_button = ""
	if core.is_creative_enabled(playername) then
		creative_button = [[
			button[0,0;2,0.75;inventory;Inventory]
			button[2,0;2,0.75;creative;Creative]
		]]
	end
	return mini_core.formspec_wrapper([[
		size[8.25,8.25,true]
		real_coordinates[true]
		background9[0,0.75;8.25,7.5;mini_formspec_bg.png;false;12]
		bgcolor[#00000080;true]
		style_type[button;border=false;bgimg=mini_formspec_bg.png;bgimg_pressed=mini_formspec_bg_dark.png;bgimg_middle=12,12]
		listcolors[#787878ff;#505050ff]
		list[current_player;main;0.5,4;6,2;6]
		list[current_player;main;0.5,6.75;6,1;0]
		list[current_player;craft;1.75,1.25;2,1;]
		list[current_player;craft;1.75,2.50;2,1;3]
		image[4.25,1.875;1,1;mini_inv_arrow.png^[transformR270]
		list[current_player;craftpreview;5.5,1.875;1,1;]
		${creative_btn}
	]], {
		creative_btn = creative_button
	})
end

core.register_on_joinplayer(function(player)
	player:get_inventory():set_width("main", 6)
	player:get_inventory():set_size("main", 18)
	player:hud_set_hotbar_itemcount(6)
	player:set_inventory_formspec(mini_core.get_inventory_formspec(player:get_player_name()))
end)

core.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "" and fields.creative and core.is_creative_enabled(player) then
		core.show_formspec(player:get_player_name(), "mini_core:creative", mini_core.get_creative_formspec(1))
	end
end)

mini_core.load_file("creative_inv")

function get_inventory_formspec(playername)
	local creative_button = ""
	if minetest.is_creative_enabled(playername) then
		creative_button = [[
			button[0,0;1.5,0.5;inventory;Inventory]
			button[1.5,0;1.5,0.5;creative;Creative]
		]]
	return formspec_wrapper([[
		size[8.25,7.5]
		real_coordinates[true]
		list[current_player;main;0.5,3.25;6,2;6]
		list[current_player;main;0.5,6;6,1;0]
		list[current_player;craft;1.75,0.5;2,2;]
		image[4.25,1.125;1,1;mt_inv_arrow.png^[transformR270]
		list[current_player;craftpreview;5.5,1.125;1,1;]
		${creative_btn}
	]], {
		creative_btn = creative_button
	})
	end
end

minetest.register_on_joinplayer(function(player)
	player:get_inventory():set_width("main", 6)
	player:get_inventory():set_size("main", 18)
	player:hud_set_hotbar_itemcount(6)
	player:set_inventory_formspec(get_inventory_formspec(player:get_player_name()))
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "" and fields.creative and minetest.is_creative_enabled(player) then
		minetest.show_formspec(player:get_player_name(), "kl_inventory:creative", get_creative_formspec(1))
	end
end)

dofile(minetest.get_modpath('mt_inventory')..'/creative.lua')
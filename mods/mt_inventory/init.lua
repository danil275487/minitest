minetest.register_on_joinplayer(function(player)
	player:get_inventory():set_width("main", 6)
	player:get_inventory():set_size("main", 18)
	player:hud_set_hotbar_itemcount(6)
	player:set_inventory_formspec([[
		size[8.25,7.5]
		real_coordinates[true]
		list[current_player;main;0.5,3.25;6,2;6]
		list[current_player;main;0.5,6;6,1;0]
		list[current_player;craft;1.75,0.5;2,2;]
		image[4.25,1.125;1,1;mt_inv_arrow.png^[transformR270]
		list[current_player;craftpreview;5.5,1.125;1,1;]
	]])
end)
core.register_node("mini_chests:chest", {
	description = "Chest",
	tiles ={
		sheet("node",1,2),
		sheet("node",1,2),
		sheet("node",5,2),
		sheet("node",5,2),
		sheet("node",5,2),
		sheet("node",4,2)
		},
	paramtype2 = "facedir",
	groups = { choppy=3 },
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec",
			"size[8.25,8.75]"..
			"real_coordinates[true]"..
			"background9[0,0;0,0;mini_formspec_bg.png;true;12]"..
			"bgcolor[#00000080;true]"..
			"listcolors[#787878ff;#505050ff]"..
			"list[current_player;main;0.5,4.5;6,2;6]"..
			"list[current_player;main;0.5,7.25;6,1;0]"..
			"list[current_name;main;0.5,0.5;6,3;]")
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 6*3)
	end,
	can_dig = function(pos,player)
		local meta = core.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
})

minetest.register_node("mt_nodes:chest", {
	description = "Chest",
	tiles ={
		"mt_atlas.png^[sheet:8x8:6,1",
		"mt_atlas.png^[sheet:8x8:6,1",
		"mt_atlas.png^[sheet:8x8:1,2",
		"mt_atlas.png^[sheet:8x8:1,2",
		"mt_atlas.png^[sheet:8x8:1,2",
		"mt_atlas.png^[sheet:8x8:0,2"
		},
	paramtype2 = "facedir",
	groups = { choppy=3 },
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
			"size[8.25,8.75]"..
			"real_coordinates[true]"..
			"list[current_player;main;0.5,4.5;6,2;6]"..
			"list[current_player;main;0.5,7.25;6,1;0]"..
			"list[current_name;main;0.5,0.5;6,3;]")
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 6*3)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
})
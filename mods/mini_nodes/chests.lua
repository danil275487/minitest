core.register_node("mini_nodes:chest", {
	description = "Chest",
	tiles ={
		mini_core.sheet("node",1,2),
		mini_core.sheet("node",1,2),
		mini_core.sheet("node",5,2),
		mini_core.sheet("node",5,2),
		mini_core.sheet("node",5,2),
		mini_core.sheet("node",4,2)
		},
	paramtype2 = "facedir",
	groups = { choppy=3 },
	sounds = mini_core.sounds.dig_hard,
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("formspec", [[
			formspec_version[8]
			size[8.25,8.75]
			list[current_player;main;0.5,4.5;6,2;6]
			list[current_player;main;0.5,7.25;6,1;0]
			list[current_name;main;0.5,0.5;6,3;]
		]])
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

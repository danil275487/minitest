--Nodes
minetest.register_node("mini_nodes:stone", {
	description = "Stone",
	tiles = { "mt_atlas.png^[sheet:8x8:0,1" },
	groups = { cracky = 3 },
})

minetest.register_node("mini_nodes:deep_stone", {
	description = "Deep Stone",
	tiles = { "mt_atlas.png^[sheet:8x8:0,5" },
	groups = { cracky = 2, level = 1 },
})

minetest.register_node("mini_nodes:stone_bricks", {
	description = "Stone Bricks",
	tiles = { "mt_atlas.png^[sheet:8x8:7,1" },
	groups = { cracky = 3 },
})

minetest.register_node("mini_nodes:deep_stone_bricks", {
	description = "Deep Stone Bricks",
	tiles = { "mt_atlas.png^[sheet:8x8:1,5" },
	groups = { cracky = 2, level = 1 },
})

minetest.register_node("mini_nodes:dirt", {
	description = "Dirt",
	tiles = { "mt_atlas.png^[sheet:8x8:1,0" },
	groups = { crumbly = 3, soil = 1, cultivatable = 1 },
})

minetest.register_node("mini_nodes:grass", {
	description = "Grassy Dirt",
	tiles = { "mt_atlas.png^[sheet:8x8:0,0",
						  "mt_atlas.png^[sheet:8x8:1,0",
						  "mt_atlas.png^[sheet:8x8:1,0^(mt_atlas.png^[sheet:8x8:2,0)"
						  },
	groups = { crumbly = 3, soil = 1, cultivatable = 1 },
	drop = "mini_nodes:dirt"
})

minetest.register_node("mini_nodes:sand", {
	description = "Sand",
	tiles = { "mt_atlas.png^[sheet:8x8:3,0" },
	groups = { crumbly = 3, falling_node = 1 },
})

minetest.register_node("mini_nodes:gravel", {
	description = "Gravel",
	tiles = { "mt_atlas.png^[sheet:8x8:7,0" },
	groups = { crumbly = 2, falling_node = 1 },
})

minetest.register_node("mini_nodes:oak_tree", {
	description = "Oak Tree",
	tiles = { "mt_atlas.png^[sheet:8x8:5,0",
							"mt_atlas.png^[sheet:8x8:5,0",
							"mt_atlas.png^[sheet:8x8:4,0",
	 },
	groups = { choppy = 3 },
})

minetest.register_node("mini_nodes:oak_planks", {
	description = "Oak Planks",
	tiles = { "mt_atlas.png^[sheet:8x8:6,1" },
	groups = { choppy = 3 },
})

minetest.register_node("mini_nodes:crafting_bench", {
	description = "Crafting Bench",
	tiles = { "mt_atlas.png^[sheet:8x8:2,3",
							"mt_atlas.png^[sheet:8x8:6,1",
							"mt_atlas.png^[sheet:8x8:1,3",
	 },
	 paramtype = "light",
	 drawtype = "nodebox",
	 node_box = {
	type = "fixed",
	fixed = {
		{-0.5000, 0.2500, -0.5000, 0.5000, 0.5000, 0.5000},
		{-0.5000, -0.5000, -0.5000, -0.3750, 0.2500, -0.3750},
		{0.3750, -0.5000, -0.5000, 0.5000, 0.2500, -0.3750},
		{-0.5000, -0.5000, 0.3750, -0.3750, 0.2500, 0.5000},
		{0.3750, -0.5000, 0.3750, 0.5000, 0.2500, 0.5000}
	}
},
	groups = { oddly_breakable_by_hand = 1, choppy = 3, attached_node = 1 },
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Crafting Bench")
	end,
	on_rightclick = function(pos, node, player, itemstack)
		player:get_inventory():set_width("craft", 3)
		player:get_inventory():set_size("craft", 9)
		local form = [[
		size[8.25,8.75]
		real_coordinates[true]
		background9[0,0;0,0;mt_formspec_bg.png;true;12]
		bgcolor[#00000080;true]
		listcolors[#787878ff;#505050ff]
		list[current_player;main;0.5,4.5;6,2;6]
		list[current_player;main;0.5,7.25;6,1;0]
		list[current_player;craft;1.125,0.5;3,3;]
		image[4.875,1.75;1,1;mt_inv_arrow.png^[transformR270]
		list[current_player;craftpreview;6.125,1.75;1,1;]
		]]
		minetest.show_formspec(player:get_player_name(), "main", form)
	end,
})

minetest.register_node("mini_nodes:oak_leaves", {
	description = "Oak Leaves",
	tiles = { "mt_atlas.png^[sheet:8x8:6,0" },
	drawtype = "allfaces_optional",
	paramtype = "light",
	groups = { snappy = 3 },
	drop = {
		max_items = 1,
		items = {
			{items = {"mini_nodes:oak_sapling"},rarity = 7},
		}
	},
})

minetest.register_node("mini_nodes:apple_leaves", {
	description = "Leaves with apple",
	tiles = { "mt_atlas.png^[sheet:8x8:6,0^(mt_atlas.png^[sheet:8x8:7,3)" },
	drawtype = "allfaces_optional",
	paramtype = "light",
	groups = { snappy = 3 },
	drop = {
		max_items = 2,
		items = {
			{items = {"mini_nodes:oak_sapling"},rarity = 7},
			{items = {"mini_items:apple"},rarity = 1},
		}
	}
})

minetest.register_node("mini_nodes:red_flower", {
	description = "Flower",
	tiles = { "mt_atlas.png^[sheet:8x8:6,2" },
	inventory_image = "mt_atlas.png^[sheet:8x8:6,2",
	wield_image = "mt_atlas.png^[sheet:8x8:6,2",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drawtype = "nodebox",
	node_box = {
	type = "fixed",
	fixed = {
		{-0.5000, -0.4375, -0.5000, 0.5000, -0.4375, 0.5000}
	}
},
	groups = { dig_immediate = 3, attached_node = 1 },
})

minetest.register_node("mini_nodes:blue_flower", {
	description = "Flower",
	tiles = { "mt_atlas.png^[sheet:8x8:7,2" },
	inventory_image = "mt_atlas.png^[sheet:8x8:7,2",
	wield_image = "mt_atlas.png^[sheet:8x8:7,2",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drawtype = "nodebox",
	node_box = {
	type = "fixed",
	fixed = {
		{-0.5000, -0.4375, -0.5000, 0.5000, -0.4375, 0.5000}
	}
},
	groups = { dig_immediate = 3, attached_node = 1 },
})

minetest.register_node("mini_nodes:white_flower", {
	description = "Flower",
	tiles = { "mt_atlas.png^[sheet:8x8:0,3" },
	inventory_image = "mt_atlas.png^[sheet:8x8:0,3",
	wield_image = "mt_atlas.png^[sheet:8x8:0,3",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drawtype = "nodebox",
	node_box = {
	type = "fixed",
	fixed = {
		{-0.5000, -0.4375, -0.5000, 0.5000, -0.4375, 0.5000}
	}
},
	groups = { dig_immediate = 3, attached_node = 1 },
})

minetest.register_node("mini_nodes:twig", {
	description = "Twig",
	tiles = { "mt_atlas.png^[sheet:8x8:4,2" },
	inventory_image = "mt_atlas.png^[sheet:8x8:4,2",
	wield_image = "mt_atlas.png^[sheet:8x8:4,2",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drawtype = "nodebox",
	node_box = {
	type = "fixed",
	fixed = {
		{-0.5000, -0.4375, -0.5000, 0.5000, -0.4375, 0.5000}
	}
},
	groups = { dig_immediate = 3, attached_node = 1 },
})

minetest.register_node("mini_nodes:rocks", {
	description = "Rocks",
	tiles = { "mt_atlas.png^[sheet:8x8:5,2" },
	inventory_image = "mt_atlas.png^[sheet:8x8:5,2",
	wield_image = "mt_atlas.png^[sheet:8x8:5,2",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drawtype = "nodebox",
	node_box = {
	type = "fixed",
	fixed = {
		{-0.5000, -0.4375, -0.5000, 0.5000, -0.4375, 0.5000}
	}
},
	groups = { dig_immediate = 3, attached_node = 1 },
	drop = "mini_items:rock"
})

minetest.register_node("mini_nodes:low_grass", {
	description = "Grass",
	tiles = {"mt_atlas.png^[sheet:8x8:2,2"},
	inventory_image = "mt_atlas.png^[sheet:8x8:2,2",
	wield_image = "mt_atlas.png^[sheet:8x8:2,2",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = { dig_immediate = 3, attached_node = 1 },
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
	},
	drop = {
		max_items = 2,
		items = {
			{items = {"mini_items:seeds"},rarity = 10},
			{items = {"mini_items:grass_heap"},rarity = 1},
		}
	},
})

minetest.register_node("mini_nodes:tall_grass", {
	description = "Grass",
	tiles = {"mt_atlas.png^[sheet:8x8:3,2"},
	inventory_image = "mt_atlas.png^[sheet:8x8:3,2",
	wield_image = "mt_atlas.png^[sheet:8x8:3,2",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = { dig_immediate = 3, attached_node = 1 },
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
	},
	drop = {
		max_items = 2,
		items = {
			{items = {"mini_items:seeds"},rarity = 6},
			{items = {"mini_items:grass_heap"},rarity = 1},
		}
	},
})

local ores = {
	coal = {
		name = "Coal",
		tile = "1,1",
		groups = {cracky = 3},
		deep_groups = {cracky = 2, level = 1},
		drop = "mini_items:coal_lump",
	},
	iron = {
		name = "Iron",
		tile = "2,1",
		groups = {cracky = 2},
		deep_groups = {cracky = 2, level = 1},
		drop = "mini_items:iron_lump",
	},
	gold = {
		name = "Gold",
		tile = "3,1",
		groups = {cracky = 2, level = 1},
		deep_groups = {cracky = 1, level = 1},
		drop = "mini_items:gold_lump",
	},
	diamond = {
		name = "Diamond",
		tile = "4,1",
		groups = {cracky = 1, level = 1},
		deep_groups = {cracky = 1, level = 2},
		drop = "mini_items:diamond",
	},
	crystal = {
		name = "Crystal",
		tile = "5,1",
		groups = {cracky = 1, level = 2},
		deep_groups = {cracky = 1, level = 3},
		drop = "mini_items:crystal",
	},
}

for k,v in pairs(ores) do
	minetest.register_node("mini_nodes:"..k.."_ore", {
		description = v.name.." Ore",
		tiles = { "mt_atlas.png^[sheet:8x8:0,1^(mt_atlas.png^[sheet:8x8:"..v.tile..")" },
		groups = v.groups,
		drop = v.drop
	})
	minetest.register_node("mini_nodes:deep_"..k.."_ore", {
		description = "Deep "..v.name.." Ore",
		tiles = { "mt_atlas.png^[sheet:8x8:0,5^(mt_atlas.png^[sheet:8x8:"..v.tile..")" },
		groups = v.deep_groups,
		drop = v.drop
	})
end

minetest.register_node("mini_nodes:glass", {
	description = "Glass",
	drawtype = "glasslike",
	paramtype = "light",
	tiles = { "mt_atlas.png^[sheet:8x8:5,3" },
	groups = { oddly_breakable_by_hand = 3 },
	use_texture_alpha = "clip",
	is_ground_content = true,
	drop = ""
})

minetest.register_node("mini_nodes:oak_sapling", {
	description = "Oak Sapling",
	drawtype = "plantlike",
	tiles = { "mt_atlas.png^[sheet:8x8:4,4" },
	inventory_image = "mt_atlas.png^[sheet:8x8:4,4",
	wield_image = "mt_atlas.png^[sheet:8x8:4,4",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	groups = { snappy = 2, dig_immediate = 3, attached_node = 1, sapling = 1 },
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(60, 480))
	end,
})

minetest.register_node("mini_nodes:torch", {
	description = "Torch",
	drawtype = "plantlike",
	paramtype2 = "meshoptions",
	place_param2 = 1,
	inventory_image = "mt_atlas.png^[sheet:8x8:6,3",
	wield_image = "mt_atlas.png^[sheet:8x8:6,3",
	tiles = { "mt_atlas.png^[sheet:8x8:6,3" },
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	liquids_pointable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, attached_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.1, -0.5, -0.1, 0.1, 0.35, 0.1},
	},
	on_place = function(itemstack, placer, pointed_thing)
		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local def = minetest.registered_nodes[node.name]
		if def and def.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
			return def.on_rightclick(under, node, placer, itemstack,pointed_thing) or itemstack
		end

		local above = pointed_thing.above
		local wdir = minetest.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 then
			return nil,
			fakestack:set_name("air")
		elseif wdir == 1 then
			fakestack:set_name("mini_nodes:torch")
		else
			fakestack:set_name("mini_nodes:torch_wall")
		end
		itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
		itemstack:set_name("mini_nodes:torch")
		return itemstack
	end,
})

minetest.register_node("mini_nodes:torch_wall", {
	drawtype = "torchlike",
	tiles = { "mt_atlas.png^[sheet:8x8:7,4" },
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, not_in_creative_inventory=1, attached_node=1},
	drop = "mini_nodes:torch",
	selection_box = {
		type = "wallmounted",
		wall_side = {-0.5, -0.35, -0.1, 0, 0.35, 0.1},
	},
})

minetest.register_node("mini_nodes:chest", {
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
			"background9[0,0;0,0;mt_formspec_bg.png;true;12]"..
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
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
})

--Load .lua files
dofile(minetest.get_modpath("mt_nodes") .. "/liquids.lua")
dofile(minetest.get_modpath("mt_nodes") .. "/chest.lua")
dofile(minetest.get_modpath("mt_nodes") .. "/furnace.lua")

--Nodes
minetest.register_node("mt_nodes:stone", {
	description = "Stone",
	tiles = { "mt_atlas.png^[sheet:8x8:0,1" },
	groups = { cracky = 3 },
})

minetest.register_node("mt_nodes:stone_bricks", {
	description = "Stone Bricks",
	tiles = { "mt_atlas.png^[sheet:8x8:7,1" },
	groups = { cracky = 3 },
})

minetest.register_node("mt_nodes:dirt", {
	description = "Dirt",
	tiles = { "mt_atlas.png^[sheet:8x8:1,0" },
	groups = { crumbly = 3 },
})

minetest.register_node("mt_nodes:grass", {
	description = "Grassy Dirt",
	tiles = { "mt_atlas.png^[sheet:8x8:0,0",
						  "mt_atlas.png^[sheet:8x8:1,0",
						  "mt_atlas.png^[sheet:8x8:1,0^(mt_atlas.png^[sheet:8x8:2,0)"
						  },
	groups = { crumbly = 3 },
	drop = "mt_nodes:dirt"
})

minetest.register_node("mt_nodes:sand", {
	description = "Sand",
	tiles = { "mt_atlas.png^[sheet:8x8:3,0" },
	groups = { crumbly = 3, falling_node = 1 },
})

minetest.register_node("mt_nodes:gravel", {
	description = "Gravel",
	tiles = { "mt_atlas.png^[sheet:8x8:7,0" },
	groups = { crumbly = 2, falling_node = 1 },
})

minetest.register_node("mt_nodes:oak_tree", {
	description = "Oak Tree",
	tiles = { "mt_atlas.png^[sheet:8x8:5,0",
							"mt_atlas.png^[sheet:8x8:5,0",
							"mt_atlas.png^[sheet:8x8:4,0",
	 },
	groups = { choppy = 3 },
})

minetest.register_node("mt_nodes:oak_planks", {
	description = "Oak Planks",
	tiles = { "mt_atlas.png^[sheet:8x8:6,1" },
	groups = { choppy = 3 },
})

minetest.register_node("mt_nodes:crafting_bench", {
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
	groups = { oddly_breakable_by_hand = 1, choppy = 3 },
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
		list[current_player;main;0.5,4.5;6,2;6]
		list[current_player;main;0.5,7.25;6,1;0]
		list[current_player;craft;1.125,0.5;3,3;]
		image[4.875,1.75;1,1;mt_inv_arrow.png^[transformR270]
		list[current_player;craftpreview;6.125,1.75;1,1;]
		]]
		minetest.show_formspec(player:get_player_name(), "main", form)
	end,
})

minetest.register_node("mt_nodes:oak_leaves", {
	description = "Oak Leaves",
	tiles = { "mt_atlas.png^[sheet:8x8:6,0" },
	drawtype = "allfaces_optional",
	paramtype = "light",
	groups = { snappy = 3 },
	drop = ""
})

minetest.register_node("mt_nodes:apple_leaves", {
	description = "Leaves with apple",
	tiles = { "mt_atlas.png^[sheet:8x8:6,0^(mt_atlas.png^[sheet:8x8:7,3)" },
	drawtype = "allfaces_optional",
	paramtype = "light",
	groups = { snappy = 3 },
	drop = "mt_items:apple"
})

minetest.register_node("mt_nodes:red_flower", {
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
	groups = { dig_immediate = 3 },
})

minetest.register_node("mt_nodes:blue_flower", {
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
	groups = { dig_immediate = 3 },
})

minetest.register_node("mt_nodes:white_flower", {
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
	groups = { dig_immediate = 3 },
})

minetest.register_node("mt_nodes:twig", {
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
	groups = { dig_immediate = 3 },
})

minetest.register_node("mt_nodes:rocks", {
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
	groups = { dig_immediate = 3 },
	drop = "mt_items:rock"
})

minetest.register_node("mt_nodes:low_grass", {
	description = "Grass",
	tiles = {"mt_atlas.png^[sheet:8x8:2,2"},
	inventory_image = "mt_atlas.png^[sheet:8x8:2,2",
	wield_image = "mt_atlas.png^[sheet:8x8:2,2",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = { dig_immediate = 3 },
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
	},
	drop = "mt_items:grass_heap"
})

minetest.register_node("mt_nodes:tall_grass", {
	description = "Grass",
	tiles = {"mt_atlas.png^[sheet:8x8:3,2"},
	inventory_image = "mt_atlas.png^[sheet:8x8:3,2",
	wield_image = "mt_atlas.png^[sheet:8x8:3,2",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = { dig_immediate = 3 },
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
	},
	drop = "mt_items:grass_heap"
})

minetest.register_node("mt_nodes:coal_ore", {
	description = "Coal Ore",
	tiles = { "mt_atlas.png^[sheet:8x8:0,1^(mt_atlas.png^[sheet:8x8:1,1)" },
	groups = { cracky = 3 },
	drop = "mt_items:coal_lump"
})

minetest.register_node("mt_nodes:iron_ore", {
	description = "Iron Ore",
	tiles = { "mt_atlas.png^[sheet:8x8:0,1^(mt_atlas.png^[sheet:8x8:2,1)" },
	groups = { cracky = 2 },
	drop = "mt_items:iron_lump"
})

minetest.register_node("mt_nodes:gold_ore", {
	description = "Gold Ore",
	tiles = { "mt_atlas.png^[sheet:8x8:0,1^(mt_atlas.png^[sheet:8x8:3,1)" },
	groups = { cracky = 2 },
	drop = "mt_items:gold_lump"
})

minetest.register_node("mt_nodes:diamond_ore", {
	description = "Diamond Ore",
	tiles = { "mt_atlas.png^[sheet:8x8:0,1^(mt_atlas.png^[sheet:8x8:4,1)" },
	groups = { cracky = 1 },
	drop = "mt_items:diamond"
})

minetest.register_node("mt_nodes:crystal_ore", {
	description = "Crystal Ore",
	tiles = { "mt_atlas.png^[sheet:8x8:0,1^(mt_atlas.png^[sheet:8x8:5,1)" },
	groups = { cracky = 1 },
	drop = "mt_items:crystal"
})

minetest.register_node("mt_nodes:glass", {
	description = "Glass",
	drawtype = "glasslike",
	paramtype = "light",
	tiles = { "mt_atlas.png^[sheet:8x8:5,3" },
	groups = { oddly_breakable_by_hand = 3 },
	use_texture_alpha = "clip",
	is_ground_content = true,
	drop = ""
})
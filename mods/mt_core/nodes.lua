--Basic nodes

minetest.register_node("mt_core:stone", {
	description = "Stone",
	tiles = { "mt_atlas.png^[sheet:8x8:0,1" },
	groups = { cracky = 3 },
})

minetest.register_node("mt_core:stone_bricks", {
	description = "Stone Bricks",
	tiles = { "mt_atlas.png^[sheet:8x8:7,1" },
	groups = { cracky = 3 },
})

minetest.register_node("mt_core:dirt", {
	description = "Dirt",
	tiles = { "mt_atlas.png^[sheet:8x8:1,0" },
	groups = { crumbly = 3 },
})

minetest.register_node("mt_core:grass", {
	description = "Grassy Dirt",
	tiles = { "mt_atlas.png^[sheet:8x8:0,0",
						  "mt_atlas.png^[sheet:8x8:1,0",
						  "mt_atlas.png^[sheet:8x8:1,0^(mt_atlas.png^[sheet:8x8:2,0)"
						  },
	groups = { crumbly = 3 },
})

minetest.register_node("mt_core:sand", {
	description = "Sand",
	tiles = { "mt_atlas.png^[sheet:8x8:3,0" },
	groups = { crumbly = 3, falling_node = 1 },
})

minetest.register_node("mt_core:gravel", {
	description = "Gravel",
	tiles = { "mt_atlas.png^[sheet:8x8:7,0" },
	groups = { crumbly = 2, falling_node = 1 },
})

minetest.register_node("mt_core:oak_tree", {
	description = "Oak Tree",
	tiles = { "mt_atlas.png^[sheet:8x8:5,0",
							"mt_atlas.png^[sheet:8x8:5,0",
							"mt_atlas.png^[sheet:8x8:4,0",
	 },
	groups = { choppy = 3},
})

minetest.register_node("mt_core:oak_planks", {
	description = "Oak Planks",
	tiles = { "mt_atlas.png^[sheet:8x8:6,1" },
	groups = { choppy = 3 },
})

minetest.register_node("mt_core:oak_leaves", {
	description = "Oak Leaves",
	tiles = { "mt_atlas.png^[sheet:8x8:6,0" },
	drawtype = "allfaces_optional",
	paramtype = "light",
	groups = { snappy = 3},
})

minetest.register_node("mt_core:apple_leaves", {
	description = "Leaves with apple",
	tiles = { "mt_atlas.png^[sheet:8x8:6,0^(mt_atlas.png^[sheet:8x8:7,3)" },
	drawtype = "allfaces_optional",
	paramtype = "light",
	groups = { snappy = 3},
})

minetest.register_node("mt_core:red_flower", {
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

minetest.register_node("mt_core:blue_flower", {
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

minetest.register_node("mt_core:white_flower", {
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

minetest.register_node("mt_core:stick", {
	description = "Stick",
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

minetest.register_node("mt_core:rocks", {
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
})

minetest.register_node("mt_core:low_grass", {
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
	}
})

minetest.register_node("mt_core:tall_grass", {
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
	}
})

minetest.register_node("mt_core:coal_ore", {
	description = "Coal Ore",
	tiles = { "mt_atlas.png^[sheet:8x8:0,1^(mt_atlas.png^[sheet:8x8:1,1)" },
	groups = { cracky = 3 },
})

minetest.register_node("mt_core:iron_ore", {
	description = "Iron Ore",
	tiles = { "mt_atlas.png^[sheet:8x8:0,1^(mt_atlas.png^[sheet:8x8:2,1)" },
	groups = { cracky = 2 },
})

minetest.register_node("mt_core:gold_ore", {
	description = "Gold Ore",
	tiles = { "mt_atlas.png^[sheet:8x8:0,1^(mt_atlas.png^[sheet:8x8:3,1)" },
	groups = { cracky = 2 },
})

minetest.register_node("mt_core:gold_ore", {
	description = "Gold Ore",
	tiles = { "mt_atlas.png^[sheet:8x8:0,1^(mt_atlas.png^[sheet:8x8:3,1)" },
	groups = { cracky = 2 },
})

minetest.register_node("mt_core:diamond_ore", {
	description = "Diamond Ore",
	tiles = { "mt_atlas.png^[sheet:8x8:0,1^(mt_atlas.png^[sheet:8x8:4,1)" },
	groups = { cracky = 1 },
})

minetest.register_node("mt_core:crystal_ore", {
	description = "Crystal Ore",
	tiles = { "mt_atlas.png^[sheet:8x8:0,1^(mt_atlas.png^[sheet:8x8:5,1)" },
	groups = { cracky = 1 },
})

minetest.register_node("mt_core:glass", {
	description = "Glass",
	drawtype = "glasslike",
	paramtype = "light",
	tiles = { "mt_atlas.png^[sheet:8x8:5,3" },
	groups = { oddly_breakable_by_hand = 3 },
	use_texture_alpha = "clip",
	is_ground_content = true
})

--Water
minetest.register_node("mt_core:water_source", {
	description = "Water",
	drawtype = "liquid",
	tiles = {
		{
			name = "mt_water.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 2.5,
			},
		},
		{
			name = "mt_water.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 2.5,
			},
		},
	},
	paramtype = "light",
	walkable = false,
	pointable = false,
	buildable_to = true,
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "mt_core:water_flowing",
	liquid_alternative_source = "mt_core:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 64, r = 100, g = 100, b = 200}
})

minetest.register_node("mt_core:water_flowing", {
	description = "Water",
	drawtype = "flowingliquid",
	tiles = {"mt_water.png"},
	special_tiles = {
		{
			name = "mt_water.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 2.5,
			},
		},
		{
			name = "mt_water.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 2.5,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	buildable_to = true,
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "mt_core:water_flowing",
	liquid_alternative_source = "mt_core:water_source",
	liquid_renewable = false,
	liquid_viscosity = 1,
	post_effect_color = {a = 100, r = 120, g = 105, b = 196}
})
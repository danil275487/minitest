--Liquids
minetest.register_node("mini_liquids:water_source", {
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
	liquid_alternative_flowing = "mini_liquids:water_flowing",
	liquid_alternative_source = "mini_liquids:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 100, r = 120, g = 105, b = 196},
	groups = { not_in_creative_inventory = 1, water = 1 }
})

minetest.register_node("mini_liquids:water_flowing", {
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
	liquid_alternative_flowing = "mini_liquids:water_flowing",
	liquid_alternative_source = "mini_liquids:water_source",
	liquid_renewable = false,
	liquid_viscosity = 1,
	post_effect_color = {a = 100, r = 120, g = 105, b = 196},
	groups = { not_in_creative_inventory = 1, water = 1 }
})

minetest.register_node("mini_liquids:river_water_source", {
	description = "River Water",
	drawtype = "liquid",
	tiles = {
		{
			name = "mt_river_water.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 2.5,
			},
		},
		{
			name = "mt_river_water.png",
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
	liquid_range = 2,
	liquidtype = "source",
	liquid_alternative_flowing = "mini_liquids:river_water_flowing",
	liquid_alternative_source = "mini_liquids:river_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 100, r = 103, g = 182, b = 189},
	groups = { not_in_creative_inventory = 1, water = 1 }
})

minetest.register_node("mini_liquids:river_water_flowing", {
	description = "River Water",
	drawtype = "flowingliquid",
	tiles = {"mt_river_water.png"},
	special_tiles = {
		{
			name = "mt_river_water.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 2.5,
			},
		},
		{
			name = "mt_river_water.png",
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
	liquid_range = 2,
	liquidtype = "flowing",
	liquid_alternative_flowing = "mini_liquids:river_water_flowing",
	liquid_alternative_source = "mini_liquids:river_water_source",
	liquid_renewable = false,
	liquid_viscosity = 1,
	post_effect_color = {a = 100, r = 103, g = 182, b = 189},
	groups = { not_in_creative_inventory = 1, water = 1 }
})

minetest.register_node("mini_liquids:lava_source", {
	description = "Lava",
	drawtype = "liquid",
	tiles = {
		{
			name = "mt_lava.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 2.5,
			},
		},
		{
			name = "mt_lava.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 2.5,
			},
		},
	},
	light_source = 9,
	paramtype = "light",
	walkable = false,
	pointable = false,
	buildable_to = true,
	liquid_range = 3,
	damage_per_second = 5,
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "mini_liquids:lava_flowing",
	liquid_alternative_source = "mini_liquids:lava_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 64, r = 100, g = 100, b = 200},
	groups = { not_in_creative_inventory = 1 }
})

minetest.register_node("mini_liquids:lava_flowing", {
	description = "Lava",
	drawtype = "flowingliquid",
	tiles = {"mt_lava.png"},
	special_tiles = {
		{
			name = "mt_lava.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 2.5,
			},
		},
		{
			name = "mt_lava.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 2.5,
			},
		},
	},
	light_source = 7,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	buildable_to = true,
	liquid_range = 3,
	damage_per_second = 4,
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "mini_liquids:lava_flowing",
	liquid_alternative_source = "mini_liquids:lava_source",
	liquid_renewable = false,
	liquid_viscosity = 1,
	post_effect_color = {a = 100, r = 120, g = 105, b = 196},
	groups = { not_in_creative_inventory = 1 }
})

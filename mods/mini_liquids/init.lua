--Liquids
--Water
core.register_node("mini_liquids:water_source", {
	description = "Water",
	drawtype = "liquid",
	tiles = {
		{
			name = mini_core.sheet('node',7,1,8,2),
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 8,
				aspect_h = 8,
				length = 2.5,
			},
		},
	},
	paramtype = "light",
	use_texture_alpha = "clip",
	waving = 3,
	walkable = false,
	pointable = false,
	buildable_to = true,
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "mini_liquids:water_flowing",
	liquid_alternative_source = "mini_liquids:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 170, r = 120, g = 105, b = 196},
	groups = { not_in_creative_inventory = 1, water = 1 }
})

core.register_node("mini_liquids:water_flowing", {
	description = "Water",
	drawtype = "flowingliquid",
	special_tiles = {
		{
			name = mini_core.sheet('node',7,1,8,2), --flowing animation might be broken as shit? luanti is odd
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 8,
				aspect_h = 4,
				length = 2,
			},
		},
		{
			name = mini_core.sheet('node',7,1,8,2),
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 8,
				aspect_h = 4,
				length = 2,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	use_texture_alpha = "clip",
	waving = 3,
	walkable = false,
	pointable = false,
	buildable_to = true,
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "mini_liquids:water_flowing",
	liquid_alternative_source = "mini_liquids:water_source",
	liquid_renewable = false,
	liquid_viscosity = 1,
	post_effect_color = {a = 170, r = 120, g = 105, b = 196},
	groups = { not_in_creative_inventory = 1, water = 1 }
})

--River water
core.register_node("mini_liquids:river_water_source", {
	description = "River Water",
	drawtype = "liquid",
	tiles = {
		{
			name = mini_core.sheet('node',6,1,8,2),
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 8,
				aspect_h = 8,
				length = 2.5,
			},
		},
	},
	paramtype = "light",
	use_texture_alpha = "clip",
	waving = 3,
	walkable = false,
	pointable = false,
	buildable_to = true,
	drowning = 1,
	liquid_range = 2,
	liquidtype = "source",
	liquid_alternative_flowing = "mini_liquids:river_water_flowing",
	liquid_alternative_source = "mini_liquids:river_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 170, r = 103, g = 182, b = 189},
	groups = { not_in_creative_inventory = 1, water = 1 }
})

core.register_node("mini_liquids:river_water_flowing", {
	description = "River Water",
	drawtype = "flowingliquid",
 	special_tiles = {
		{
			name = mini_core.sheet('node',6,1,8,2),
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 8,
				aspect_h = 4,
				length = 2,
			},
		},
		{
			name = mini_core.sheet('node',6,1,8,2),
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 8,
				aspect_h = 4,
				length = 2,
			},
		},

	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	use_texture_alpha = "clip",
	waving = 3,
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
	post_effect_color = {a = 170, r = 103, g = 182, b = 189},
	groups = { not_in_creative_inventory = 1, water = 1 }
})

--Lava
core.register_node("mini_liquids:lava_source", {
	description = "Lava",
	drawtype = "liquid",
	tiles = {
		{
			name = mini_core.sheet('node',5,1,8,2),
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 8,
				aspect_h = 8,
				length = 2.5,
			},
		},
	},
	light_source = 9,
	paramtype = "light",
	use_texture_alpha = "clip",
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
	post_effect_color = {a = 204, r = 100, g = 100, b = 200},
	groups = { not_in_creative_inventory = 1 }
})

core.register_node("mini_liquids:lava_flowing", {
	description = "Lava",
	drawtype = "flowingliquid",
	special_tiles = {
		{
			name = mini_core.sheet('node',5,1,8,2),
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 8,
				aspect_h = 4,
				length = 2,
			},
		},
		{
			name = mini_core.sheet('node',5,1,8,2),
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 8,
				aspect_h = 4,
				length = 2,
			},
		},

	},
	light_source = 7,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	use_texture_alpha = "clip",
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
	post_effect_color = {a = 204, r = 120, g = 105, b = 196},
	groups = { not_in_creative_inventory = 1 }
})

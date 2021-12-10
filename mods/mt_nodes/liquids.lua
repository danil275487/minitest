--Liquids
minetest.register_node("mt_nodes:water_source", {
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
	liquid_alternative_flowing = "mt_nodes:water_flowing",
	liquid_alternative_source = "mt_nodes:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 100, r = 120, g = 105, b = 196}
})

minetest.register_node("mt_nodes:water_flowing", {
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
	liquid_alternative_flowing = "mt_nodes:water_flowing",
	liquid_alternative_source = "mt_nodes:water_source",
	liquid_renewable = false,
	liquid_viscosity = 1,
	post_effect_color = {a = 100, r = 120, g = 105, b = 196}
})


minetest.register_node("mt_nodes:lava_source", {
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
	liquid_alternative_flowing = "mt_nodes:lava_flowing",
	liquid_alternative_source = "mt_nodes:lava_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 64, r = 100, g = 100, b = 200}
})

minetest.register_node("mt_nodes:lava_flowing", {
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
	liquid_alternative_flowing = "mt_nodes:lava_flowing",
	liquid_alternative_source = "mt_nodes:lava_source",
	liquid_renewable = false,
	liquid_viscosity = 1,
	post_effect_color = {a = 100, r = 120, g = 105, b = 196}
})
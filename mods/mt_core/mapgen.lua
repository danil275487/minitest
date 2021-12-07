-- Basic map aliases
minetest.register_alias("mapgen_stone", "mt_core:stone")
minetest.register_alias("mapgen_water_source", "mt_core:water_source")

-- Biomes
minetest.register_biome({
	name = "mt_core:forest",	
	node_top = "mt_core:grass",
	depth_top = 1,
	node_filler = "mt_core:dirt",
	depth_filler = 10,
	node_riverbed = "mt_core:sand",
	depth_riverbed = 2,
	y_max = 31000,
	y_min = 4,
	heat_point = 50,
	humidity_point = 50,
})

minetest.register_biome({
	name = "mt_core:beach",	
	node_top = "mt_core:sand",
	depth_top = 3,
	node_filler = "mt_core:dirt",
	depth_filler = 10,
	node_riverbed = "mt_core:sand",
	depth_riverbed = 2,
	y_max = 4,
	y_min = -10,
	heat_point = 50,
	humidity_point = 50,
})

-- Decorations

minetest.register_decoration({
	decoration = "mt_core:red_flower",
	deco_type = "simple",
	place_on = "mt_core:grass",
	sidelen = 16,
	fill_ratio = 0.05,
	biomes = {"forest"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	decoration = "mt_core:blue_flower",
	deco_type = "simple",
	place_on = "mt_core:grass",
	sidelen = 16,
	fill_ratio = 0.06,
	biomes = {"forest"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	decoration = "mt_core:white_flower",
	deco_type = "simple",
	place_on = "mt_core:grass",
	sidelen = 16,
	fill_ratio = 0.07,
	biomes = {"forest"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	decoration = "mt_core:low_grass",
	deco_type = "simple",
	place_on = "mt_core:grass",
	sidelen = 16,
	fill_ratio = 0.04,
	biomes = {"forest"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	decoration = "mt_core:tall_grass",
	deco_type = "simple",
	place_on = "mt_core:grass",
	sidelen = 16,
	fill_ratio = 0.07,
	biomes = {"forest"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	decoration = "mt_core:stick",
	deco_type = "simple",
	place_on = "mt_core:grass",
	sidelen = 16,
	fill_ratio = 0.07,
	biomes = {"forest"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	decoration = "mt_core:rocks",
	deco_type = "simple",
	place_on = "mt_core:grass",
	sidelen = 16,
	fill_ratio = 0.06,
	biomes = {"forest"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = "mt_core:grass",
	sidelen = 16,
	fill_ratio = 0.05,
	biomes = {"forest"},
	y_min = 0,
	y_max = 31000,
	schematic = mts("tree"),
	flags = "place_center_x, place_center_z, force_placement",
	rotation = "random",
})

-- Ores
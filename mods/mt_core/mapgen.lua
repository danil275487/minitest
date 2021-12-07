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
	name = "mt_core:plains",	
	node_top = "mt_core:grass",
	depth_top = 1,
	node_filler = "mt_core:dirt",
	depth_filler = 10,
	node_riverbed = "mt_core:sand",
	depth_riverbed = 2,
	y_max = 31000,
	y_min = 4,
	heat_point = 51,
	humidity_point = 51,
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
	biomes = {"forest", "plains"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	decoration = "mt_core:blue_flower",
	deco_type = "simple",
	place_on = "mt_core:grass",
	sidelen = 16,
	fill_ratio = 0.06,
	biomes = {"forest", "plains"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	decoration = "mt_core:white_flower",
	deco_type = "simple",
	place_on = "mt_core:grass",
	sidelen = 16,
	fill_ratio = 0.07,
	biomes = {"forest", "plains"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	decoration = "mt_core:low_grass",
	deco_type = "simple",
	place_on = "mt_core:grass",
	sidelen = 16,
	fill_ratio = 0.04,
	biomes = {"forest", "plains"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	decoration = "mt_core:tall_grass",
	deco_type = "simple",
	place_on = "mt_core:grass",
	sidelen = 16,
	fill_ratio = 0.07,
	biomes = {"forest", "plains"},
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
	biomes = {"forest", "plains"},
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
minetest.register_ore({
	ore_type = "scatter",
	ore = "mt_core:coal_ore",
	wherein = "mt_core:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 25,
	clust_size = 10,
	y_min = -31000,
	y_max = 256,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "mt_core:iron_ore",
	wherein = "mt_core:stone",
	clust_scarcity = 20*20*20,
	clust_num_ores = 20,
	clust_size = 15,
	y_min = -31000,
	y_max = -25,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "mt_core:gold_ore",
	wherein = "mt_core:stone",
	clust_scarcity = 25*25*25,
	clust_num_ores = 15,
	clust_size = 10,
	y_min = -31000,
	y_max = -50,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "mt_core:diamond_ore",
	wherein = "mt_core:stone",
	clust_scarcity = 35*35*35,
	clust_num_ores = 10,
	clust_size = 25,
	y_min = -31000,
	y_max = -125,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "mt_core:crystal_ore",
	wherein = "mt_core:stone",
	clust_scarcity = 25*25*25,
	clust_num_ores = 5,
	clust_size = 10,
	y_min = -31000,
	y_max = -250,
})

minetest.register_ore({
	ore_type	   = "blob",
	ore			= "mt_core:gravel",
	wherein		= "mt_core:stone",
	clust_scarcity = 25*25*25,
	clust_num_ores = 25,
	clust_size	 = 10,
	y_min		  = -31000,
	y_max		  = 31000,
	noise_params = {
		offset  = 5,
		scale   = 1,
		spread  = {x=100, y=100, z=100},
		seed	= 17266,
		octaves = 3,
		persist = 0.6,
	}
})

minetest.register_ore({
	ore_type	   = "blob",
	ore			= "mt_core:dirt",
	wherein		= "mt_core:stone",
	clust_scarcity = 25*25*25,
	clust_num_ores = 25,
	clust_size	 = 10,
	y_min		  = -31000,
	y_max		  = 31000,
	noise_params = {
		offset  = 5,
		scale   = 1,
		spread  = {x=100, y=100, z=100},
		seed	= 17266,
		octaves = 3,
		persist = 0.6,
	}
})

minetest.register_ore({
	ore_type	   = "blob",
	ore			= "mt_core:sand",
	wherein		= "mt_core:stone",
	clust_scarcity = 25*25*25,
	clust_num_ores = 25,
	clust_size	 = 7,
	y_min		  = -31000,
	y_max		  = 31000,
	noise_params = {
		offset  = 5,
		scale   = 3,
		spread  = {x=100, y=100, z=100},
		seed	= 17266,
		octaves = 3,
		persist = 0.6,
	}
})
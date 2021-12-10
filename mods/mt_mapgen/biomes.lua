-- Biomes
minetest.register_biome({
	name = "mt_mapgen:forest",	
	node_top = "mt_nodes:grass",
	depth_top = 1,
	node_filler = "mt_nodes:dirt",
	depth_filler = 10,
	node_riverbed = "mt_nodes:sand",
	depth_riverbed = 2,
	y_max = 31000,
	y_min = 4,
	heat_point = 45,
	humidity_point = 50,
})

minetest.register_biome({
	name = "mt_mapgen:plains",	
	node_top = "mt_nodes:grass",
	depth_top = 1,
	node_filler = "mt_nodes:dirt",
	depth_filler = 10,
	node_riverbed = "mt_nodes:sand",
	depth_riverbed = 2,
	y_max = 31000,
	y_min = 4,
	heat_point = 65,
	humidity_point = 35,
})

minetest.register_biome({
	name = "mt_mapgen:beach",	
	node_top = "mt_nodes:sand",
	depth_top = 3,
	node_filler = "mt_nodes:dirt",
	depth_filler = 10,
	node_riverbed = "mt_nodes:sand",
	depth_riverbed = 2,
	y_max = 4,
	y_min = -10,
	heat_point = 50,
	humidity_point = 50,
})
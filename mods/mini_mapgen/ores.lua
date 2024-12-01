-- Ores
core.register_ore({
	ore_type = "scatter",
	ore = "mini_nodes:coal_ore",
	wherein = "mini_nodes:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 25,
	clust_size = 10,
	y_min = -31000,
	y_max = 256,
})

core.register_ore({
	ore_type = "scatter",
	ore = "mini_nodes:iron_ore",
	wherein = "mini_nodes:stone",
	clust_scarcity = 20*20*20,
	clust_num_ores = 20,
	clust_size = 15,
	y_min = -31000,
	y_max = -25,
})

core.register_ore({
	ore_type = "scatter",
	ore = "mini_nodes:gold_ore",
	wherein = "mini_nodes:stone",
	clust_scarcity = 25*25*25,
	clust_num_ores = 15,
	clust_size = 10,
	y_min = -31000,
	y_max = -50,
})

core.register_ore({
	ore_type = "scatter",
	ore = "mini_nodes:diamond_ore",
	wherein	= "mini_nodes:stone",
	clust_scarcity = 35*35*35,
	clust_num_ores = 10,
	clust_size = 25,
	y_min = -31000,
	y_max = -125,
})

core.register_ore({
	ore_type = "scatter",
	ore = "mini_nodes:crystal_ore",
	wherein	= "mini_nodes:stone",
	clust_scarcity = 25*25*25,
	clust_num_ores = 5,
	clust_size = 10,
	y_min = -31000,
	y_max = -250,
})


core.register_ore({
	ore_type = "scatter",
	ore = "mini_nodes:deep_coal_ore",
	wherein = "mini_nodes:deep_stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 25,
	clust_size = 10,
	y_min = -31000,
	y_max = -125,
})

core.register_ore({
	ore_type = "scatter",
	ore = "mini_nodes:deep_iron_ore",
	wherein = "mini_nodes:deep_stone",
	clust_scarcity = 20*20*20,
	clust_num_ores = 20,
	clust_size = 15,
	y_min = -31000,
	y_max = -125,
})

core.register_ore({
	ore_type = "scatter",
	ore = "mini_nodes:deep_gold_ore",
	wherein = "mini_nodes:deep_stone",
	clust_scarcity = 25*25*25,
	clust_num_ores = 15,
	clust_size = 10,
	y_min = -31000,
	y_max = -125,
})

core.register_ore({
	ore_type = "scatter",
	ore = "mini_nodes:deep_diamond_ore",
	wherein	= "mini_nodes:deep_stone",
	clust_scarcity = 35*35*35,
	clust_num_ores = 15,
	clust_size = 25,
	y_min = -31000,
	y_max = -125,
})


core.register_ore({
	ore_type = "scatter",
	ore = "mini_nodes:deep_crystal_ore",
	wherein	= "mini_nodes:deep_stone",
	clust_scarcity = 25*25*25,
	clust_num_ores = 10,
	clust_size = 10,
	y_min = -31000,
	y_max = -125,
})

core.register_ore({
	ore_type	  = "blob",
	ore		= "mini_nodes:gravel",
	wherein	= {"mini_nodes:stone", "mini_nodes:deep_stone"},
	clust_scarcity = 15*15*15,
	clust_num_ores = 25,
	clust_size = 5,
	y_min = -31000,
	y_max = 31000,
	noise_params = {
		offset = 5,
		scale = 1,
		spread = {x=100, y=100, z=100},
		seed	= 17266,
		octaves = 3,
		persist = 0.6,
	}
})

core.register_ore({
	ore_type	   = "blob",
	ore			= "mini_nodes:dirt",
	wherein	= {"mini_nodes:stone", "mini_nodes:deep_stone"},
	clust_scarcity = 15*15*15,
	clust_num_ores = 25,
	clust_size	 = 5,
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

core.register_ore({
	ore_type	   = "blob",
	ore			= "mini_nodes:sand",
	wherein	= {"mini_nodes:stone", "mini_nodes:deep_stone"},
	clust_scarcity = 15*15*15,
	clust_num_ores = 25,
	clust_size	 = 2,
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

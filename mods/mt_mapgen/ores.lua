-- Ores
minetest.register_ore({
	ore_type = "scatter",
	ore = "mt_nodes:coal_ore",
	wherein = "mt_nodes:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 25,
	clust_size = 10,
	y_min = -31000,
	y_max = 256,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "mt_nodes:iron_ore",
	wherein = "mt_nodes:stone",
	clust_scarcity = 20*20*20,
	clust_num_ores = 20,
	clust_size = 15,
	y_min = -31000,
	y_max = -25,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "mt_nodes:gold_ore",
	wherein = "mt_nodes:stone",
	clust_scarcity = 25*25*25,
	clust_num_ores = 15,
	clust_size = 10,
	y_min = -31000,
	y_max = -50,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "mt_nodes:diamond_ore",
	wherein	= "mt_nodes:stone",
	clust_scarcity = 35*35*35,
	clust_num_ores = 10,
	clust_size = 25,
	y_min = -31000,
	y_max = -125,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "mt_nodes:crystal_ore",
	wherein	= "mt_nodes:stone",
	clust_scarcity = 25*25*25,
	clust_num_ores = 5,
	clust_size = 10,
	y_min = -31000,
	y_max = -250,
})

minetest.register_ore({
	ore_type	  = "blob",
	ore		= "mt_nodes:gravel",
	wherein	= "mt_nodes:stone",
	clust_scarcity = 25*25*25,
	clust_num_ores = 25,
	clust_size = 10,
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

minetest.register_ore({
	ore_type	   = "blob",
	ore			= "mt_nodes:dirt",
	wherein	= "mt_nodes:stone",
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
	ore			= "mt_nodes:sand",
	wherein		= "mt_nodes:stone",
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
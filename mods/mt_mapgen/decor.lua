-- Decorations
minetest.register_decoration({
	decoration = "mt_nodes:red_flower",
	deco_type = "simple",
	place_on = "mt_nodes:grass",
	sidelen = 16,
	fill_ratio = 0.05,
	biomes = {"mt_mapgen:forest", "mt_mapgen:plains"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	decoration = "mt_nodes:blue_flower",
	deco_type = "simple",
	place_on = "mt_nodes:grass",
	sidelen = 16,
	fill_ratio = 0.06,
	biomes = {"mt_mapgen:forest", "mt_mapgen:plains"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	decoration = "mt_nodes:white_flower",
	deco_type = "simple",
	place_on = "mt_nodes:grass",
	sidelen = 16,
	fill_ratio = 0.07,
	biomes = {"mt_mapgen:forest", "mt_mapgen:plains"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	decoration = "mt_nodes:low_grass",
	deco_type = "simple",
	place_on = "mt_nodes:grass",
	sidelen = 16,
	fill_ratio = 0.04,
	biomes = {"mt_mapgen:forest", "mt_mapgen:plains"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	decoration = "mt_nodes:tall_grass",
	deco_type = "simple",
	place_on = "mt_nodes:grass",
	sidelen = 16,
	fill_ratio = 0.07,
	biomes = {"mt_mapgen:forest", "mt_mapgen:plains"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	decoration = "mt_nodes:twig",
	deco_type = "simple",
	place_on = "mt_nodes:grass",
	sidelen = 16,
	fill_ratio = 0.07,
	biomes = "mt_mapgen:forest",
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	decoration = "mt_nodes:rocks",
	deco_type = "simple",
	place_on = "mt_nodes:grass",
	sidelen = 16,
	fill_ratio = 0.06,
	biomes = {"mt_mapgen:forest", "mt_mapgen:plains"},
	y_min = 0,
	y_max = 31000,
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = "mt_nodes:grass",
	sidelen = 16,
	fill_ratio = 0.05,
	biomes = "mt_mapgen:forest",
	y_min = 0,
	y_max = 31000,
	schematic = mts("tree"),
	flags = "place_center_x, place_center_z, force_placement",
	rotation = "random",
})
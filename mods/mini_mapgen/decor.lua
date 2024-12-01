-- Decorations
core.register_decoration({
	decoration = "mini_nodes:red_flower",
	deco_type = "simple",
	place_on = "mini_nodes:grass",
	sidelen = 16,
	fill_ratio = 0.05,
	biomes = {"mini_mapgen:forest", "mini_mapgen:plains"},
	y_min = 0,
	y_max = 31000,
})

core.register_decoration({
	decoration = "mini_nodes:blue_flower",
	deco_type = "simple",
	place_on = "mini_nodes:grass",
	sidelen = 16,
	fill_ratio = 0.06,
	biomes = {"mini_mapgen:forest", "mini_mapgen:plains"},
	y_min = 0,
	y_max = 31000,
})

core.register_decoration({
	decoration = "mini_nodes:white_flower",
	deco_type = "simple",
	place_on = "mini_nodes:grass",
	sidelen = 16,
	fill_ratio = 0.07,
	biomes = {"mini_mapgen:forest", "mini_mapgen:plains"},
	y_min = 0,
	y_max = 31000,
})

core.register_decoration({
	decoration = "mini_nodes:low_grass",
	deco_type = "simple",
	place_on = "mini_nodes:grass",
	sidelen = 16,
	fill_ratio = 0.04,
	biomes = {"mini_mapgen:forest", "mini_mapgen:plains"},
	y_min = 0,
	y_max = 31000,
})

core.register_decoration({
	decoration = "mini_nodes:tall_grass",
	deco_type = "simple",
	place_on = "mini_nodes:grass",
	sidelen = 16,
	fill_ratio = 0.07,
	biomes = {"mini_mapgen:forest", "mini_mapgen:plains"},
	y_min = 0,
	y_max = 31000,
})

core.register_decoration({
	decoration = "mini_nodes:twig",
	deco_type = "simple",
	place_on = "mini_nodes:grass",
	sidelen = 16,
	fill_ratio = 0.07,
	biomes = "mini_mapgen:forest",
	y_min = 0,
	y_max = 31000,
})

core.register_decoration({
	decoration = "mini_nodes:rocks",
	deco_type = "simple",
	place_on = "mini_nodes:grass",
	sidelen = 16,
	fill_ratio = 0.06,
	biomes = {"mini_mapgen:forest", "mini_mapgen:plains"},
	y_min = 0,
	y_max = 31000,
})

core.register_decoration({
	deco_type = "schematic",
	place_on = "mini_nodes:grass",
	sidelen = 16,
	fill_ratio = 0.025,
	biomes = "mini_mapgen:forest",
	y_min = 0,
	y_max = 31000,
	schematic = mts("tree"),
	flags = "place_center_x, place_center_z, force_placement",
	rotation = "random",
})

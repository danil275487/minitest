-- Biomes
minetest.register_biome({
	name = "mt_mapgen:forest",	
	node_top = "mt_nodes:grass",
	depth_top = 1,
	node_filler = "mt_nodes:dirt",
	depth_filler = 10,
	node_riverbed = "mt_nodes:sand",
	depth_riverbed = 2,
	node_dungeon = "mt_nodes:stone_bricks",
	node_dungeon_alt = "mt_nodes:stone",
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
	node_dungeon = "mt_nodes:stone_bricks",
	node_dungeon_alt = "mt_nodes:stone",
	y_max = 31000,
	y_min = 4,
	heat_point = 42,
	humidity_point = 68,
})

minetest.register_biome({
	name = "mt_mapgen:beach",	
	node_top = "mt_nodes:sand",
	depth_top = 3,
	node_filler = "mt_nodes:dirt",
	depth_filler = 10,
	node_riverbed = "mt_nodes:sand",
	depth_riverbed = 2,
	node_dungeon = "mt_nodes:stone_bricks",
	node_dungeon_alt = "mt_nodes:stone",
	y_max = 4,
	y_min = -10,
	heat_point = 26,
	humidity_point = 31,
})

minetest.register_biome({
	name = "mt_mapgen:underground",
	node_cave_liquid = "mt_nodes:water_source",
	node_dungeon = "mt_nodes:stone_bricks",
	node_dungeon_alt = "mt_nodes:stone",
	y_max = -10,
	y_min = -75,
	heat_point = 50,
	humidity_point = 50,
})

minetest.register_biome({
	name = "mt_mapgen:underground2",
	node_stone = "mt_nodes:stone",
	node_cave_liquid = "mt_nodes:lava_source",
	node_dungeon = "mt_nodes:stone_bricks",
	node_dungeon_alt = "mt_nodes:stone",
	y_max = -75,
	y_min = -275,
	heat_point = 50,
	humidity_point = 50,
})

minetest.register_biome({
	name = "mt_mapgen:deep_underground",
	node_stone = "mt_nodes:deep_stone",
	node_cave_liquid = "mt_nodes:lava_source",
	node_dungeon = "mt_nodes:deep_stone_bricks",
	node_dungeon_alt = "mt_nodes:deep_stone",
	y_max = -275,
	y_min = -31000,
	heat_point = 50,
	humidity_point = 50,
})
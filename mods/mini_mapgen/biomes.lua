-- Biomes
minetest.register_biome({
	name = "mini_mapgen:forest",
	node_top = "mini_nodes:grass",
	depth_top = 1,
	node_filler = "mini_nodes:dirt",
	depth_filler = 10,
	node_riverbed = "mini_nodes:sand",
	depth_riverbed = 2,
	node_dungeon = "mini_nodes:stone_bricks",
	node_dungeon_alt = "mini_nodes:stone",
	y_max = 31000,
	y_min = 4,
	heat_point = 45,
	humidity_point = 50,
})

minetest.register_biome({
	name = "mini_mapgen:plains",
	node_top = "mini_nodes:grass",
	depth_top = 1,
	node_filler = "mini_nodes:dirt",
	depth_filler = 10,
	node_riverbed = "mini_nodes:sand",
	depth_riverbed = 2,
	node_dungeon = "mini_nodes:stone_bricks",
	node_dungeon_alt = "mini_nodes:stone",
	y_max = 31000,
	y_min = 4,
	heat_point = 42,
	humidity_point = 68,
})

minetest.register_biome({
	name = "mini_mapgen:beach",
	node_top = "mini_nodes:sand",
	depth_top = 3,
	node_filler = "mini_nodes:dirt",
	depth_filler = 10,
	node_riverbed = "mini_nodes:sand",
	depth_riverbed = 2,
	node_dungeon = "mini_nodes:stone_bricks",
	node_dungeon_alt = "mini_nodes:stone",
	y_max = 4,
	y_min = -10,
	heat_point = 26,
	humidity_point = 31,
})

minetest.register_biome({
	name = "mini_mapgen:underground",
	node_cave_liquid = "mini_liquids:water_source",
	node_dungeon = "mini_nodes:stone_bricks",
	node_dungeon_alt = "mini_nodes:stone",
	y_max = -10,
	y_min = -75,
	heat_point = 50,
	humidity_point = 50,
})

minetest.register_biome({
	name = "mini_mapgen:underground2",
	node_stone = "mini_nodes:stone",
	node_cave_liquid = "mini_liquids:lava_source",
	node_dungeon = "mini_nodes:stone_bricks",
	node_dungeon_alt = "mini_nodes:stone",
	y_max = -75,
	y_min = -275,
	heat_point = 50,
	humidity_point = 50,
})

minetest.register_biome({
	name = "mini_mapgen:deep_underground",
	node_stone = "mini_nodes:deep_stone",
	node_cave_liquid = "mini_liquids:lava_source",
	node_dungeon = "mini_nodes:deep_stone_bricks",
	node_dungeon_alt = "mini_nodes:deep_stone",
	y_max = -275,
	y_min = -31000,
	heat_point = 50,
	humidity_point = 50,
})

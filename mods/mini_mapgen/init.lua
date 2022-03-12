--Load .lua files
dofile(minetest.get_modpath("mini_mapgen") .. "/biomes.lua")
dofile(minetest.get_modpath("mini_mapgen") .. "/decor.lua")
dofile(minetest.get_modpath("mini_mapgen") .. "/ores.lua")

-- Basic map aliases
minetest.register_alias("mapgen_stone", "mini_nodes:stone")
minetest.register_alias("mapgen_water_source", "mini_liquids:water_source")
minetest.register_alias("mapgen_river_water_source", "mini_liquids:river_water_source")

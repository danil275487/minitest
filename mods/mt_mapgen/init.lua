--Load .lua files
dofile(minetest.get_modpath("mt_mapgen") .. "/biomes.lua")
dofile(minetest.get_modpath("mt_mapgen") .. "/decor.lua")
dofile(minetest.get_modpath("mt_mapgen") .. "/ores.lua")
dofile(minetest.get_modpath("mt_mapgen") .. "/flat.lua")

-- Basic map aliases
minetest.register_alias("mapgen_stone", "mt_nodes:stone")
minetest.register_alias("mapgen_water_source", "mt_nodes:water_source")
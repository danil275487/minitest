--Load .lua files
dofile(core.get_modpath("mini_mapgen") .. "/biomes.lua")
dofile(core.get_modpath("mini_mapgen") .. "/decor.lua")
dofile(core.get_modpath("mini_mapgen") .. "/ores.lua")

-- Basic map aliases
core.register_alias("mapgen_stone", "mini_nodes:stone")
core.register_alias("mapgen_water_source", "mini_liquids:water_source")
core.register_alias("mapgen_river_water_source", "mini_liquids:river_water_source")

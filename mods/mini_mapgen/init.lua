--Load .lua files
mini_core.load_file("biomes")
mini_core.load_file("decor")
mini_core.load_file("ores")

-- Basic map aliases
core.register_alias("mapgen_stone", "mini_nodes:stone")
core.register_alias("mapgen_water_source", "mini_nodes:water_source")
core.register_alias("mapgen_river_water_source", "mini_nodes:river_water_source")

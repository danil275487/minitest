--Aliases for backwards compatibility for commits before 17 Dec. 2024
--Nodes
core.register_alias("mini_liquids:water_source", "mini_nodes:water_source")
core.register_alias("mini_liquids:water_flowing", "mini_nodes:water_flowing")
core.register_alias("mini_liquids:river_water_source", "mini_nodes:river_water_source")
core.register_alias("mini_liquids:river_water_flowing", "mini_nodes:river_water_flowing")
core.register_alias("mini_liquids:lava_source", "mini_nodes:lava_source")
core.register_alias("mini_liquids:lava_flowing", "mini_nodes:lava_flowing")

core.register_alias("mini_chests:chest", "mini_nodes:chest")
core.register_alias("mini_furnaces:furnace", "mini_nodes:furnace")
core.register_alias("mini_furnaces:furnace_active", "mini_nodes:furnace_active")
core.register_alias("mini_furnaces:deep_furnace", "mini_nodes:deep_furnace")
core.register_alias("mini_furnaces:deep_furnace_active", "mini_nodes:deep_furnace_active")

core.register_alias("mini_stairs:stone_stair", "mini_nodes:stone_stair")
core.register_alias("mini_stairs:deep_stone_stair", "mini_nodes:deep_stone_stair")
core.register_alias("mini_stairs:stone_brick_stair", "mini_nodes:stone_bricks_stair")
core.register_alias("mini_stairs:deep_stone_brick_stair", "mini_nodes:deep_stone_bricks_stair")
core.register_alias("mini_stairs:oak_plank_stair", "mini_nodes:oak_planks_stair")
core.register_alias("mini_stairs:stone_slab", "mini_nodes:stone_slab")
core.register_alias("mini_stairs:deep_stone_slab", "mini_nodes:deep_stone_slab")
core.register_alias("mini_stairs:stone_brick_slab", "mini_nodes:stone_bricks_slab")
core.register_alias("mini_stairs:deep_stone_brick_slab", "mini_nodes:deep_stone_bricks_slab")
core.register_alias("mini_stairs:oak_plank_slab", "mini_nodes:oak_planks_slab")

--Items
core.register_alias("mini_buckets:bucket", "mini_items:bucket")
core.register_alias("mini_buckets:water_bucket", "mini_items:water_bucket")
core.register_alias("mini_buckets:river_water_bucket", "mini_items:river_water_bucket")
core.register_alias("mini_buckets:lava_bucket", "mini_items:lava_bucket")

core.register_alias("mini_potions:bottle", "mini_items:bottle")
core.register_alias("mini_potions:water_bottle", "mini_items:water_bottle")
core.register_alias("mini_potions:river_water_bottle", "mini_items:river_water_bottle")
core.register_alias("mini_potions:heal_potion", "mini_items:heal_potion")
core.register_alias("mini_potions:speed_potion", "mini_items:speed_potion")
core.register_alias("mini_potions:jump_potion", "mini_items:jump_potion")
core.register_alias("mini_potions:river_heal_potion", "mini_items:river_heal_potion")
core.register_alias("mini_potions:river_speed_potion", "mini_items:river_speed_potion")
core.register_alias("mini_potions:river_jump_potion", "mini_items:river_jump_potion")

core.register_alias("mini_items:rock", "mini_nodes:rocks")

local tool_materials = {
	"stone",
	"deep_stone",
	"iron",
	"gold",
	"diamond",
	"crystal"
}

for _,v in pairs(tool_materials) do
	core.register_alias("mini_tools:"..v.."_pick_wood_stick", "mini_items:"..v.."_pick_wood_stick")
	core.register_alias("mini_tools:"..v.."_axe_wood_stick", "mini_items:"..v.."_axe_wood_stick")
	for _,v2 in pairs(tool_materials) do
		core.register_alias("mini_tools:"..v.."_pick_"..v2.."_stick", "mini_items:"..v.."_pick_"..v2.."_stick")
		core.register_alias("mini_tools:"..v.."_axe_"..v2.."_stick", "mini_items:"..v.."_axe_"..v2.."_stick")
	end
end

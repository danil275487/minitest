minetest.register_craft({
	type = "toolrepair",
	additional_wear = -0.05,
})

--Crafting
minetest.register_craft({
	output = "mini_nodes:grass",
	recipe = {
		{"mini_items:grass_heap","mini_items:grass_heap"},
		{"mini_nodes:dirt","mini_nodes:dirt"},
		{"mini_nodes:dirt","mini_nodes:dirt"},
	}
})

minetest.register_craft({
	output = "mini_items:oak_plank 4",
	recipe = {
		{"mini_nodes:oak_tree"},
	}
})

minetest.register_craft({
	output = "mini_nodes:gravel",
	recipe = {
		{"mini_nodes:sand","mini_items:rock","mini_nodes:sand"},
		{"mini_items:rock","mini_nodes:sand","mini_items:rock"},
		{"mini_nodes:sand","mini_items:rock","mini_nodes:sand"},
	}
})

minetest.register_craft({
	output = "mini_nodes:gravel",
	recipe = {
		{"mini_items:rock","mini_nodes:sand","mini_items:rock"},
		{"mini_nodes:sand","mini_items:rock","mini_nodes:sand"},
		{"mini_items:rock","mini_nodes:sand","mini_items:rock"},
	}
})

minetest.register_craft({
	output = "mini_nodes:stone",
	recipe = {
		{"mini_items:rock","mini_items:rock","mini_items:rock"},
		{"mini_items:rock","mini_items:rock","mini_items:rock"},
		{"mini_items:rock","mini_items:rock","mini_items:rock"},
	}
})

local ores = {
	coal_lump = {result = "coal"},
	iron_lump = {result = "iron"},
	gold_lump = {result = "gold"},
	diamond = {result = "diamond"},
	crystal = {result = "crystal"},
}

for k,v in pairs(ores) do
	minetest.register_craft({
		output = "mini_nodes:"..v.result.."_ore",
		recipe = {
			{"mini_nodes:stone","mini_nodes:stone","mini_nodes:stone"},
			{"mini_nodes:stone","mini_items:"..k,"mini_nodes:stone"},
			{"mini_nodes:stone","mini_nodes:stone","mini_nodes:stone"},
		}
	})
	minetest.register_craft({
		output = "mini_nodes:deep_"..v.result.."_ore",
		recipe = {
			{"mini_nodes:deep_stone","mini_nodes:deep_stone","mini_nodes:deep_stone"},
			{"mini_nodes:deep_stone","mini_items:"..k,"mini_nodes:deep_stone"},
			{"mini_nodes:deep_stone","mini_nodes:deep_stone","mini_nodes:deep_stone"},
		}
	})
end

minetest.register_craft({
	output = "mini_nodes:oak_planks",
	recipe = {
		{"mini_items:oak_plank","mini_items:oak_plank"},
		{"mini_items:oak_plank","mini_items:oak_plank"},
	}
})

minetest.register_craft({
	output = "mini_nodes:stone_bricks",
	recipe = {
		{"mini_nodes:stone","mini_nodes:stone"},
		{"mini_nodes:stone","mini_nodes:stone"},
	}
})

minetest.register_craft({
	output = "mini_nodes:deep_stone_bricks",
	recipe = {
		{"mini_nodes:deep_stone","mini_nodes:deep_stone"},
		{"mini_nodes:deep_stone","mini_nodes:deep_stone"},
	}
})

minetest.register_craft({
	output = "mini_nodes:chest",
	recipe = {
		{"mini_nodes:oak_planks","mini_nodes:oak_planks","mini_nodes:oak_planks"},
		{"mini_nodes:oak_planks","mini_items:iron_bar","mini_nodes:oak_planks"},
		{"mini_nodes:oak_planks","mini_nodes:oak_planks","mini_nodes:oak_planks"},
	}
})

minetest.register_craft({
	output = "mini_nodes:low_grass",
	recipe = {
		{"mini_items:grass_heap","mini_items:grass_heap","mini_items:grass_heap"},
	}
})

minetest.register_craft({
	output = "mini_nodes:low_grass",
	recipe = {
		{"mini_items:grass_heap","","mini_items:grass_heap"},
		{"mini_items:grass_heap","mini_items:grass_heap","mini_items:grass_heap"},
	}
})

minetest.register_craft({
	output = "mini_nodes:low_grass",
	recipe = {
		{"mini_items:grass_heap","","mini_items:grass_heap"},
		{"mini_items:grass_heap","mini_items:grass_heap","mini_items:grass_heap"},
	}
})

minetest.register_craft({
	output = "mini_nodes:rocks",
	recipe = {
		{"mini_items:rock",""},
		{"","mini_items:rock"},
	},
})

minetest.register_craft({
	output = "mini_nodes:crafting_bench",
	recipe = {
		{"mini_items:oak_plank","mini_items:oak_plank"},
		{"mini_items:stick","mini_items:stick"},
	}
})

minetest.register_craft({
	output = "mini_nodes:furnace",
	recipe = {
		{"mini_nodes:stone","mini_nodes:stone","mini_nodes:stone"},
		{"mini_nodes:stone","","mini_nodes:stone"},
		{"mini_nodes:stone","mini_nodes:stone","mini_nodes:stone"},
	}
})

minetest.register_craft({
	output = "mini_nodes:deep_furnace",
	recipe = {
		{"mini_nodes:deep_stone","mini_nodes:deep_stone","mini_nodes:deep_stone"},
		{"mini_nodes:deep_stone","","mini_nodes:deep_stone"},
		{"mini_nodes:deep_stone","mini_nodes:deep_stone","mini_nodes:deep_stone"},
	}
})


minetest.register_craft({
	output = "mini_nodes:torch",
	recipe = {
		{"mini_items:coal"},
		{"mini_items:stick"},
	}
})

minetest.register_craft({
	output = "mini_items:stick",
	recipe = {
		{"mini_nodes:twig"},
		{"mini_nodes:twig"},
	}
})

minetest.register_craft({
	output = "mini_buckets:bucket",
	recipe = {
		{"mini_items:iron_bar","","mini_items:iron_bar"},
		{"","mini_items:iron_bar",""},
	}
})

minetest.register_craft({
	output = "mini_items:dough",
	recipe = {
		{"mini_items:wheat","mini_items:wheat","mini_items:wheat"},
	}
})

minetest.register_craft({
	output = "mini_items:bottle",
	recipe = {
		{"mini_nodes:glass","","mini_nodes:glass"},
		{"","mini_nodes:glass",""},
	}
})

local materials = {
	rock = {material = "mini_items:rock", output = "stone"},
	deep_stone = {material = "mini_nodes:deep_stone", output = "deep_stone"},
	iron = {material = "mini_items:iron_bar", output = "iron"},
	gold = {material = "mini_items:gold_bar", output = "gold"},
	diamond = {material = "mini_items:diamond", output = "diamond"},
	crystal = {material = "mini_items:crystal", output = "crystal"},
}

for k,v in pairs(materials) do
	minetest.register_craft({
		output = "mini_items:"..v.output.."_stick",
		recipe = {
			{v.material},
			{v.material},
			{v.material},
		}
	})
	minetest.register_craft({
		output = "mini_items:"..v.output.."_axe_head",
		recipe = {
			{v.material,v.material},
			{v.material,""},
		}
	})
	minetest.register_craft({
		output = "mini_items:"..v.output.."_axe_head",
		recipe = {
			{v.material,v.material},
			{"",v.material},
		}
	})
	minetest.register_craft({
		output = "mini_items:"..v.output.."_pick_head",
		recipe = {
				{v.material,v.material,v.material},
		}
	})
	minetest.register_craft({
		output = "mini_items:"..v.output.."_hoe_head",
		recipe = {
				{v.material,v.material},
		}
	})
end

local heads = {
	stone = {},
	deep_stone = {},
	iron = {},
	gold = {},
	diamond = {},
	crystal = {},
}
local sticks = {
	stone = {},
	deep_stone = {},
	iron = {},
	gold = {},
	diamond = {},
	crystal = {},
}

for k,v in pairs(heads) do
	for k2,v2 in pairs(sticks) do
		minetest.register_craft({
			output = "mini_tools:"..k.."_pick_"..k2.."_stick",
			recipe = {
				{"mini_items:"..k.."_pick_head"},
				{"mini_items:"..k2.."_stick"},
			}
		})
		minetest.register_craft({
			output = "mini_tools:"..k.."_axe_"..k2.."_stick",
			recipe = {
				{"mini_items:"..k.."_axe_head"},
				{"mini_items:"..k2.."_stick"},
			}
		})
		minetest.register_craft({
			output = "mini_tools:"..k.."_hoe_"..k2.."_stick",
			recipe = {
				{"mini_items:"..k.."_hoe_head"},
				{"mini_items:"..k2.."_stick"},
			}
		})

		minetest.register_craft({
			output = "mini_tools:"..k.."_pick_wood_stick",
			recipe = {
				{"mini_items:"..k.."_pick_head"},
				{"mini_items:stick"},
			}
		})
		minetest.register_craft({
			output = "mini_tools:"..k.."_axe_wood_stick",
			recipe = {
				{"mini_items:"..k.."_axe_head"},
				{"mini_items:stick"},
			}
		})
		minetest.register_craft({
			output = "mini_tools:"..k.."_hoe_wood_stick",
			recipe = {
				{"mini_items:"..k.."_hoe_head"},
				{"mini_items:stick"},
			}
		})
	end
end

local potions = {
	heal = {material = "mini_items:red_flower", output = "heal_potion"},
	speed = {material = "mini_items:blue_flower", output = "speed_potion"},
	jump = {material = "mini_items:white_flower", output = "jump_potion"},
}

for k,v in pairs(materials) do
	minetest.register_craft({
		output = "mini_potions:"..v.output,
		recipe = {
			{v.material},
			{"mini_potions:water_bottle"},
		}
	})
	minetest.register_craft({
		output = "mini_potions:river_"..v.output,
		recipe = {
			{v.material},
			{"mini_potions:river_water_bottle"},
		}
	})
end

--Smelting
minetest.register_craft({
	type = "cooking",
	output = "mini_items:coal_lump",
	recipe = "mini_nodes:oak_tree",
	cooktime = 8,
})

minetest.register_craft({
	type = "cooking",
	output = "mini_nodes:glass",
	recipe = "mini_nodes:sand",
	cooktime = 15,
})

minetest.register_craft({
	type = "cooking",
	output = "mini_items:iron_bar",
	recipe = "mini_items:iron_lump",
	cooktime = 12,
})

minetest.register_craft({
	type = "cooking",
	output = "mini_items:gold_bar",
	recipe = "mini_items:gold_lump",
	cooktime = 14,
})

minetest.register_craft({
	type = "cooking",
	output = "mini_items:cooked_meat",
	recipe = "mini_items:raw_meat",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "mini_items:bread",
	recipe = "mini_items:dough",
	cooktime = 8,
})

--Fuels
minetest.register_craft({
	type = "fuel",
	recipe = "mini_nodes:oak_tree",
	burntime = 16,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_nodes:oak_planks",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_nodes:twig",
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_nodes:chest",
	burntime = 12,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_nodes:crafting_bench",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_items:grass_heap",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_nodes:red_flower",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_nodes:blue_flower",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_nodes:white_flower",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_items:coal_lump",
	burntime = 20,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_items:oak_plank",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_items:stick",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_items:seeds",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_items:wheat",
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_items:torch",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_items:apple",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_items:bread",
	burntime = 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mini_items:lava_bucket",
	burntime = 35,
})

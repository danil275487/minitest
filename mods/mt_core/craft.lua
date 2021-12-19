minetest.register_craft({
	type = "toolrepair",
	additional_wear = -0.05,
})

--Crafting
minetest.register_craft({
	output = "mt_nodes:grass",
	recipe = {
		{"mt_items:grass_heap","mt_items:grass_heap"},
		{"mt_nodes:dirt","mt_nodes:dirt"},
		{"mt_nodes:dirt","mt_nodes:dirt"},
	}
})

minetest.register_craft({
	output = "mt_items:oak_plank 4",
	recipe = {
		{"mt_nodes:oak_tree"},
	}
})

minetest.register_craft({
	output = "mt_nodes:gravel",
	recipe = {
		{"mt_nodes:sand","mt_items:rock","mt_nodes:sand"},
		{"mt_items:rock","mt_nodes:sand","mt_items:rock"},
		{"mt_nodes:sand","mt_items:rock","mt_nodes:sand"},
	}
})

minetest.register_craft({
	output = "mt_nodes:gravel",
	recipe = {
		{"mt_items:rock","mt_nodes:sand","mt_items:rock"},
		{"mt_nodes:sand","mt_items:rock","mt_nodes:sand"},
		{"mt_items:rock","mt_nodes:sand","mt_items:rock"},
	}
})

minetest.register_craft({
	output = "mt_nodes:stone",
	recipe = {
		{"mt_items:rock","mt_items:rock","mt_items:rock"},
		{"mt_items:rock","mt_items:rock","mt_items:rock"},
		{"mt_items:rock","mt_items:rock","mt_items:rock"},
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
		output = "mt_nodes:"..v.result.."_ore",
		recipe = {
			{"mt_nodes:stone","mt_nodes:stone","mt_nodes:stone"},
			{"mt_nodes:stone","mt_items:"..k,"mt_nodes:stone"},
			{"mt_nodes:stone","mt_nodes:stone","mt_nodes:stone"},
		}
	})
	minetest.register_craft({
		output = "mt_nodes:deep_"..v.result.."_ore",
		recipe = {
			{"mt_nodes:deep_stone","mt_nodes:deep_stone","mt_nodes:deep_stone"},
			{"mt_nodes:deep_stone","mt_items:"..k,"mt_nodes:deep_stone"},
			{"mt_nodes:deep_stone","mt_nodes:deep_stone","mt_nodes:deep_stone"},
		}
	})
end

minetest.register_craft({
	output = "mt_nodes:oak_planks",
	recipe = {
		{"mt_items:oak_plank","mt_items:oak_plank"},
		{"mt_items:oak_plank","mt_items:oak_plank"},
	}
})

minetest.register_craft({
	output = "mt_nodes:stone_bricks",
	recipe = {
		{"mt_nodes:stone","mt_nodes:stone"},
		{"mt_nodes:stone","mt_nodes:stone"},
	}
})

minetest.register_craft({
	output = "mt_nodes:deep_stone_bricks",
	recipe = {
		{"mt_nodes:deep_stone","mt_nodes:deep_stone"},
		{"mt_nodes:deep_stone","mt_nodes:deep_stone"},
	}
})

minetest.register_craft({
	output = "mt_nodes:chest",
	recipe = {
		{"mt_nodes:oak_planks","mt_nodes:oak_planks","mt_nodes:oak_planks"},
		{"mt_nodes:oak_planks","mt_items:iron_bar","mt_nodes:oak_planks"},
		{"mt_nodes:oak_planks","mt_nodes:oak_planks","mt_nodes:oak_planks"},
	}
})

minetest.register_craft({
	output = "mt_nodes:low_grass",
	recipe = {
		{"mt_items:grass_heap","mt_items:grass_heap","mt_items:grass_heap"},
	}
})

minetest.register_craft({
	output = "mt_nodes:low_grass",
	recipe = {
		{"mt_items:grass_heap","","mt_items:grass_heap"},
		{"mt_items:grass_heap","mt_items:grass_heap","mt_items:grass_heap"},
	}
})

minetest.register_craft({
	output = "mt_nodes:low_grass",
	recipe = {
		{"mt_items:grass_heap","","mt_items:grass_heap"},
		{"mt_items:grass_heap","mt_items:grass_heap","mt_items:grass_heap"},
	}
})

minetest.register_craft({
	output = "mt_nodes:rocks",
	recipe = {
		{"mt_items:rock",""},
		{"","mt_items:rock"},
	},
})

minetest.register_craft({
	output = "mt_nodes:crafting_bench",
	recipe = {
		{"mt_items:oak_plank","mt_items:oak_plank"},
		{"mt_items:stick","mt_items:stick"},
	}
})

minetest.register_craft({
	output = "mt_nodes:furnace",
	recipe = {
		{"mt_nodes:stone","mt_nodes:stone","mt_nodes:stone"},
		{"mt_nodes:stone","","mt_nodes:stone"},
		{"mt_nodes:stone","mt_nodes:stone","mt_nodes:stone"},
	}
})

minetest.register_craft({
	output = "mt_nodes:deep_furnace",
	recipe = {
		{"mt_nodes:deep_stone","mt_nodes:deep_stone","mt_nodes:deep_stone"},
		{"mt_nodes:deep_stone","","mt_nodes:deep_stone"},
		{"mt_nodes:deep_stone","mt_nodes:deep_stone","mt_nodes:deep_stone"},
	}
})


minetest.register_craft({
	output = "mt_nodes:torch",
	recipe = {
		{"mt_items:coal"},
		{"mt_items:stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stick",
	recipe = {
		{"mt_nodes:twig"},
		{"mt_nodes:twig"},
	}
})

minetest.register_craft({
	output = "mt_items:bucket",
	recipe = {
		{"mt_items:iron_bar","","mt_items:iron_bar"},
		{"","mt_items:iron_bar",""},
	}
})

minetest.register_craft({
	output = "mt_items:dough",
	recipe = {
		{"mt_items:wheat","mt_items:wheat","mt_items:wheat"},
	}
})

local materials = {
	rock = {material = "mt_items:rock", output = "stone"},
	deep_stone = {material = "mt_nodes:deep_stone", output = "deep_stone"},
	iron = {material = "mt_items:iron_bar", output = "iron"},
	gold = {material = "mt_items:gold_bar", output = "gold"},
	diamond = {material = "mt_items:diamond", output = "diamond"},
	crystal = {material = "mt_items:crystal", output = "crystal"},
}

for k,v in pairs(materials) do
	minetest.register_craft({
		output = "mt_items:"..v.output.."_stick",
		recipe = {
			{v.material},
			{v.material},
			{v.material},
		}
	})
	minetest.register_craft({
		output = "mt_items:"..v.output.."_axe_head",
		recipe = {
			{v.material,v.material},
			{v.material,""},
		}
	})
	minetest.register_craft({
		output = "mt_items:"..v.output.."_axe_head",
		recipe = {
			{v.material,v.material},
			{"",v.material},
		}
	})
	minetest.register_craft({
		output = "mt_items:"..v.output.."_pick_head",
		recipe = {
				{v.material,v.material,v.material},
		}
	})
	minetest.register_craft({
		output = "mt_items:"..v.output.."_hoe_head",
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
			output = "mt_items:"..k.."_pick_"..k2.."_stick",
			recipe = {
				{"mt_items:"..k.."_pick_head"},
				{"mt_items:"..k2.."_stick"},
			}
		})
		minetest.register_craft({
			output = "mt_items:"..k.."_axe_"..k2.."_stick",
			recipe = {
				{"mt_items:"..k.."_axe_head"},
				{"mt_items:"..k2.."_stick"},
			}
		})
		minetest.register_craft({
			output = "mt_items:"..k.."_hoe_"..k2.."_stick",
			recipe = {
				{"mt_items:"..k.."_hoe_head"},
				{"mt_items:"..k2.."_stick"},
			}
		})
		
		minetest.register_craft({
			output = "mt_items:"..k.."_pick_wood_stick",
			recipe = {
				{"mt_items:"..k.."_pick_head"},
				{"mt_items:stick"},
			}
		})
		minetest.register_craft({
			output = "mt_items:"..k.."_axe_wood_stick",
			recipe = {
				{"mt_items:"..k.."_axe_head"},
				{"mt_items:stick"},
			}
		})
		minetest.register_craft({
			output = "mt_items:"..k.."_hoe_wood_stick",
			recipe = {
				{"mt_items:"..k.."_hoe_head"},
				{"mt_items:stick"},
			}
		})
	end
end

--Smelting
minetest.register_craft({
	type = "cooking",
	output = "mt_items:coal_lump",
	recipe = "mt_nodes:oak_tree",
	cooktime = 8,
})

minetest.register_craft({
	type = "cooking",
	output = "mt_nodes:glass",
	recipe = "mt_nodes:sand",
	cooktime = 15,
})

minetest.register_craft({
	type = "cooking",
	output = "mt_items:iron_bar",
	recipe = "mt_items:iron_lump",
	cooktime = 12,
})

minetest.register_craft({
	type = "cooking",
	output = "mt_items:gold_bar",
	recipe = "mt_items:gold_lump",
	cooktime = 14,
})

minetest.register_craft({
	type = "cooking",
	output = "mt_items:cooked_meat",
	recipe = "mt_items:raw_meat",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "mt_items:bread",
	recipe = "mt_items:dough",
	cooktime = 8,
})

--Fuels
minetest.register_craft({
	type = "fuel",
	recipe = "mt_nodes:oak_tree",
	burntime = 16,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_nodes:oak_planks",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_nodes:twig",
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_nodes:chest",
	burntime = 12,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_nodes:crafting_bench",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_items:grass_heap",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_nodes:red_flower",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_nodes:blue_flower",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_nodes:white_flower",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_items:coal_lump",
	burntime = 20,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_items:oak_plank",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_items:stick",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_items:seeds",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_items:wheat",
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_items:torch",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_items:apple",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_items:bread",
	burntime = 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mt_items:lava_bucket",
	burntime = 35,
})
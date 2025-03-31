mini_core.registered_recipes = {}

--Add recipes
core.register_on_mods_loaded(function()
	for k,v in pairs(core.registered_items) do
		if core.get_all_craft_recipes(k) ~= nil then
			for i,v2 in ipairs(core.get_all_craft_recipes(k)) do
				if v2.output ~= "" then
					table.insert(mini_core.registered_recipes, v2)
				end
			end
		end
	end
end)

core.register_craft({
	type = "toolrepair",
	additional_wear = -0.05,
})

--Crafting
core.register_craft({
	output = "mini_nodes:grass",
	recipe = {
		{"mini_items:grass_heap","mini_items:grass_heap"},
		{"mini_nodes:dirt","mini_nodes:dirt"},
		{"mini_nodes:dirt","mini_nodes:dirt"},
	}
})

core.register_craft({
	output = "mini_items:oak_plank 4",
	recipe = {
		{"mini_nodes:oak_tree"},
	}
})

core.register_craft({
	output = "mini_nodes:gravel",
	recipe = {
		{"mini_nodes:sand","mini_items:rock","mini_nodes:sand"},
		{"mini_items:rock","mini_nodes:sand","mini_items:rock"},
		{"mini_nodes:sand","mini_items:rock","mini_nodes:sand"},
	}
})

core.register_craft({
	output = "mini_nodes:gravel",
	recipe = {
		{"mini_items:rock","mini_nodes:sand","mini_items:rock"},
		{"mini_nodes:sand","mini_items:rock","mini_nodes:sand"},
		{"mini_items:rock","mini_nodes:sand","mini_items:rock"},
	}
})

core.register_craft({
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
	core.register_craft({
		output = "mini_nodes:"..v.result.."_ore",
		recipe = {
			{"mini_nodes:stone","mini_nodes:stone","mini_nodes:stone"},
			{"mini_nodes:stone","mini_items:"..k,"mini_nodes:stone"},
			{"mini_nodes:stone","mini_nodes:stone","mini_nodes:stone"},
		}
	})
	core.register_craft({
		output = "mini_nodes:deep_"..v.result.."_ore",
		recipe = {
			{"mini_nodes:deep_stone","mini_nodes:deep_stone","mini_nodes:deep_stone"},
			{"mini_nodes:deep_stone","mini_items:"..k,"mini_nodes:deep_stone"},
			{"mini_nodes:deep_stone","mini_nodes:deep_stone","mini_nodes:deep_stone"},
		}
	})
end

core.register_craft({
	output = "mini_nodes:oak_planks",
	recipe = {
		{"mini_items:oak_plank","mini_items:oak_plank"},
		{"mini_items:oak_plank","mini_items:oak_plank"},
	}
})

core.register_craft({
	output = "mini_nodes:stone_bricks",
	recipe = {
		{"mini_nodes:stone","mini_nodes:stone"},
		{"mini_nodes:stone","mini_nodes:stone"},
	}
})

core.register_craft({
	output = "mini_nodes:deep_stone_bricks",
	recipe = {
		{"mini_nodes:deep_stone","mini_nodes:deep_stone"},
		{"mini_nodes:deep_stone","mini_nodes:deep_stone"},
	}
})

core.register_craft({
	output = "mini_nodes:chest",
	recipe = {
		{"mini_nodes:oak_planks","mini_nodes:oak_planks","mini_nodes:oak_planks"},
		{"mini_nodes:oak_planks","mini_items:iron_bar","mini_nodes:oak_planks"},
		{"mini_nodes:oak_planks","mini_nodes:oak_planks","mini_nodes:oak_planks"},
	}
})

core.register_craft({
	output = "mini_nodes:low_grass",
	recipe = {
		{"mini_items:grass_heap","mini_items:grass_heap","mini_items:grass_heap"},
	}
})

core.register_craft({
	output = "mini_nodes:low_grass",
	recipe = {
		{"mini_items:grass_heap","","mini_items:grass_heap"},
		{"mini_items:grass_heap","mini_items:grass_heap","mini_items:grass_heap"},
	}
})

core.register_craft({
	output = "mini_nodes:low_grass",
	recipe = {
		{"mini_items:grass_heap","","mini_items:grass_heap"},
		{"mini_items:grass_heap","mini_items:grass_heap","mini_items:grass_heap"},
	}
})

core.register_craft({
	output = "mini_nodes:rocks",
	recipe = {
		{"mini_items:rock",""},
		{"","mini_items:rock"},
	},
})

core.register_craft({
	output = "mini_nodes:crafting_bench",
	recipe = {
		{"mini_items:oak_plank","mini_items:oak_plank"},
		{"mini_items:stick","mini_items:stick"},
	}
})

core.register_craft({
	output = "mini_nodes:furnace",
	recipe = {
		{"mini_nodes:stone","mini_nodes:stone","mini_nodes:stone"},
		{"mini_nodes:stone","","mini_nodes:stone"},
		{"mini_nodes:stone","mini_nodes:stone","mini_nodes:stone"},
	}
})

core.register_craft({
	output = "mini_nodes:deep_furnace",
	recipe = {
		{"mini_nodes:deep_stone","mini_nodes:deep_stone","mini_nodes:deep_stone"},
		{"mini_nodes:deep_stone","","mini_nodes:deep_stone"},
		{"mini_nodes:deep_stone","mini_nodes:deep_stone","mini_nodes:deep_stone"},
	}
})


core.register_craft({
	output = "mini_nodes:torch",
	recipe = {
		{"mini_items:coal_lump"},
		{"mini_items:stick"},
	}
})

core.register_craft({
	output = "mini_items:stick",
	recipe = {
		{"mini_nodes:twig"},
		{"mini_nodes:twig"},
	}
})

core.register_craft({
	output = "mini_buckets:bucket",
	recipe = {
		{"mini_items:iron_bar","","mini_items:iron_bar"},
		{"","mini_items:iron_bar",""},
	}
})

core.register_craft({
	output = "mini_items:dough",
	recipe = {
		{"mini_items:wheat","mini_items:wheat","mini_items:wheat"},
	}
})

core.register_craft({
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
	core.register_craft({
		output = "mini_items:"..v.output.."_stick",
		recipe = {
			{v.material},
			{v.material},
			{v.material},
		}
	})
	core.register_craft({
		output = "mini_items:"..v.output.."_axe_head",
		recipe = {
			{v.material,v.material},
			{v.material,""},
		}
	})
	core.register_craft({
		output = "mini_items:"..v.output.."_axe_head",
		recipe = {
			{v.material,v.material},
			{"",v.material},
		}
	})
	core.register_craft({
		output = "mini_items:"..v.output.."_pick_head",
		recipe = {
				{v.material,v.material,v.material},
		}
	})
	core.register_craft({
		output = "mini_items:"..v.output.."_hoe_head",
		recipe = {
				{v.material,v.material},
		}
	})
end

local tool_materials = {
	"stone",
	"deep_stone",
	"iron",
	"gold",
	"diamond",
	"crystal"
}

for _,v in pairs(tool_materials) do
	for _,v2 in pairs(tool_materials) do
		core.register_craft({
			output = "mini_items:"..v.."_pick_"..v2.."_stick",
			recipe = {
				{"mini_items:"..v.."_pick_head"},
				{"mini_items:"..v2.."_stick"},
			}
		})
		core.register_craft({
			output = "mini_items:"..v.."_axe_"..v2.."_stick",
			recipe = {
				{"mini_items:"..v.."_axe_head"},
				{"mini_items:"..v2.."_stick"},
			}
		})
		--[[
		core.register_craft({
			output = "mini_items:"..i.."_hoe_"..i.."_stick",
			recipe = {
				{"mini_items:"..i.."_hoe_head"},
				{"mini_items:"..i.."_stick"},
			}
		})
	--]]
	end
	core.register_craft({
		output = "mini_items:"..v.."_pick_wood_stick",
		recipe = {
			{"mini_items:"..v.."_pick_head"},
			{"mini_items:stick"},
		}
	})
	core.register_craft({
		output = "mini_items:"..v.."_axe_wood_stick",
		recipe = {
			{"mini_items:"..v.."_axe_head"},
			{"mini_items:stick"},
		}
	})
	--[[
	core.register_craft({
	output = "mini_tools:"..i.."_hoe_wood_stick",
	recipe = {
	{"mini_items:"..i.."_hoe_head"},
	{"mini_items:stick"},
	}
	})--]]
end

local potions = {
	heal = {material = "red_flower", output = "heal_potion"},
	speed = {material = "blue_flower", output = "speed_potion"},
	jump = {material = "white_flower", output = "jump_potion"},
}

for k,v in pairs(potions) do
	core.register_craft({
		output = "mini_potions:"..v.output,
		recipe = {
			{"mini_nodes:"..v.material},
			{"mini_items:water_bottle"},
		}
	})
	core.register_craft({
		output = "mini_potions:river_"..v.output,
		recipe = {
			{"mini_nodes:"..v.material},
			{"mini_items:river_water_bottle"},
		}
	})
end

--Smelting
core.register_craft({
	type = "cooking",
	output = "mini_items:coal_lump",
	recipe = "mini_nodes:oak_tree",
	cooktime = 8,
})

core.register_craft({
	type = "cooking",
	output = "mini_nodes:glass",
	recipe = "mini_nodes:sand",
	cooktime = 15,
})

core.register_craft({
	type = "cooking",
	output = "mini_items:iron_bar",
	recipe = "mini_items:iron_lump",
	cooktime = 12,
})

core.register_craft({
	type = "cooking",
	output = "mini_items:gold_bar",
	recipe = "mini_items:gold_lump",
	cooktime = 14,
})

core.register_craft({
	type = "cooking",
	output = "mini_items:cooked_meat",
	recipe = "mini_items:raw_meat",
	cooktime = 10,
})

core.register_craft({
	type = "cooking",
	output = "mini_items:bread",
	recipe = "mini_items:dough",
	cooktime = 8,
})

--Fuels
core.register_craft({
	type = "fuel",
	recipe = "mini_nodes:oak_tree",
	burntime = 16,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_nodes:oak_planks",
	burntime = 15,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_nodes:twig",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_nodes:chest",
	burntime = 12,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_nodes:crafting_bench",
	burntime = 7,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_items:grass_heap",
	burntime = 2,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_nodes:red_flower",
	burntime = 2,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_nodes:blue_flower",
	burntime = 2,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_nodes:white_flower",
	burntime = 2,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_items:coal_lump",
	burntime = 20,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_items:oak_plank",
	burntime = 7,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_items:stick",
	burntime = 5,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_items:seeds",
	burntime = 1,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_items:wheat",
	burntime = 3,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_items:torch",
	burntime = 5,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_items:apple",
	burntime = 5,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_items:bread",
	burntime = 4,
})

core.register_craft({
	type = "fuel",
	recipe = "mini_items:lava_bucket",
	burntime = 35,
})

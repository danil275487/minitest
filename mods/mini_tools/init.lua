--Durability values
local wood_durability = 35
local stone_durability = 80
local deep_stone_durability = 120
local iron_durability = 145
local gold_durability = 40
local diamond_durability = 395
local crystal_durability = 1780

--Tool table
local heads = {
	stone = {
		desc = "Stone",
		times = {[3]=2.50, [2]=3.50},
		level = 0,
		durability = stone_durability
	},
	deep_stone = {
		desc = "Deep Stone",
		times = {[3]=2.25, [2]=3.25},
		level = 0,
		durability = deep_stone_durability
	},
	iron = {
		desc = "Iron",
		image = 2,
		times = {[3]=2.00, [2]=3.00},
		level = 1,
		durability = iron_durability
	},
	gold = {
		desc = "Gold",
		times = {[3]=1.25, [2]=2.00, [1]=3.50},
		level = 1,
		durability = gold_durability
	},
	diamond = {
		desc = "Diamond",
		times = {[3]=0.75, [2]=1.00, [1]=2.25},
		level = 2,
		durability = diamond_durability
	},
	crystal = {
		desc = "Crystal",
		times = {[3]=0.5, [2]=0.75, [1]=1.00},
		level = 3,
		durability = crystal_durability
	},
}
local sticks = {
	wood = {
		durability = wood_durability
	},
	stone = {
		durability = stone_durability
	},
	deep_stone = {
		durability = deep_stone_durability
	},
	iron = {
		durability = iron_durability
	},
	gold = {
		durability = gold_durability
	},
	diamond = {
		durability = diamond_durability
	},
	crystal = {
		durability = crystal_durability
	},
}



for k,v in pairs(heads) do
	for k2,v2 in pairs(sticks) do
		core.register_tool("mini_tools:"..k.."_pick_"..k2.."_stick", {
			description = v.desc.." Pickaxe",
			inventory_image = "mini_"..k2.."_stick.png^mini_"..k.."_pick_head.png",
			tool_capabilities = {
				max_drop_level=0,
				groupcaps={
					cracky={times=v.times, uses=v2.durability+(v.durability/5), maxlevel=v.level},
				},
			},
		})
		core.register_tool("mini_tools:"..k.."_axe_"..k2.."_stick", {
			description = v.desc.." Axe",
			inventory_image = "mini_"..k2.."_stick.png^mini_"..k.."_axe_head.png",
			tool_capabilities = {
				max_drop_level=0,
				groupcaps={
					choppy={times=v.times, uses=v2.durability+(v.durability/5), maxlevel=v.level},
				},
			},
		})
		--[[
		--No hoes for now...
		core.register_tool("mini_tools:"..k.."_hoe_"..k2.."_stick", {
			description = v.desc.." Hoe",
			inventory_image = "mini_"..k2.."_stick.png^mini_"..k.."_hoe_head.png",
			tool_capabilities = {
				damage_groups = {fleshy=1},
				punch_attack_uses = v2.durability+(v.durability/5),
			},
			on_place = hoe_on_place_function(v2.durability+(v.durability/5)),
		})
		--]]
	end
end

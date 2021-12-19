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
		image = 0,
		times = {[3]=2.50, [2]=3.50},
		level = 0,
		durability = stone_durability
	},
	deep_stone = {
		desc = "Deep Stone",
		image = 1,
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
		image = 3,
		times = {[3]=1.25, [2]=2.00, [1]=3.50},
		level = 1,
		durability = gold_durability
	},
	diamond = {
		desc = "Diamond",
		image = 4,
		times = {[3]=0.75, [2]=1.00, [1]=2.25},
		level = 2,
		durability = diamond_durability
	},
	crystal = {
		desc = "Crystal",
		image = 5,
		times = {[3]=0.5, [2]=0.75, [1]=1.00},
		level = 3,
		durability = crystal_durability
	},
}
local sticks = {
	wood = {
		image = 0,
		durability = wood_durability
	},
	stone = {
		image = 1,
		durability = stone_durability
	},
	deep_stone = {
		image = 2,
		durability = deep_stone_durability
	},
	iron = {
		image = 3,
		durability = iron_durability
	},
	gold = {
		image = 4,
		durability = gold_durability
	},
	diamond = {
		image = 5,
		durability = diamond_durability
	},
	crystal = {
		image = 6,
		durability = crystal_durability
	},
}



for k,v in pairs(heads) do
	for k2,v2 in pairs(sticks) do
		minetest.register_tool("mt_items:"..k.."_pick_"..k2.."_stick", {
			description = v.desc.." Pickaxe",
			inventory_image = "mt_item_atlas.png^[sheet:8x8:"..v2.image..",7^(mt_item_atlas.png^[sheet:8x8:"..v.image..",5)",
			tool_capabilities = {
				max_drop_level=0,
				groupcaps={
					cracky={times=v.times, uses=v2.durability+(v.durability/5), maxlevel=v.level},
				},
			},
		})
		minetest.register_tool("mt_items:"..k.."_axe_"..k2.."_stick", {
			description = v.desc.." Axe",
			inventory_image = "mt_item_atlas.png^[sheet:8x8:"..v2.image..",7^(mt_item_atlas.png^[sheet:8x8:"..v.image..",6)",
			tool_capabilities = {
				max_drop_level=0,
				groupcaps={
					choppy={times=v.times, uses=v2.durability+(v.durability/5), maxlevel=v.level},
				},
			},
		})
		minetest.register_tool("mt_items:"..k.."_hoe_"..k2.."_stick", {
			description = v.desc.." Hoe",
			inventory_image = "mt_item_atlas.png^[sheet:8x8:"..v2.image..",7^(mt_item_atlas.png^[sheet:8x8:"..v.image..",4)",
			tool_capabilities = {
				damage_groups = {fleshy=1},
				punch_attack_uses = v2.durability+(v.durability/5),
			},
			on_place = hoe_on_place_function(v2.durability+(v.durability/5)),
		})
	end
end
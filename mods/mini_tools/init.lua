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
	{
		name = "stone",
		description = "Stone",
		times = {[3]=2.50, [2]=3.50},
		level = 0,
		durability = stone_durability
	},
	{
		name = "deep_stone",
		description = "Deep Stone",
		times = {[3]=2.25, [2]=3.25},
		level = 0,
		durability = deep_stone_durability
	},
	{
		name = "iron",
		description = "Iron",
		image = 2,
		times = {[3]=2.00, [2]=3.00},
		level = 1,
		durability = iron_durability
	},
	{
		name = "gold",
		description = "Gold",
		times = {[3]=1.25, [2]=2.00, [1]=3.50},
		level = 1,
		durability = gold_durability
	},
	{
		name = "diamond",
		description = "Diamond",
		times = {[3]=0.75, [2]=1.00, [1]=2.25},
		level = 2,
		durability = diamond_durability
	},
	{
		name = "crystal",
		description = "Crystal",
		times = {[3]=0.5, [2]=0.75, [1]=1.00},
		level = 3,
		durability = crystal_durability
	},
}
local sticks = {
	{
		name = "stone",
		durability = stone_durability
	},
	{
		name = "deep_stone",
		durability = deep_stone_durability
	},
	{
		name = "iron",
		durability = iron_durability
	},
	{
		name = "gold",
		durability = gold_durability
	},
	{
		name = "diamond",
		durability = diamond_durability
	},
	{
		name = "crystal",
		durability = crystal_durability
	},
	{
		name = "wood",
		durability = wood_durability
	},
}



for i,v in pairs(heads) do
	for i2,v2 in pairs(sticks) do
		core.register_tool("mini_tools:"..v.name.."_pick_"..v2.name.."_stick", {
			description = v.description.." Pickaxe",
			inventory_image = mini_core.sheet('item',i2-1,4).."^"..mini_core.sheet('item',i-1,5),
			wear_color = {
				blend = "constant",
				color_stops = {
					[0.00] = "#883932",
					[0.25] = "#8b5429",
					[0.50] = "#bfce72",
					[0.75] = "#94e089",
					[1.00] = "#67b6bd"
				}
			},
			tool_capabilities = {
				max_drop_level=0,
				groupcaps={
					cracky={
						times=v.times, 
						uses=v2.durability+(v.durability/5), 
						maxlevel=v.level
					},
				},
			},
		})
		core.register_tool("mini_tools:"..v.name.."_axe_"..v2.name.."_stick", {
			description = v.description.." Axe",
			inventory_image = mini_core.sheet('item',i2-1,4).."^"..mini_core.sheet('item',i-1,6),
			wear_color = {
				blend = "constant",
				color_stops = {
					[0.00] = "#883932",
					[0.25] = "#8b5429",
					[0.50] = "#bfce72",
					[0.75] = "#94e089",
					[1.00] = "#67b6bd"
				}
			},
			tool_capabilities = {
				max_drop_level=0,
				groupcaps={
					choppy={
						times=v.times,
						uses=v2.durability+(v.durability/5),
						maxlevel=v.level
					},
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

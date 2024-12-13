--Items
core.register_craftitem("mini_items:rock", {
	description = "Rock",
	inventory_image = mini_core.sheet('item',0,0),
})

core.register_craftitem("mini_items:grass_heap", {
	description = "Grass Heap",
	inventory_image = mini_core.sheet('item',3,0),
})

core.register_craftitem("mini_items:coal_lump", {
	description = "Coal Lump",
	inventory_image = mini_core.sheet('item',3,2),
})

core.register_craftitem("mini_items:iron_lump", {
	description = "Iron Lump",
	inventory_image = mini_core.sheet('item',4,2),
})

core.register_craftitem("mini_items:gold_lump", {
	description = "Gold Lump",
	inventory_image = mini_core.sheet('item',5,2),
})

core.register_craftitem("mini_items:diamond", {
	description = "Diamond",
	inventory_image = mini_core.sheet('item',6,2),
})

core.register_craftitem("mini_items:crystal", {
	description = "Crystal",
	inventory_image = mini_core.sheet('item',7,2),
})

core.register_craftitem("mini_items:oak_plank", {
	description = "Oak Plank",
	inventory_image = mini_core.sheet('item',0,2),
})

core.register_craftitem("mini_items:iron_bar", {
	description = "Iron Bar",
	inventory_image = mini_core.sheet('item',1,2),
})

core.register_craftitem("mini_items:gold_bar", {
	description = "Gold Bar",
	inventory_image = mini_core.sheet('item',2,2),
})

core.register_craftitem("mini_items:wheat", {
	description = "Wheat",
	inventory_image = mini_core.sheet('item',2,0),
})

core.register_craftitem("mini_items:bread", {
	description = "Bread",
	inventory_image = mini_core.sheet('item',2,1),
	on_use = core.item_eat(4),
})

core.register_craftitem("mini_items:raw_meat", {
	description = "Raw Meat",
	inventory_image = mini_core.sheet('item',3,1),
	on_use = core.item_eat(1),
})

core.register_craftitem("mini_items:cooked_meat", {
	description = "Cooked Meat",
	inventory_image = mini_core.sheet('item',4,1),
	on_use = core.item_eat(5),
})

core.register_craftitem("mini_items:apple", {
	description = "Apple",
	inventory_image = mini_core.sheet('item',0,1),
	on_use = core.item_eat(2),
})

core.register_craftitem("mini_items:dough", {
	description = "Dough",
	inventory_image = mini_core.sheet('item',1,1),
	on_use = core.item_eat(1),
})

core.register_craftitem("mini_items:seeds", {
	description = "Seeds",
	inventory_image = mini_core.sheet('item',1,0),
	on_place = function(itemstack, placer, pointed_thing)
		--return farming:place_seed(itemstack, placer, pointed_thing, "mt_nodes:wheat_plant_1")
	end
})

core.register_craftitem("mini_items:stick", {
	description = "Stick",
	inventory_image = mini_core.sheet('item',6,4),
})

local materials = {
	{
		name = "stone", description = "Stone"
	},
	{
		name = "deep_stone", description = "Deep Stone"
	},
	{
		name = "iron", description = "Iron"
	},
	{
		name = "gold", description = "Gold"
	},
	{
		name = "diamond", description = "Diamond"
	},
	{
		name = "crystal", description = "Crystal"
	},
}

for i,v in pairs(materials) do
	core.register_craftitem("mini_items:"..v.name.."_stick", {
		description = v.description.." Stick",
		inventory_image = mini_core.sheet('item',i-1,4)
	})
	core.register_craftitem("mini_items:"..v.name.."_pick_head", {
		description = v.description.." Pickaxe Head",
		inventory_image = mini_core.sheet('item',i-1,5)
	})
	core.register_craftitem("mini_items:"..v.name.."_axe_head", {
		description = v.description.." Axe Head",
		inventory_image = mini_core.sheet('item',i-1,6)
	})
	--[[
	core.register_craftitem("mini_items:"..k.."_hoe_head", {
		description = v.." Hoe Head",
		inventory_image = "mini_"..k.."_hoe_head.png",
	})
	--]]
end

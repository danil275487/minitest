--Items
core.register_craftitem("mini_items:rock", {
	description = "Rock",
	inventory_image = "mini_rock.png",
})

core.register_craftitem("mini_items:grass_heap", {
	description = "Grass Heap",
	inventory_image = "mini_grass_heap.png",
})

core.register_craftitem("mini_items:coal_lump", {
	description = "Coal Lump",
	inventory_image = "mini_coal_lump.png",
})

core.register_craftitem("mini_items:iron_lump", {
	description = "Iron Lump",
	inventory_image = "mini_iron_lump.png",
})

core.register_craftitem("mini_items:gold_lump", {
	description = "Gold Lump",
	inventory_image = "mini_gold_lump.png",
})

core.register_craftitem("mini_items:diamond", {
	description = "Diamond",
	inventory_image = "mini_diamond.png",
})

core.register_craftitem("mini_items:crystal", {
	description = "Crystal",
	inventory_image = "mini_crystal.png",
})

core.register_craftitem("mini_items:oak_plank", {
	description = "Oak Plank",
	inventory_image = "mini_oak_plank.png",
})

core.register_craftitem("mini_items:iron_bar", {
	description = "Iron Bar",
	inventory_image = "mini_iron_bar.png",
})

core.register_craftitem("mini_items:gold_bar", {
	description = "Gold Bar",
	inventory_image = "mini_gold_bar.png",
})

core.register_craftitem("mini_items:wheat", {
	description = "Wheat",
	inventory_image = "mini_wheat.png",
})

core.register_craftitem("mini_items:bread", {
	description = "Bread",
	inventory_image = "mini_bread.png",
	on_use = core.item_eat(4),
})

core.register_craftitem("mini_items:cooked_meat", {
	description = "Cooked Meat",
	inventory_image = "mini_cooked_meat.png",
	on_use = core.item_eat(5),
})

core.register_craftitem("mini_items:raw_meat", {
	description = "Raw Meat",
	inventory_image = "mini_raw_meat.png",
	on_use = core.item_eat(1),
})

core.register_craftitem("mini_items:apple", {
	description = "Apple",
	inventory_image = "mini_apple.png",
	on_use = core.item_eat(2),
})

core.register_craftitem("mini_items:dough", {
	description = "Dough",
	inventory_image = "mini_dough.png",
	on_use = core.item_eat(1),
})

core.register_craftitem("mini_items:seeds", {
	description = "Seeds",
	inventory_image = "mini_seeds.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming:place_seed(itemstack, placer, pointed_thing, "mt_nodes:wheat_plant_1")
	end
})

core.register_craftitem("mini_items:stick", {
	description = "Stick",
	inventory_image = "mini_wood_stick.png",
})

local materials = {
	stone = {name = "Stone"},
	deep_stone = {name = "Deep Stone"},
	iron = {name = "Iron"},
	gold = {name = "Gold"},
	diamond = {name = "Diamond"},
	crystal = {name = "Crystal"},
}

for k,v in pairs(materials) do
	core.register_craftitem("mini_items:"..k.."_stick", {
		description = v.name.." Stick",
		inventory_image = "mini_"..k.."_stick.png",
	})
	core.register_craftitem("mini_items:"..k.."_pick_head", {
		description = v.name.." Pickaxe Head",
		inventory_image = "mini_"..k.."_pick_head.png",
	})
	core.register_craftitem("mini_items:"..k.."_axe_head", {
		description = v.name.." Axe Head",
		inventory_image = "mini_"..k.."_axe_head.png",
	})
	core.register_craftitem("mini_items:"..k.."_hoe_head", {
		description = v.name.." Hoe Head",
		inventory_image = "mini_"..k.."_hoe_head.png",
	})
end

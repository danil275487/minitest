--Items
minetest.register_craftitem("mini_items:rock", {
	description = "Rock",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,0",
})

minetest.register_craftitem("mini_items:grass_heap", {
	description = "Grass Heap",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,0",
})

minetest.register_craftitem("mini_items:coal_lump", {
	description = "Coal Lump",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,0",
})

minetest.register_craftitem("mini_items:iron_lump", {
	description = "Iron Lump",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:3,0",
})

minetest.register_craftitem("mini_items:gold_lump", {
	description = "Gold Lump",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:4,0",
})

minetest.register_craftitem("mini_items:diamond", {
	description = "Diamond",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:5,0",
})

minetest.register_craftitem("mini_items:crystal", {
	description = "Crystal",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:6,0",
})

minetest.register_craftitem("mini_items:oak_plank", {
	description = "Oak Plank",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,0",
})

minetest.register_craftitem("mini_items:iron_bar", {
	description = "Iron Bar",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,1",
})

minetest.register_craftitem("mini_items:gold_bar", {
	description = "Gold Bar",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1",
})

minetest.register_craftitem("mini_items:wheat", {
	description = "Wheat",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:3,1",
})

minetest.register_craftitem("mini_items:bread", {
	description = "Bread",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:5,1",
	on_use = minetest.item_eat(4),
})

minetest.register_craftitem("mini_items:cooked_meat", {
	description = "Cooked Meat",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1",
	on_use = minetest.item_eat(5),
})

minetest.register_craftitem("mini_items:raw_meat", {
	description = "Raw Meat",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:6,1",
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("mini_items:apple", {
	description = "Apple",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,2",
	on_use = minetest.item_eat(2),
})

minetest.register_craftitem("mini_items:dough", {
	description = "Dough",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:4,1",
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("mini_items:seeds", {
	description = "Seeds",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,1",
	on_place = function(itemstack, placer, pointed_thing)
		return farming:place_seed(itemstack, placer, pointed_thing, "mt_nodes:wheat_plant_1")
	end
})

minetest.register_craftitem("mini_items:stick", {
	description = "Stick",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,7",
})

local materials = {
	stone = {name = "Stone", image = 1},
	deep_stone = {name = "Deep Stone", image = 2},
	iron = {name = "Iron", image = 3},
	gold = {name = "Gold", image = 4},
	diamond = {name = "Diamond", image = 5},
	crystal = {name = "Crystal", image = 6},
}

for k,v in pairs(materials) do
	minetest.register_craftitem("mini_items:"..k.."_stick", {
		description = v.name.." Stick",
		inventory_image = "mt_item_atlas.png^[sheet:8x8:"..v.image..",7",
	})
	local image = v.image - 1
	minetest.register_craftitem("mini_items:"..k.."_pick_head", {
		description = v.name.." Pickaxe Head",
		inventory_image = "mt_item_atlas.png^[sheet:8x8:"..image..",5",
	})
	minetest.register_craftitem("mini_items:"..k.."_axe_head", {
		description = v.name.." Axe Head",
		inventory_image = "mt_item_atlas.png^[sheet:8x8:"..image..",6",
	})
	minetest.register_craftitem("mini_items:"..k.."_hoe_head", {
		description = v.name.." Hoe Head",
		inventory_image = "mt_item_atlas.png^[sheet:8x8:"..image..",4",
	})
end

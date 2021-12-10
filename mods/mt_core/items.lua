minetest.register_craftitem("mt_core:rock", {
	description = "Rock",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,0",
})

minetest.register_craftitem("mt_core:grass_heap", {
	description = "Grass Heap",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,0",
})

minetest.register_craftitem("mt_core:coal_lump", {
	description = "Coal Lump",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,0",
})

minetest.register_craftitem("mt_core:iron_lump", {
	description = "Iron Lump",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:3,0",
})

minetest.register_craftitem("mt_core:gold_lump", {
	description = "Gold Lump",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:4,0",
})

minetest.register_craftitem("mt_core:diamond", {
	description = "Diamond",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:5,0",
})

minetest.register_craftitem("mt_core:crystal", {
	description = "Crystal",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:6,0",
})

minetest.register_craftitem("mt_core:oak_plank", {
	description = "Oak Plank",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,1",
})

minetest.register_craftitem("mt_core:iron_bar", {
	description = "Iron Bar",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:5,2",
})

minetest.register_craftitem("mt_core:gold_bar", {
	description = "Gold Bar",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:6,2",
})

minetest.register_craftitem("mt_core:stick", {
	description = "Stick",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1",
})

minetest.register_craftitem("mt_core:stone_stick", {
	description = "Stone Stick",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1",
})

minetest.register_craftitem("mt_core:iron_stick", {
	description = "Stone Stick",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2",
})

minetest.register_craftitem("mt_core:gold_stick", {
	description = "Gold Stick",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3",
})

minetest.register_craftitem("mt_core:diamond_stick", {
	description = "Diamond Stick",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3",
})

minetest.register_craftitem("mt_core:crystal_stick", {
	description = "Crystal Stick",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3",
})

minetest.register_craftitem("mt_core:wheat", {
	description = "Wheat",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:6,3",
})

minetest.register_craftitem("mt_core:bread", {
	description = "Bread",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:3,3",
	on_use = minetest.item_eat(4),
})

minetest.register_craftitem("mt_core:cooked_meat", {
	description = "Cooked Meat",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:4,3",
	on_use = minetest.item_eat(5),
})

minetest.register_craftitem("mt_core:raw_meat", {
	description = "Raw Meat",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:5,3",
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("mt_core:apple", {
	description = "Apple",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:4,4",
	on_use = minetest.item_eat(2),
})
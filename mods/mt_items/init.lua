--Load .lua files
dofile(minetest.get_modpath("mt_items") .. "/tools.lua")

--Items
minetest.register_craftitem("mt_items:rock", {
	description = "Rock",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,0",
})

minetest.register_craftitem("mt_items:grass_heap", {
	description = "Grass Heap",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,0",
})

minetest.register_craftitem("mt_items:coal_lump", {
	description = "Coal Lump",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,0",
})

minetest.register_craftitem("mt_items:iron_lump", {
	description = "Iron Lump",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:3,0",
})

minetest.register_craftitem("mt_items:gold_lump", {
	description = "Gold Lump",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:4,0",
})

minetest.register_craftitem("mt_items:diamond", {
	description = "Diamond",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:5,0",
})

minetest.register_craftitem("mt_items:crystal", {
	description = "Crystal",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:6,0",
})

minetest.register_craftitem("mt_items:oak_plank", {
	description = "Oak Plank",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,1",
})

minetest.register_craftitem("mt_items:iron_bar", {
	description = "Iron Bar",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:5,2",
})

minetest.register_craftitem("mt_items:gold_bar", {
	description = "Gold Bar",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:6,2",
})

minetest.register_craftitem("mt_items:stick", {
	description = "Stick",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1",
})

minetest.register_craftitem("mt_items:stone_stick", {
	description = "Stone Stick",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1",
})

minetest.register_craftitem("mt_items:iron_stick", {
	description = "Stone Stick",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2",
})

minetest.register_craftitem("mt_items:gold_stick", {
	description = "Gold Stick",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3",
})

minetest.register_craftitem("mt_items:diamond_stick", {
	description = "Diamond Stick",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3",
})

minetest.register_craftitem("mt_items:crystal_stick", {
	description = "Crystal Stick",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3",
})

minetest.register_craftitem("mt_items:wheat", {
	description = "Wheat",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:6,3",
})

minetest.register_craftitem("mt_items:bread", {
	description = "Bread",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:3,3",
	on_use = minetest.item_eat(4),
})

minetest.register_craftitem("mt_items:cooked_meat", {
	description = "Cooked Meat",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:4,3",
	on_use = minetest.item_eat(5),
})

minetest.register_craftitem("mt_items:raw_meat", {
	description = "Raw Meat",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:5,3",
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("mt_items:apple", {
	description = "Apple",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:4,4",
	on_use = minetest.item_eat(2),
})
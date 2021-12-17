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

minetest.register_craft({
	output = "mt_nodes:coal_ore",
	recipe = {
		{"mt_nodes:stone","mt_nodes:stone","mt_nodes:stone"},
		{"mt_nodes:stone","mt_items:coal_lump","mt_nodes:stone"},
		{"mt_nodes:stone","mt_nodes:stone","mt_nodes:stone"},
	}
})

minetest.register_craft({
	output = "mt_nodes:iron_ore",
	recipe = {
		{"mt_nodes:stone","mt_nodes:stone","mt_nodes:stone"},
		{"mt_nodes:stone","mt_items:iron_lump","mt_nodes:stone"},
		{"mt_nodes:stone","mt_nodes:stone","mt_nodes:stone"},
	}
})

minetest.register_craft({
	output = "mt_nodes:gold_ore",
	recipe = {
		{"mt_nodes:stone","mt_nodes:stone","mt_nodes:stone"},
		{"mt_nodes:stone","mt_items:gold_lump","mt_nodes:stone"},
		{"mt_nodes:stone","mt_nodes:stone","mt_nodes:stone"},
	}
})

minetest.register_craft({
	output = "mt_nodes:diamond_ore",
	recipe = {
		{"mt_nodes:stone","mt_nodes:stone","mt_nodes:stone"},
		{"mt_nodes:stone","mt_items:diamond","mt_nodes:stone"},
		{"mt_nodes:stone","mt_nodes:stone","mt_nodes:stone"},
	}
})

minetest.register_craft({
	output = "mt_nodes:crystal_ore",
	recipe = {
		{"mt_nodes:stone","mt_nodes:stone","mt_nodes:stone"},
		{"mt_nodes:stone","mt_items:crystal","mt_nodes:stone"},
		{"mt_nodes:stone","mt_nodes:stone","mt_nodes:stone"},
	}
})

minetest.register_craft({
	output = "mt_nodes:oak_oak_planks",
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
	type = "shapeless",
	output = "mt_nodes:rocks",
	recipe = {
		"mt_items:rock",
		"mt_items:rock",
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
		{"mt_nodes:twig"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_stick",
	recipe = {
		{"mt_items:rock"},
		{"mt_items:rock"},
		{"mt_items:rock"},
	}
})

minetest.register_craft({
	output = "mt_items:iron_stick",
	recipe = {
		{"mt_items:iron_bar"},
		{"mt_items:iron_bar"},
		{"mt_items:iron_bar"},
	}
})

minetest.register_craft({
	output = "mt_items:gold_stick",
	recipe = {
		{"mt_items:gold_bar"},
		{"mt_items:gold_bar"},
		{"mt_items:gold_bar"},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_stick",
	recipe = {
		{"mt_items:diamond"},
		{"mt_items:diamond"},
		{"mt_items:diamond"},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_stick",
	recipe = {
		{"mt_items:crystal"},
		{"mt_items:crystal"},
		{"mt_items:crystal"},
	}
})

minetest.register_craft({
	output = "mt_items:dough",
	recipe = {
		{"mt_items:wheat","mt_items:wheat","mt_items:wheat"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_axe_head",
	recipe = {
		{"mt_items:rock","mt_items:rock"},
		{"","mt_items:rock"},
	}
})

minetest.register_craft({
	output = "mt_items:iron_axe_head",
	recipe = {
		{"mt_items:iron_bar","mt_items:iron_bar"},
		{"","mt_items:iron_bar"},
	}
})

minetest.register_craft({
	output = "mt_items:gold_axe_head",
	recipe = {
		{"mt_items:gold_bar","mt_items:gold_bar"},
		{"","mt_items:gold_bar"},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_axe_head",
	recipe = {
		{"mt_items:diamond","mt_items:diamond"},
		{"","mt_items:diamond"},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_axe_head",
	recipe = {
		{"mt_items:crystal","mt_items:crystal"},
		{"","mt_items:crystal"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_axe_head",
	recipe = {
		{"mt_items:rock","mt_items:rock"},
		{"mt_items:rock",""},
	}
})

minetest.register_craft({
	output = "mt_items:iron_axe_head",
	recipe = {
		{"mt_items:iron_bar","mt_items:iron_bar"},
		{"mt_items:iron_bar",""},
	}
})

minetest.register_craft({
	output = "mt_items:gold_axe_head",
	recipe = {
		{"mt_items:gold_bar","mt_items:gold_bar"},
		{"mt_items:gold_bar",""},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_axe_head",
	recipe = {
		{"mt_items:diamond","mt_items:diamond"},
		{"mt_items:diamond",""},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_axe_head",
	recipe = {
		{"mt_items:crystal","mt_items:crystal"},
		{"mt_items:crystal",""},
	}
})

minetest.register_craft({
	output = "mt_items:stone_pick_head",
	recipe = {
		{"mt_items:rock","mt_items:rock","mt_items:rock"},
	}
})

minetest.register_craft({
	output = "mt_items:iron_pick_head",
	recipe = {
		{"mt_items:iron_bar","mt_items:iron_bar","mt_items:iron_bar"},
	}
})

minetest.register_craft({
	output = "mt_items:gold_pick_head",
	recipe = {
		{"mt_items:gold_bar","mt_items:gold_bar","mt_items:gold_bar"},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_pick_head",
	recipe = {
		{"mt_items:diamond","mt_items:diamond","mt_items:diamond"},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_pick_head",
	recipe = {
		{"mt_items:crystal","mt_items:crystal","mt_items:crystal"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_hoe_head",
	recipe = {
		{"mt_items:rock","mt_items:rock"},
	}
})

minetest.register_craft({
	output = "mt_items:iron_hoe_head",
	recipe = {
		{"mt_items:iron_bar","mt_items:iron_bar"},
	}
})

minetest.register_craft({
	output = "mt_items:gold_hoe_head",
	recipe = {
		{"mt_items:gold_bar","mt_items:gold_bar"},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_hoe_head",
	recipe = {
		{"mt_items:diamond","mt_items:diamond"},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_hoe_head",
	recipe = {
		{"mt_items:crystal","mt_items:crystal"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_pick_wood_stick",
	recipe = {
		{"mt_items:stone_pick_head"},
		{"mt_items:stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_pick_stone_stick",
	recipe = {
		{"mt_items:stone_pick_head"},
		{"mt_items:stone_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_pick_iron_stick",
	recipe = {
		{"mt_items:stone_pick_head"},
		{"mt_items:iron_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_pick_gold_stick",
	recipe = {
		{"mt_items:stone_pick_head"},
		{"mt_items:gold_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_pick_diamond_stick",
	recipe = {
		{"mt_items:stone_pick_head"},
		{"mt_items:diamond_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_pick_crystal_stick",
	recipe = {
		{"mt_items:stone_pick_head"},
		{"mt_items:crystal_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_axe_wood_stick",
	recipe = {
		{"mt_items:stone_axe_head"},
		{"mt_items:stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_axe_stone_stick",
	recipe = {
		{"mt_items:stone_axe_head"},
		{"mt_items:stone_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_axe_iron_stick",
	recipe = {
		{"mt_items:stone_axe_head"},
		{"mt_items:iron_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_axe_gold_stick",
	recipe = {
		{"mt_items:stone_axe_head"},
		{"mt_items:gold_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_axe_diamond_stick",
	recipe = {
		{"mt_items:stone_axe_head"},
		{"mt_items:diamond_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_axe_crystal_stick",
	recipe = {
		{"mt_items:stone_axe_head"},
		{"mt_items:crystal_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:iron_pick_wood_stick",
	recipe = {
		{"mt_items:iron_pick_head"},
		{"mt_items:stick"},
	}
})

minetest.register_craft({
	output = "mt_items:iron_pick_stone_stick",
	recipe = {
		{"mt_items:iron_pick_head"},
		{"mt_items:stone_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:iron_pick_iron_stick",
	recipe = {
		{"mt_items:iron_pick_head"},
		{"mt_items:iron_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:iron_pick_gold_stick",
	recipe = {
		{"mt_items:iron_pick_head"},
		{"mt_items:gold_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:iron_pick_diamond_stick",
	recipe = {
		{"mt_items:iron_pick_head"},
		{"mt_items:diamond_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:iron_pick_crystal_stick",
	recipe = {
		{"mt_items:iron_pick_head"},
		{"mt_items:crystal_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:iron_axe_wood_stick",
	recipe = {
		{"mt_items:iron_axe_head"},
		{"mt_items:stick"},
	}
})

minetest.register_craft({
	output = "mt_items:iron_axe_stone_stick",
	recipe = {
		{"mt_items:iron_axe_head"},
		{"mt_items:stone_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:iron_axe_iron_stick",
	recipe = {
		{"mt_items:iron_axe_head"},
		{"mt_items:iron_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:iron_axe_gold_stick",
	recipe = {
		{"mt_items:iron_axe_head"},
		{"mt_items:gold_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:iron_axe_diamond_stick",
	recipe = {
		{"mt_items:iron_axe_head"},
		{"mt_items:diamond_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:iron_axe_crystal_stick",
	recipe = {
		{"mt_items:iron_axe_head"},
		{"mt_items:crystal_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:gold_pick_wood_stick",
	recipe = {
		{"mt_items:gold_pick_head"},
		{"mt_items:stick"},
	}
})

minetest.register_craft({
	output = "mt_items:gold_pick_stone_stick",
	recipe = {
		{"mt_items:gold_pick_head"},
		{"mt_items:stone_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:gold_pick_iron_stick",
	recipe = {
		{"mt_items:gold_pick_head"},
		{"mt_items:iron_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:gold_pick_gold_stick",
	recipe = {
		{"mt_items:gold_pick_head"},
		{"mt_items:gold_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:gold_pick_diamond_stick",
	recipe = {
		{"mt_items:gold_pick_head"},
		{"mt_items:diamond_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:gold_pick_crystal_stick",
	recipe = {
		{"mt_items:gold_pick_head"},
		{"mt_items:crystal_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:gold_axe_wood_stick",
	recipe = {
		{"mt_items:gold_axe_head"},
		{"mt_items:stick"},
	}
})

minetest.register_craft({
	output = "mt_items:gold_axe_stone_stick",
	recipe = {
		{"mt_items:gold_axe_head"},
		{"mt_items:stone_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:gold_axe_iron_stick",
	recipe = {
		{"mt_items:gold_axe_head"},
		{"mt_items:iron_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:gold_axe_gold_stick",
	recipe = {
		{"mt_items:gold_axe_head"},
		{"mt_items:gold_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:gold_axe_diamond_stick",
	recipe = {
		{"mt_items:gold_axe_head"},
		{"mt_items:diamond_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:gold_axe_crystal_stick",
	recipe = {
		{"mt_items:gold_axe_head"},
		{"mt_items:crystal_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_pick_wood_stick",
	recipe = {
		{"mt_items:diamond_pick_head"},
		{"mt_items:stick"},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_pick_stone_stick",
	recipe = {
		{"mt_items:diamond_pick_head"},
		{"mt_items:stone_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_pick_iron_stick",
	recipe = {
		{"mt_items:diamond_pick_head"},
		{"mt_items:iron_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_pick_gold_stick",
	recipe = {
		{"mt_items:diamond_pick_head"},
		{"mt_items:gold_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_pick_diamond_stick",
	recipe = {
		{"mt_items:diamond_pick_head"},
		{"mt_items:diamond_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_pick_crystal_stick",
	recipe = {
		{"mt_items:diamond_pick_head"},
		{"mt_items:crystal_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_axe_wood_stick",
	recipe = {
		{"mt_items:diamond_axe_head"},
		{"mt_items:stick"},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_axe_stone_stick",
	recipe = {
		{"mt_items:diamond_axe_head"},
		{"mt_items:stone_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_axe_iron_stick",
	recipe = {
		{"mt_items:diamond_axe_head"},
		{"mt_items:iron_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_axe_gold_stick",
	recipe = {
		{"mt_items:diamond_axe_head"},
		{"mt_items:gold_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_axe_diamond_stick",
	recipe = {
		{"mt_items:diamond_axe_head"},
		{"mt_items:diamond_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:diamond_axe_crystal_stick",
	recipe = {
		{"mt_items:diamond_axe_head"},
		{"mt_items:crystal_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_pick_wood_stick",
	recipe = {
		{"mt_items:crystal_pick_head"},
		{"mt_items:stick"},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_pick_stone_stick",
	recipe = {
		{"mt_items:crystal_pick_head"},
		{"mt_items:stone_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_pick_iron_stick",
	recipe = {
		{"mt_items:crystal_pick_head"},
		{"mt_items:iron_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_pick_gold_stick",
	recipe = {
		{"mt_items:crystal_pick_head"},
		{"mt_items:gold_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_pick_diamond_stick",
	recipe = {
		{"mt_items:crystal_pick_head"},
		{"mt_items:diamond_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_pick_crystal_stick",
	recipe = {
		{"mt_items:crystal_pick_head"},
		{"mt_items:crystal_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_axe_wood_stick",
	recipe = {
		{"mt_items:crystal_axe_head"},
		{"mt_items:stick"},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_axe_stone_stick",
	recipe = {
		{"mt_items:crystal_axe_head"},
		{"mt_items:stone_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_axe_iron_stick",
	recipe = {
		{"mt_items:crystal_axe_head"},
		{"mt_items:iron_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_axe_gold_stick",
	recipe = {
		{"mt_items:crystal_axe_head"},
		{"mt_items:gold_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_axe_diamond_stick",
	recipe = {
		{"mt_items:crystal_axe_head"},
		{"mt_items:diamond_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:crystal_axe_crystal_stick",
	recipe = {
		{"mt_items:crystal_axe_head"},
		{"mt_items:crystal_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_hoe_wood_stick",
	recipe = {
		{"mt_items:stone_hoe_head"},
		{"mt_items:stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_hoe_stone_stick",
	recipe = {
		{"mt_items:stone_hoe_head"},
		{"mt_items:stone_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_hoe_iron_stick",
	recipe = {
		{"mt_items:stone_hoe_head"},
		{"mt_items:iron_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_hoe_gold_stick",
	recipe = {
		{"mt_items:stone_hoe_head"},
		{"mt_items:gold_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_hoe_diamond_stick",
	recipe = {
		{"mt_items:stone_hoe_head"},
		{"mt_items:diamond_stick"},
	}
})

minetest.register_craft({
	output = "mt_items:stone_hoe_crystal_stick",
	recipe = {
		{"mt_items:stone_hoe_head"},
		{"mt_items:crystal_stick"},
	}
})

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
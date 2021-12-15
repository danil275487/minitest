--Durability values
local wood_durability = 35
local stone_durability = 80
local iron_durability = 145
local gold_durability = 40
local diamond_durability = 395
local crystal_durability = 1780

--Stone heads
minetest.register_tool("mt_items:stone_pick_wood_stick", {
	description = "Stone Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1^(mt_item_atlas.png^[sheet:8x8:0,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=2.50, [2]=3.50}, uses=wood_durability+(stone_durability/5), maxlevel=0}
		},
	},
})

minetest.register_tool("mt_items:stone_pick_stone_stick", {
	description = "Stone Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1^(mt_item_atlas.png^[sheet:8x8:0,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=2.50, [2]=3.50}, uses=stone_durability+(stone_durability/5), maxlevel=0}
		},
	},
})

minetest.register_tool("mt_items:stone_pick_iron_stick", {
	description = "Stone Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2^(mt_item_atlas.png^[sheet:8x8:0,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=2.50, [2]=3.50}, uses=iron_durability+(stone_durability/5), maxlevel=0}
		},
	},
})

minetest.register_tool("mt_items:stone_pick_gold_stick", {
	description = "Stone Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3^(mt_item_atlas.png^[sheet:8x8:0,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=2.50, [2]=3.50}, uses=gold_durability+(stone_durability/5), maxlevel=0}
		},
	},
})

minetest.register_tool("mt_items:stone_pick_diamond_stick", {
	description = "Stone Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3^(mt_item_atlas.png^[sheet:8x8:0,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=2.50, [2]=3.50}, uses=diamond_durability+(stone_durability/5), maxlevel=0}
		},
	},
})

minetest.register_tool("mt_items:stone_pick_crystal_stick", {
	description = "Stone Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3^(mt_item_atlas.png^[sheet:8x8:0,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=2.50, [2]=3.50}, uses=crystal_durability+(stone_durability/5), maxlevel=0}
		},
	},
})

minetest.register_tool("mt_items:stone_axe_wood_stick", {
	description = "Stone Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1^(mt_item_atlas.png^[sheet:8x8:2,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=2.50, [2]=3.50}, uses=wood_durability+(stone_durability/5), maxlevel=0}
		},
	},
})

minetest.register_tool("mt_items:stone_axe_stone_stick", {
	description = "Stone Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1^(mt_item_atlas.png^[sheet:8x8:2,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=2.50, [2]=3.50}, uses=stone_durability+(stone_durability/5), maxlevel=0}
		},
	},
})

minetest.register_tool("mt_items:stone_axe_iron_stick", {
	description = "Stone Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2^(mt_item_atlas.png^[sheet:8x8:2,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=2.50, [2]=3.50}, uses=iron_durability+(stone_durability/5), maxlevel=0}
		},
	},
})

minetest.register_tool("mt_items:stone_axe_gold_stick", {
	description = "Stone Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3^(mt_item_atlas.png^[sheet:8x8:2,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=2.50, [2]=3.50}, uses=gold_durability+(stone_durability/5), maxlevel=0}
		},
	},
})

minetest.register_tool("mt_items:stone_axe_diamond_stick", {
	description = "Stone Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3^(mt_item_atlas.png^[sheet:8x8:2,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=2.50, [2]=3.50}, uses=diamond_durability+(stone_durability/5), maxlevel=0}
		},
	},
})

minetest.register_tool("mt_items:stone_axe_crystal_stick", {
	description = "Stone Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3^(mt_item_atlas.png^[sheet:8x8:2,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=2.50, [2]=3.50}, uses=crystal_durability+(stone_durability/5), maxlevel=0}
		},
	},
})

minetest.register_tool("mt_items:stone_hoe_wood_stick", {
	description = "Stone Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1^(mt_item_atlas.png^[sheet:8x8:7,3)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = wood_durability+(stone_durability/5),
	},
	on_place = hoe_on_place_function(wood_durability+(stone_durability/5)),
})

minetest.register_tool("mt_items:stone_hoe_stone_stick", {
	description = "Stone Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1^(mt_item_atlas.png^[sheet:8x8:7,3)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = stone_durability+(stone_durability/5),
	},
	on_place = hoe_on_place_function(stone_durability+(stone_durability/5)),
})

minetest.register_tool("mt_items:stone_hoe_iron_stick", {
	description = "Stone Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2^(mt_item_atlas.png^[sheet:8x8:7,3)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = iron_durability+(stone_durability/5),
	},
	on_place = hoe_on_place_function(iron_durability+(stone_durability/5)),
})

minetest.register_tool("mt_items:stone_hoe_gold_stick", {
	description = "Stone Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3^(mt_item_atlas.png^[sheet:8x8:7,3)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = gold_durability+(stone_durability/5),
	},
	on_place = hoe_on_place_function(gold_durability+(stone_durability/5)),
})

minetest.register_tool("mt_items:stone_hoe_diamond_stick", {
	description = "Stone Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3^(mt_item_atlas.png^[sheet:8x8:7,3)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = diamond_durability+(stone_durability/5),
	},
	on_place = hoe_on_place_function(diamond_durability+(stone_durability/5)),
})

minetest.register_tool("mt_items:stone_hoe_crystal_stick", {
	description = "Stone Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3^(mt_item_atlas.png^[sheet:8x8:7,3)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = crystal_durability+(stone_durability/5),
	},
	on_place = hoe_on_place_function(crystal_durability+(stone_durability/5)),
})

--Iron heads
minetest.register_tool("mt_items:iron_pick_wood_stick", {
	description = "Iron Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1^(mt_item_atlas.png^[sheet:8x8:1,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=2.00, [2]=3.00}, uses=wood_durability+(iron_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:iron_pick_stone_stick", {
	description = "Iron Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1^(mt_item_atlas.png^[sheet:8x8:1,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=2.00, [2]=3.00}, uses=stone_durability+(iron_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:iron_pick_iron_stick", {
	description = "Iron Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2^(mt_item_atlas.png^[sheet:8x8:1,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=2.00, [2]=3.00}, uses=iron_durability+(iron_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:iron_pick_gold_stick", {
	description = "Iron Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3^(mt_item_atlas.png^[sheet:8x8:1,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=2.00, [2]=3.00}, uses=gold_durability+(iron_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:iron_pick_diamond_stick", {
	description = "Iron Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3^(mt_item_atlas.png^[sheet:8x8:1,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=2.00, [2]=3.00}, uses=diamond_durability+(iron_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:iron_pick_crystal_stick", {
	description = "Iron Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3^(mt_item_atlas.png^[sheet:8x8:1,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=2.00, [2]=3.00}, uses=crystal_durability+(iron_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:iron_axe_wood_stick", {
	description = "Iron Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1^(mt_item_atlas.png^[sheet:8x8:3,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=2.00, [2]=3.00}, uses=wood_durability+(iron_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:iron_axe_stone_stick", {
	description = "Iron Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1^(mt_item_atlas.png^[sheet:8x8:3,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=2.00, [2]=3.00}, uses=stone_durability+(iron_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:iron_axe_iron_stick", {
	description = "Iron Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2^(mt_item_atlas.png^[sheet:8x8:3,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=2.00, [2]=3.00}, uses=iron_durability+(iron_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:iron_axe_gold_stick", {
	description = "Iron Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3^(mt_item_atlas.png^[sheet:8x8:3,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=2.00, [2]=3.00}, uses=gold_durability+(iron_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:iron_axe_diamond_stick", {
	description = "Iron Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3^(mt_item_atlas.png^[sheet:8x8:3,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=2.00, [2]=3.00}, uses=diamond_durability+(iron_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:iron_axe_crystal_stick", {
	description = "Iron Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3^(mt_item_atlas.png^[sheet:8x8:3,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=2.00, [2]=3.00}, uses=crystal_durability+(iron_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:iron_hoe_wood_stick", {
	description = "Iron Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1^(mt_item_atlas.png^[sheet:8x8:0,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = wood_durability+(iron_durability/5),
	},
	on_place = hoe_on_place_function(wood_durability+(iron_durability/5)),
})

minetest.register_tool("mt_items:iron_hoe_stone_stick", {
	description = "Iron Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1^(mt_item_atlas.png^[sheet:8x8:0,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = stone_durability+(iron_durability/5),
	},
	on_place = hoe_on_place_function(stone_durability+(iron_durability/5)),
})

minetest.register_tool("mt_items:iron_hoe_iron_stick", {
	description = "Iron Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2^(mt_item_atlas.png^[sheet:8x8:0,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = iron_durability+(iron_durability/5),
	},
	on_place = hoe_on_place_function(iron_durability+(iron_durability/5)),
})

minetest.register_tool("mt_items:iron_hoe_gold_stick", {
	description = "Iron Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3^(mt_item_atlas.png^[sheet:8x8:0,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = gold_durability+(iron_durability/5),
	},
	on_place = hoe_on_place_function(gold_durability+(iron_durability/5)),
})

minetest.register_tool("mt_items:iron_hoe_diamond_stick", {
	description = "Iron Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3^(mt_item_atlas.png^[sheet:8x8:0,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = diamond_durability+(iron_durability/5),
	},
	on_place = hoe_on_place_function(diamond_durability+(iron_durability/5)),
})

minetest.register_tool("mt_items:iron_hoe_crystal_stick", {
	description = "Iron Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3^(mt_item_atlas.png^[sheet:8x8:0,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = crystal_durability+(iron_durability/5),
	},
	on_place = hoe_on_place_function(crystal_durability+(iron_durability/5)),
})

--Gold heads
minetest.register_tool("mt_items:gold_pick_wood_stick", {
	description = "Gold Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1^(mt_item_atlas.png^[sheet:8x8:2,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=1.25, [2]=2.00, [1]=3.50}, uses=wood_durability+(gold_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:gold_pick_stone_stick", {
	description = "Gold Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1^(mt_item_atlas.png^[sheet:8x8:2,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=1.25, [2]=2.00, [1]=3.50}, uses=stone_durability+(gold_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:gold_pick_iron_stick", {
	description = "Gold Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2^(mt_item_atlas.png^[sheet:8x8:2,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=1.25, [2]=2.00, [1]=3.50}, uses=iron_durability+(gold_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:gold_pick_gold_stick", {
	description = "Gold Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3^(mt_item_atlas.png^[sheet:8x8:2,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=1.25, [2]=2.00, [1]=3.50}, uses=gold_durability+(gold_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:gold_pick_diamond_stick", {
	description = "Gold Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3^(mt_item_atlas.png^[sheet:8x8:2,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=1.25, [2]=2.00, [1]=3.50}, uses=diamond_durability+(gold_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:gold_pick_crystal_stick", {
	description = "Gold Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3^(mt_item_atlas.png^[sheet:8x8:2,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=1.25, [2]=2.00, [1]=3.50}, uses=crystal_durability+(gold_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:gold_axe_wood_stick", {
	description = "Gold Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1^(mt_item_atlas.png^[sheet:8x8:4,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=1.25, [2]=2.00, [1]=3.50}, uses=wood_durability+(gold_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:gold_axe_stone_stick", {
	description = "Gold Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1^(mt_item_atlas.png^[sheet:8x8:4,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=1.25, [2]=2.00, [1]=3.50}, uses=stone_durability+(gold_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:gold_axe_iron_stick", {
	description = "Gold Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2^(mt_item_atlas.png^[sheet:8x8:4,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=1.25, [2]=2.00, [1]=3.50}, uses=iron_durability+(gold_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:gold_axe_gold_stick", {
	description = "Gold Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3^(mt_item_atlas.png^[sheet:8x8:4,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=1.25, [2]=2.00, [1]=3.50}, uses=gold_durability+(gold_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:gold_axe_diamond_stick", {
	description = "Gold Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3^(mt_item_atlas.png^[sheet:8x8:4,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=1.25, [2]=2.00, [1]=3.50}, uses=diamond_durability+(gold_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:gold_axe_crystal_stick", {
	description = "Gold Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3^(mt_item_atlas.png^[sheet:8x8:4,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=1.25, [2]=2.00, [1]=3.50}, uses=crystal_durability+(gold_durability/5), maxlevel=1}
		},
	},
})

minetest.register_tool("mt_items:gold_hoe_wood_stick", {
	description = "Gold Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1^(mt_item_atlas.png^[sheet:8x8:1,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = wood_durability+(gold_durability/5),
	},
	on_place = hoe_on_place_function(wood_durability+(gold_durability/5)),
})

minetest.register_tool("mt_items:gold_hoe_stone_stick", {
	description = "Gold Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1^(mt_item_atlas.png^[sheet:8x8:1,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = stone_durability+(gold_durability/5),
	},
	on_place = hoe_on_place_function(stone_durability+(gold_durability/5)),
})

minetest.register_tool("mt_items:gold_hoe_iron_stick", {
	description = "Gold Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2^(mt_item_atlas.png^[sheet:8x8:1,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = iron_durability+(gold_durability/5),
	},
	on_place = hoe_on_place_function(iron_durability+(gold_durability/5)),
})

minetest.register_tool("mt_items:gold_hoe_gold_stick", {
	description = "Gold Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3^(mt_item_atlas.png^[sheet:8x8:1,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = gold_durability+(gold_durability/5),
	},
	on_place = hoe_on_place_function(gold_durability+(gold_durability/5)),
})

minetest.register_tool("mt_items:gold_hoe_diamond_stick", {
	description = "Gold Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3^(mt_item_atlas.png^[sheet:8x8:1,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = diamond_durability+(gold_durability/5),
	},
	on_place = hoe_on_place_function(diamond_durability+(gold_durability/5)),
})

minetest.register_tool("mt_items:gold_hoe_crystal_stick", {
	description = "Gold Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3^(mt_item_atlas.png^[sheet:8x8:1,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = crystal_durability+(gold_durability/5),
	},
	on_place = hoe_on_place_function(crystal_durability+(gold_durability/5)),
})

--Diamond heads
minetest.register_tool("mt_items:diamond_pick_wood_stick", {
	description = "Diamond Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1^(mt_item_atlas.png^[sheet:8x8:3,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=0.75, [2]=1.00, [1]=2.25}, uses=wood_durability+(diamond_durability/5), maxlevel=2}
		},
	},
})

minetest.register_tool("mt_items:diamond_pick_stone_stick", {
	description = "Diamond Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1^(mt_item_atlas.png^[sheet:8x8:3,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=0.75, [2]=1.00, [1]=2.25}, uses=stone_durability+(diamond_durability/5), maxlevel=2}
		},
	},
})

minetest.register_tool("mt_items:diamond_pick_iron_stick", {
	description = "Diamond Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2^(mt_item_atlas.png^[sheet:8x8:3,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=0.75, [2]=1.00, [1]=2.25}, uses=iron_durability+(diamond_durability/5), maxlevel=2}
		},
	},
})

minetest.register_tool("mt_items:diamond_pick_gold_stick", {
	description = "Diamond Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3^(mt_item_atlas.png^[sheet:8x8:3,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=0.75, [2]=1.00, [1]=2.25}, uses=gold_durability+(diamond_durability/5), maxlevel=2}
		},
	},
})

minetest.register_tool("mt_items:diamond_pick_diamond_stick", {
	description = "Diamond Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3^(mt_item_atlas.png^[sheet:8x8:3,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=0.75, [2]=1.00, [1]=2.25}, uses=diamond_durability+(diamond_durability/5), maxlevel=2}
		},
	},
})

minetest.register_tool("mt_items:diamond_pick_crystal_stick", {
	description = "Diamond Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3^(mt_item_atlas.png^[sheet:8x8:3,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=0.75, [2]=1.00, [1]=2.25}, uses=crystal_durability+(diamond_durability/5), maxlevel=2}
		},
	},
})

minetest.register_tool("mt_items:diamond_axe_wood_stick", {
	description = "Diamond Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1^(mt_item_atlas.png^[sheet:8x8:5,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=0.75, [2]=1.00, [1]=2.25}, uses=wood_durability+(diamond_durability/5), maxlevel=2}
		},
	},
})

minetest.register_tool("mt_items:diamond_axe_stone_stick", {
	description = "Diamond Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1^(mt_item_atlas.png^[sheet:8x8:5,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=0.75, [2]=1.00, [1]=2.25}, uses=stone_durability+(diamond_durability/5), maxlevel=2}
		},
	},
})

minetest.register_tool("mt_items:diamond_axe_iron_stick", {
	description = "Diamond Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2^(mt_item_atlas.png^[sheet:8x8:5,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=0.75, [2]=1.00, [1]=2.25}, uses=iron_durability+(diamond_durability/5), maxlevel=2}
		},
	},
})

minetest.register_tool("mt_items:diamond_axe_gold_stick", {
	description = "Diamond Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3^(mt_item_atlas.png^[sheet:8x8:5,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=0.75, [2]=1.00, [1]=2.25}, uses=gold_durability+(diamond_durability/5), maxlevel=2}
		},
	},
})

minetest.register_tool("mt_items:diamond_axe_diamond_stick", {
	description = "Diamond Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3^(mt_item_atlas.png^[sheet:8x8:5,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=0.75, [2]=1.00, [1]=2.25}, uses=diamond_durability+(diamond_durability/5), maxlevel=2}
		},
	},
})

minetest.register_tool("mt_items:diamond_axe_crystal_stick", {
	description = "Diamond Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3^(mt_item_atlas.png^[sheet:8x8:5,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=0.75, [2]=1.00, [1]=2.25}, uses=crystal_durability+(diamond_durability/5), maxlevel=2}
		},
	},
})

minetest.register_tool("mt_items:diamond_hoe_wood_stick", {
	description = "Diamond Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1^(mt_item_atlas.png^[sheet:8x8:2,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = wood_durability+(diamond_durability/5),
	},
	on_place = hoe_on_place_function(wood_durability+(diamond_durability/5)),
})

minetest.register_tool("mt_items:diamond_hoe_stone_stick", {
	description = "Diamond Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1^(mt_item_atlas.png^[sheet:8x8:2,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = stone_durability+(diamond_durability/5),
	},
	on_place = hoe_on_place_function(stone_durability+(diamond_durability/5)),
})

minetest.register_tool("mt_items:diamond_hoe_iron_stick", {
	description = "Diamond Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2^(mt_item_atlas.png^[sheet:8x8:2,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = iron_durability+(diamond_durability/5),
	},
	on_place = hoe_on_place_function(iron_durability+(diamond_durability/5)),
})

minetest.register_tool("mt_items:diamond_hoe_gold_stick", {
	description = "Diamond Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3^(mt_item_atlas.png^[sheet:8x8:2,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = gold_durability+(diamond_durability/5),
	},
	on_place = hoe_on_place_function(gold_durability+(diamond_durability/5)),
})

minetest.register_tool("mt_items:diamond_hoe_diamond_stick", {
	description = "Diamond Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3^(mt_item_atlas.png^[sheet:8x8:2,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = diamond_durability+(diamond_durability/5),
	},
	on_place = hoe_on_place_function(diamond_durability+(diamond_durability/5)),
})

minetest.register_tool("mt_items:diamond_hoe_crystal_stick", {
	description = "Diamond Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3^(mt_item_atlas.png^[sheet:8x8:2,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = crystal_durability+(diamond_durability/5),
	},
	on_place = hoe_on_place_function(crystal_durability+(diamond_durability/5)),
})

--Crystal Heads
minetest.register_tool("mt_items:crystal_pick_wood_stick", {
	description = "Crystal Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1^(mt_item_atlas.png^[sheet:8x8:4,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=0.5, [2]=0.75, [1]=1.00}, uses=wood_durability+(crystal_durability/5), maxlevel=3}
		},
	},
})

minetest.register_tool("mt_items:crystal_pick_stone_stick", {
	description = "Crystal Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1^(mt_item_atlas.png^[sheet:8x8:4,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=0.5, [2]=0.75, [1]=1.00}, uses=stone_durability+(crystal_durability/5), maxlevel=3}
		},
	},
})

minetest.register_tool("mt_items:crystal_pick_iron_stick", {
	description = "Crystal Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2^(mt_item_atlas.png^[sheet:8x8:4,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=0.5, [2]=0.75, [1]=1.00}, uses=iron_durability+(crystal_durability/5), maxlevel=3}
		},
	},
})

minetest.register_tool("mt_items:crystal_pick_gold_stick", {
	description = "Crystal Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3^(mt_item_atlas.png^[sheet:8x8:4,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=0.5, [2]=0.75, [1]=1.00}, uses=gold_durability+(crystal_durability/5), maxlevel=3}
		},
	},
})

minetest.register_tool("mt_items:crystal_pick_diamond_stick", {
	description = "Crystal Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3^(mt_item_atlas.png^[sheet:8x8:4,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=0.5, [2]=0.75, [1]=1.00}, uses=diamond_durability+(crystal_durability/5), maxlevel=3}
		},
	},
})

minetest.register_tool("mt_items:crystal_pick_crystal_stick", {
	description = "Crystal Pickaxe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3^(mt_item_atlas.png^[sheet:8x8:4,2)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			cracky={times={[3]=0.5, [2]=0.75, [1]=1.00}, uses=crystal_durability+(crystal_durability/5), maxlevel=3}
		},
	},
})

minetest.register_tool("mt_items:crystal_axe_wood_stick", {
	description = "Crystal Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1^(mt_item_atlas.png^[sheet:8x8:6,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=0.5, [2]=0.75, [1]=1.00}, uses=wood_durability+(crystal_durability/5), maxlevel=3}
		},
	},
})

minetest.register_tool("mt_items:crystal_axe_stone_stick", {
	description = "Crystal Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1^(mt_item_atlas.png^[sheet:8x8:6,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=0.5, [2]=0.75, [1]=1.00}, uses=stone_durability+(crystal_durability/5), maxlevel=3}
		},
	},
})

minetest.register_tool("mt_items:crystal_axe_iron_stick", {
	description = "Crystal Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2^(mt_item_atlas.png^[sheet:8x8:6,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=0.5, [2]=0.75, [1]=1.00}, uses=iron_durability+(crystal_durability/5), maxlevel=3}
		},
	},
})

minetest.register_tool("mt_items:crystal_axe_gold_stick", {
	description = "Crystal Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3^(mt_item_atlas.png^[sheet:8x8:6,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=0.5, [2]=0.75, [1]=1.00}, uses=gold_durability+(crystal_durability/5), maxlevel=3}
		},
	},
})

minetest.register_tool("mt_items:crystal_axe_diamond_stick", {
	description = "Crystal Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3^(mt_item_atlas.png^[sheet:8x8:6,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=0.5, [2]=0.75, [1]=1.00}, uses=diamond_durability+(crystal_durability/5), maxlevel=3}
		},
	},
})

minetest.register_tool("mt_items:crystal_axe_crystal_stick", {
	description = "Crystal Axe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3^(mt_item_atlas.png^[sheet:8x8:6,1)",
	tool_capabilities = {
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=0.5, [2]=0.75, [1]=1.00}, uses=crystal_durability+(crystal_durability/5), maxlevel=3}
		},
	},
})
minetest.register_tool("mt_items:crystal_hoe_wood_stick", {
	description = "Crystal Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,1^(mt_item_atlas.png^[sheet:8x8:3,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = wood_durability+(crystal_durability/5),
	},
	on_place = hoe_on_place_function(wood_durability+(crystal_durability/5)),
})

minetest.register_tool("mt_items:crystal_hoe_stone_stick", {
	description = "Crystal Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,1^(mt_item_atlas.png^[sheet:8x8:3,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = stone_durability+(crystal_durability/5),
	},
	on_place = hoe_on_place_function(stone_durability+(crystal_durability/5)),
})

minetest.register_tool("mt_items:crystal_hoe_iron_stick", {
	description = "Crystal Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:7,2^(mt_item_atlas.png^[sheet:8x8:3,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = iron_durability+(crystal_durability/5),
	},
	on_place = hoe_on_place_function(iron_durability+(crystal_durability/5)),
})

minetest.register_tool("mt_items:crystal_hoe_gold_stick", {
	description = "Crystal Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:0,3^(mt_item_atlas.png^[sheet:8x8:3,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = gold_durability+(crystal_durability/5),
	},
	on_place = hoe_on_place_function(gold_durability+(crystal_durability/5)),
})

minetest.register_tool("mt_items:crystal_hoe_diamond_stick", {
	description = "Crystal Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:1,3^(mt_item_atlas.png^[sheet:8x8:3,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = diamond_durability+(crystal_durability/5),
	},
	on_place = hoe_on_place_function(diamond_durability+(crystal_durability/5)),
})

minetest.register_tool("mt_items:crystal_hoe_crystal_stick", {
	description = "Crystal Hoe",
	inventory_image = "mt_item_atlas.png^[sheet:8x8:2,3^(mt_item_atlas.png^[sheet:8x8:3,4)",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = crystal_durability+(crystal_durability/5),
	},
	on_place = hoe_on_place_function(crystal_durability+(crystal_durability/5)),
})
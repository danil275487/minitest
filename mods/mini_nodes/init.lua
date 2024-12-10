--Nodes
core.register_node("mini_nodes:stone", {
	description = "Stone",
	tiles = { sheet('node',3,0) },
	groups = { cracky = 3 },
})

core.register_node("mini_nodes:deep_stone", {
	description = "Deep Stone",
	tiles = { "min" },
	groups = { cracky = 2, level = 1 },
})

core.register_node("mini_nodes:stone_bricks", {
	description = "Stone Bricks",
	tiles = { "mini_stone_bricks.png" },
	groups = { cracky = 3 },
})

core.register_node("mini_nodes:deep_stone_bricks", {
	description = "Deep Stone Bricks",
	tiles = { "mini_deep_stone_bricks.png" },
	groups = { cracky = 2, level = 1 },
})

core.register_node("mini_nodes:dirt", {
	description = "Dirt",
	tiles = { "mini_dirt.png" },
	groups = { crumbly = 3, soil = 1, cultivatable = 1 },
})

core.register_node("mini_nodes:grass", {
	description = "Grassy Dirt",
	tiles = {"mini_grass.png",
			"mini_dirt.png",
			"mini_dirt.png^mini_grass_side.png"
			},
	groups = { crumbly = 3, soil = 1, cultivatable = 1 },
	drop = "mini_nodes:dirt"
})

core.register_node("mini_nodes:sand", {
	description = "Sand",
	tiles = { "mini_sand.png" },
	groups = { crumbly = 3, falling_node = 1 },
})

core.register_node("mini_nodes:gravel", {
	description = "Gravel",
	tiles = { "mini_gravel.png" },
	groups = { crumbly = 2, falling_node = 1 },
})

core.register_node("mini_nodes:oak_tree", {
	description = "Oak Tree",
	tiles = { "mini_oak_tree_top.png",
		"mini_oak_tree_top.png",
		"mini_oak_tree.png",
	 },
	groups = { choppy = 3 },
})

core.register_node("mini_nodes:oak_planks", {
	description = "Oak Planks",
	tiles = { "mini_oak_planks.png" },
	groups = { choppy = 3 },
})

core.register_node("mini_nodes:crafting_bench", {
	description = "Crafting Bench",
	tiles = { "mini_crafting_bench_top.png",
		"mini_oak_planks.png",
		"mini_crafting_bench.png",
	 },
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.25, -0.5, 0.5, 0.5, 0.5},
			{-0.5, -0.5, -0.5, -0.375, 0.25, -0.375},
			{0.375, -0.5, -0.5, 0.5, 0.25, -0.375},
			{-0.5, -0.5, 0.375, -0.375, 0.25, 0.5},
			{0.375, -0.5, 0.375, 0.5, 0.25, 0.5}
		}
	},
	groups = { oddly_breakable_by_hand = 1, choppy = 3, attached_node = 1 },
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("infotext", "Crafting Bench")
	end,
	on_rightclick = function(pos, node, player, itemstack)
		player:get_inventory():set_width("craft", 3)
		player:get_inventory():set_size("craft", 9)
		local form = [[
		size[8.25,8.75]
		real_coordinates[true]
		background9[0,0;0,0;mt_formspec_bg.png;true;12]
		bgcolor[#00000080;true]
		listcolors[#787878ff;#505050ff]
		list[current_player;main;0.5,4.5;6,2;6]
		list[current_player;main;0.5,7.25;6,1;0]
		list[current_player;craft;1.125,0.5;3,3;]
		image[4.875,1.75;1,1;mt_inv_arrow.png^[transformR270]
		list[current_player;craftpreview;6.125,1.75;1,1;]
		]]
		core.show_formspec(player:get_player_name(), "main", form)
	end,
})

core.register_node("mini_nodes:oak_leaves", {
	description = "Oak Leaves",
	tiles = { is_bushy().tiles },
	drawtype = is_bushy().drawtype,
	mesh = "mini_leaves.obj",
	paramtype = "light",
	waving = 2,
	groups = { snappy = 3 },
	drop = {
		max_items = 1,
		items = {
			{items = {"mini_nodes:oak_sapling"},rarity = 7},
		}
	},
})

core.register_node("mini_nodes:apple_leaves", {
	description = "Leaves with apple",
	tiles = { is_bushy().apple_tiles },
	drawtype = is_bushy().drawtype,
	mesh = "mini_leaves.obj",
	paramtype = "light",
	waving = 2,
	groups = { snappy = 3 },
	drop = {
		max_items = 2,
		items = {
			{items = {"mini_nodes:oak_sapling"},rarity = 7},
			{items = {"mini_items:apple"},rarity = 1},
		}
	}
})

local flat_nodes = {
	red_flower = "Flower",
	blue_flower = "Flower",
	white_flower = "Flower",
	twig = "Twig",
	rocks = "Rocks"
}

for k,v in pairs(flat_nodes) do
	core.register_node("mini_nodes:"..k, {
	description = v.name,
	use_texture_alpha = "clip",
	tiles = { "mini_"..k..".png" },
	inventory_image = "mini_"..k..".png",
	wield_image = "mini_"..k..".png",
	paramtype = "light",
	waving = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.4375, -0.5, 0.5, -0.4375, 0.5}
		}
	},
	groups = { dig_immediate = 3, attached_node = 1 },
})
end

core.register_node("mini_nodes:low_grass", {
	description = "Short Grass",
	tiles = {"mini_short_grass.png"},
	inventory_image = "mini_short_grass.png",
	wield_image = "mini_short_grass.png",
	drawtype = "plantlike",
	paramtype = "light",
	waving = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = { dig_immediate = 3, attached_node = 1 },
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, -0.0625, 0.25},
	},
	drop = {
		max_items = 2,
		items = {
			{items = {"mini_items:seeds"},rarity = 10},
			{items = {"mini_items:grass_heap"},rarity = 1},
		}
	},
})

core.register_node("mini_nodes:tall_grass", {
	description = "Tall Grass",
	tiles = {"mini_tall_grass.png"},
	inventory_image = "mini_tall_grass.png",
	wield_image = "mini_tall_grass.png",
	drawtype = "plantlike",
	paramtype = "light",
	waving = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = { dig_immediate = 3, attached_node = 1 },
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, -0.0625, 0.25},
	},
	drop = {
		max_items = 2,
		items = {
			{items = {"mini_items:seeds"},rarity = 6},
			{items = {"mini_items:grass_heap"},rarity = 1},
		}
	},
})

local ores = {
	coal = {
		name = "Coal",
		groups = {cracky = 3},
		deep_groups = {cracky = 2, level = 1},
		drop = "mini_items:coal_lump",
	},
	iron = {
		name = "Iron",
		groups = {cracky = 2},
		deep_groups = {cracky = 2, level = 1},
		drop = "mini_items:iron_lump",
	},
	gold = {
		name = "Gold",
		groups = {cracky = 2, level = 1},
		deep_groups = {cracky = 1, level = 1},
		drop = "mini_items:gold_lump",
	},
	diamond = {
		name = "Diamond",
		groups = {cracky = 1, level = 1},
		deep_groups = {cracky = 1, level = 2},
		drop = "mini_items:diamond",
	},
	crystal = {
		name = "Crystal",
		groups = {cracky = 1, level = 2},
		deep_groups = {cracky = 1, level = 3},
		drop = "mini_items:crystal",
	},
}

for k,v in pairs(ores) do
	core.register_node("mini_nodes:"..k.."_ore", {
		description = v.name.." Ore",
		tiles = { "mini_stone.png^mini_"..k.."_ore.png" },
		groups = v.groups,
		drop = v.drop
	})
	core.register_node("mini_nodes:deep_"..k.."_ore", {
		description = "Deep "..v.name.." Ore",
		tiles = { "mini_deep_stone.png^mini_"..k.."_ore.png" },
		groups = v.deep_groups,
		drop = v.drop
	})
end

core.register_node("mini_nodes:glass", {
	description = "Glass",
	drawtype = "glasslike",
	paramtype = "light",
	tiles = { "mini_glass.png" },
	groups = { oddly_breakable_by_hand = 3 },
	use_texture_alpha = "clip",
	is_ground_content = true,
	drop = ""
})

core.register_node("mini_nodes:oak_sapling", {
	description = "Oak Sapling",
	drawtype = "plantlike",
	tiles = { "mini_oak_sapling.png" },
	inventory_image = "mini_oak_sapling.png",
	wield_image = "mini_oak_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	groups = { snappy = 2, dig_immediate = 3, attached_node = 1, sapling = 1 },
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1, 1)) --the hell?
	end,
})

core.register_node("mini_nodes:torch", {
	description = "Torch",
	drawtype = "plantlike",
	paramtype2 = "meshoptions",
	place_param2 = 1,
	inventory_image = "mini_torch.png",
	wield_image = "mini_torch.png",
	tiles = { "mini_torch.png" },
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	liquids_pointable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, attached_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.1, -0.5, -0.1, 0.1, 0.35, 0.1},
	},
	on_place = function(itemstack, placer, pointed_thing)
		local under = pointed_thing.under
		local node = core.get_node(under)
		local def = core.registered_nodes[node.name]
		if def and def.on_rightclick and
			not (placer and placer:is_player() and
			placer:get_player_control().sneak) then
			return def.on_rightclick(under, node, placer, itemstack,pointed_thing) or itemstack
		end

		local above = pointed_thing.above
		local wdir = core.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 then
			return nil,
			fakestack:set_name("air")
		elseif wdir == 1 then
			fakestack:set_name("mini_nodes:torch")
		else
			fakestack:set_name("mini_nodes:torch_wall")
		end
		itemstack = core.item_place(fakestack, placer, pointed_thing, wdir)
		itemstack:set_name("mini_nodes:torch")
		return itemstack
	end,
})

core.register_node("mini_nodes:torch_wall", {
	drawtype = "torchlike",
	tiles = { "mini_torch_wall.png" },
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 12,
	groups = {choppy=2, dig_immediate=3, not_in_creative_inventory=1, attached_node=1},
	drop = "mini_nodes:torch",
	selection_box = {
		type = "wallmounted",
		wall_side = {-0.5, -0.35, -0.1, 0, 0.35, 0.1},
	},
})

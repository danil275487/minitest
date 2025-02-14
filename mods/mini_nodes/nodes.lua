--Nodes
core.register_node("mini_nodes:stone", {
	description = "Stone",
	tiles = { mini_core.sheet("node",3,0) },
	sounds = mini_core.sounds.dig_hard,
	groups = { cracky = 3 },
})

core.register_node("mini_nodes:deep_stone", {
	description = "Deep Stone",
	tiles = { mini_core.sheet("node",4,0) },
	sounds = mini_core.sounds.dig_hard,
	groups = { cracky = 2, level = 1 },
})

core.register_node("mini_nodes:stone_bricks", {
	description = "Stone Bricks",
	tiles = { mini_core.sheet("node",5,0) },
	sounds = mini_core.sounds.dig_hard,
	groups = { cracky = 3 },
})

core.register_node("mini_nodes:deep_stone_bricks", {
	description = "Deep Stone Bricks",
	tiles = { mini_core.sheet("node",6,0) },
	sounds = mini_core.sounds.dig_hard,
	groups = { cracky = 2, level = 1 },
})

core.register_node("mini_nodes:dirt", {
	description = "Dirt",
	tiles = { mini_core.sheet("node",2,0) },
	sounds = mini_core.sounds.dig_soft,
	groups = { crumbly = 3, soil = 1, cultivatable = 1 },
})

core.register_node("mini_nodes:grass", {
	description = "Grassy Dirt",
	tiles = {
		mini_core.sheet("node",0,0),
		mini_core.sheet("node",2,0),
		mini_core.sheet("node",2,0).."^"..mini_core.sheet("node",1,0)
	},
	groups = { crumbly = 3, soil = 1, cultivatable = 1 },
	sounds = mini_core.sounds.dig_soft,
	drop = "mini_nodes:dirt"
})

core.register_node("mini_nodes:sand", {
	description = "Sand",
	tiles = { mini_core.sheet("node",0,1) },
	sounds = mini_core.sounds.dig_soft,
	groups = { crumbly = 3, falling_node = 1 },
})

core.register_node("mini_nodes:gravel", {
	description = "Gravel",
	tiles = { mini_core.sheet("node",7,0) },
	sounds = mini_core.sounds.dig_soft,
	groups = { crumbly = 2, falling_node = 1 },
})

core.register_node("mini_nodes:oak_tree", {
	description = "Oak Tree",
	tiles = {
		mini_core.sheet("node",2,1),
		mini_core.sheet("node",2,1),
		mini_core.sheet("node",1,1),
	},
	sounds = mini_core.sounds.dig_hard,
	groups = { choppy = 3 },
})

core.register_node("mini_nodes:oak_planks", {
	description = "Oak Planks",
	tiles = { mini_core.sheet("node",1,2) },
	sounds = mini_core.sounds.dig_hard,
	groups = { choppy = 3 },
})

core.register_node("mini_nodes:crafting_bench", {
	description = "Crafting Bench",
	tiles = {
		mini_core.sheet("node",2,2),
		mini_core.sheet("node",3,2),
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
	sounds = mini_core.sounds.dig_hard,
	groups = { oddly_breakable_by_hand = 1, choppy = 3, attached_node = 1 },
	on_construct = function(pos)
		local meta = core.get_meta(pos)
		meta:set_string("infotext", "Crafting Bench")
	end,
	on_rightclick = function(_, _, player)
		player:get_inventory():set_width("craft", 3)
		player:get_inventory():set_size("craft", 9)
		local form = [[
		formspec_version[8]
		size[8.25,8.75]
		list[current_player;main;0.5,4.5;6,2;6]
		list[current_player;main;0.5,7.25;6,1;0]
		list[current_player;craft;1.125,0.5;3,3;]
		image[4.875,1.75;1,1;mini_inv_arrow.png^[transformR270]
		list[current_player;craftpreview;6.125,1.75;1,1;]
		]]
		core.show_formspec(player:get_player_name(), "main", form)
	end,
})

core.register_node("mini_nodes:oak_leaves", {
	description = "Oak Leaves",
	tiles = { mini_core.is_bushy().tiles },
	drawtype = mini_core.is_bushy().drawtype,
	mesh = "mini_leaves.obj",
	paramtype = "light",
	walkable = false,
	move_resistance = 4,
	climbable = true,
	waving = 2,
	sounds = mini_core.sounds.dig_soft,
	groups = { snappy = 3 },
	drop = {
		max_items = 1,
		items = {
			{items = {"mini_nodes:oak_sapling"},rarity = 10},
			{items = {"mini_nodes:twig"},rarity = 10},
		}
	},
})

core.register_node("mini_nodes:apple_leaves", {
	description = "Leaves with apple",
	tiles = { mini_core.is_bushy().apple_tiles },
	drawtype = mini_core.is_bushy().drawtype,
	mesh = "mini_leaves.obj",
	paramtype = "light",
	waving = 2,
	walkable = false,
	climbable = true,
	move_resistance = 4,
	sounds = mini_core.sounds.dig_soft,
	groups = { snappy = 3 },
	drop = {
		max_items = 2,
		items = {
			{items = {"mini_nodes:oak_sapling"},rarity = 10},
			{items = {"mini_nodes:twig"},rarity = 10},
			{items = {"mini_items:apple"},rarity = 1},
		}
	}
})

local flat_nodes = {
	{
		name = "twig",
		description = "Twig",
	},
	{
		name = "rocks",
		description = "Rock",
		inventory_image = mini_core.sheet("item",0,0)
	},
	{
		name = "red_flower",
		description = "Flower",
		waving = 1
	},
	{
		name = "blue_flower",
		description = "Flower",
		waving = 1
	},
	{
		name = "white_flower",
		description = "Flower",
		waving = 1
	},
}

for i,v in pairs(flat_nodes) do
	core.register_node("mini_nodes:"..v.name, {
		description = v.description,
		use_texture_alpha = "clip",
		tiles = { mini_core.sheet("node",i,3) },
		inventory_image = v.inventory_image or mini_core.sheet("node",i,3),
		wield_image = v.inventory_image or mini_core.sheet("node",i,3),
		paramtype = "light",
		waving = v.waving or 0,
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drawtype = "nodebox",
		drop = v.drop or "mini_nodes:"..v.name,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.4375, -0.5, 0.5, -0.4375, 0.5}
			}
		},
		sounds = mini_core.sounds.dig_soft,
		groups = { dig_immediate = 3, attached_node = 1 },
	})
end

core.register_node("mini_nodes:low_grass", {
	description = "Short Grass",
	tiles = { mini_core.sheet("node",6,1) },
	inventory_image = mini_core.sheet("node",6,1),
	wield_image = mini_core.sheet("node",6,1),
	drawtype = "plantlike",
	paramtype = "light",
	waving = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	sounds = mini_core.sounds.dig_soft,
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
	tiles = { mini_core.sheet("node",7,1) },
	inventory_image = mini_core.sheet("node",7,1),
	wield_image = mini_core.sheet("node",7,1),
	drawtype = "plantlike",
	paramtype = "light",
	waving = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	sounds = mini_core.sounds.dig_soft,
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
	{
		name= "coal",
		description = "Coal",
		groups = {cracky = 3},
		deep_groups = {cracky = 2, level = 1},
		drop = "mini_items:coal_lump",
	},
	{
		name= "iron",
		description = "Iron",
		groups = {cracky = 2},
		deep_groups = {cracky = 2, level = 1},
		drop = "mini_items:iron_lump",
	},
	{
		name= "gold",
		description = "Gold",
		groups = {cracky = 2, level = 1},
		deep_groups = {cracky = 1, level = 1},
		drop = "mini_items:gold_lump",
	},
	{
		name= "diamond",
		description = "Diamond",
		groups = {cracky = 1, level = 1},
		deep_groups = {cracky = 1, level = 2},
		drop = "mini_items:diamond",
	},
	{
		name= "crystal",
		description = "Crystal",
		groups = {cracky = 1, level = 2},
		deep_groups = {cracky = 1, level = 3},
		drop = "mini_items:crystal",
	},
}

for i,v in pairs(ores) do
	core.register_node("mini_nodes:"..v.name.."_ore", {
		description = v.description.." Ore",
		tiles = { mini_core.sheet("node",3,0).."^"..mini_core.sheet("node",i-1,5) },
		groups = v.groups,
		sounds = mini_core.sounds.dig_hard,
		drop = v.drop
	})
	core.register_node("mini_nodes:deep_"..v.name.."_ore", {
		description = "Deep "..v.description.." Ore",
		tiles = { mini_core.sheet("node",4,0).."^"..mini_core.sheet("node",i-1,5) },
		groups = v.deep_groups,
		sounds = mini_core.sounds.dig_hard,
		drop = v.drop
	})
end

core.register_node("mini_nodes:glass", {
	description = "Glass",
	drawtype = "glasslike",
	paramtype = "light",
	tiles = { mini_core.sheet("node",0,2) },
	sounds = mini_core.sounds.dig_hard,
	groups = { oddly_breakable_by_hand = 3 },
	use_texture_alpha = "clip",
	is_ground_content = true,
	drop = ""
})

core.register_node("mini_nodes:oak_sapling", {
	description = "Oak Sapling",
	drawtype = "plantlike",
	tiles = { mini_core.sheet("node",0,3) },
	inventory_image = mini_core.sheet("node",0,3),
	wield_image = mini_core.sheet("node",0,3),
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	sounds = mini_core.sounds.dig_soft,
	groups = { snappy = 2, dig_immediate = 3, attached_node = 1, sapling = 1 },
	on_timer = function(pos)
		mini_core.grow_sapling(pos)
	end,
	on_construct = function(pos)
		core.get_node_timer(pos):start(math.random(1, 1)) --the hell?
	end,
})

core.register_node("mini_nodes:torch", {
	description = "Torch",
	drawtype = "plantlike",
	paramtype2 = "meshoptions",
	place_param2 = 1,
	inventory_image = mini_core.sheet("node",6,2),
	wield_image = mini_core.sheet("node",6,2),
	tiles = { mini_core.sheet("node",6,2) },
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	liquids_pointable = false,
	light_source = 12,
	sounds = mini_core.sounds.dig_soft,
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
	tiles = { mini_core.sheet("node",7,2) },
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 12,
	sounds = mini_core.sounds.dig_soft,
	groups = {choppy=2, dig_immediate=3, not_in_creative_inventory=1, attached_node=1},
	drop = "mini_nodes:torch",
	selection_box = {
		type = "wallmounted",
		wall_side = {-0.5, -0.35, -0.1, 0, 0.35, 0.1},
	},
})

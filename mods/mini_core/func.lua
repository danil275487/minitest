--Easier schematic loading
function mini_core.mts(name)
	return core.get_modpath("mini_assets").."/schems/"..name..".mts"
end

--Helper function for tilesheets
function mini_core.sheet(sheet, x,y, w,h, esc) -- w/h is used for animation, esc is for texmods
	w = w or 8
	h = h or 8
	if esc then
		return "(mini_"..sheet.."_sheet.png\\^[sheet\\:"..w.."x"..h.."\\:"..x..","..y..")"
	else
		return "(mini_"..sheet.."_sheet.png^[sheet:"..w.."x"..h..":"..x..","..y..")"
	end
end

--Simple formspec wrapper that does variable substitution
function mini_core.formspec_wrapper(formspec, variables)
	local retval = formspec
	for k,v in pairs(variables) do
		retval = retval:gsub("${"..k.."}", v)
	end
	return retval
end

--Tree growing
function mini_core.can_grow(pos)
	local node_under = core.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not node_under then
		return false
	end
	if core.get_item_group(node_under.name, "soil") == 0 then
		return false
	end
	local light_level = core.get_node_light(pos)
	if not light_level or light_level < 8 then
		return false
	end
	return true
end

--Grow sapling
function mini_core.grow_sapling(pos)
	if not mini_core.can_grow(pos) then
		return
	end
	local node = core.get_node(pos)
	if node.name == "mini_nodes:oak_sapling" then
		core.remove_node(pos)
		core.place_schematic({x = pos.x-5, y = pos.y-1, z = pos.z-5}, mini_core.mts("tree"), "random", nil, false)
	end
end

--Return proper mesh and texture for leaves depending on "Bushy leaves" option
function mini_core.is_bushy()
	if core.settings:get_bool("mini_bushy_leaves") then
		return {
			drawtype = "mesh",
			tiles = "mini_oak_leaves_bushy.png",
			apple_tiles = "[combine:16x16:0,0=mini_oak_leaves_bushy.png:4,4="..mini_core.sheet("node",6,3,8,8,true)
		}
	else
		return {
			drawtype = "allfaces_optional",
			tiles = mini_core.sheet("node",3,1),
			apple_tiles = mini_core.sheet("node",3,1).."^"..mini_core.sheet("node",6,3)
		}
	end
end

--Register a stairs and slab node for given node, carried over from mini_stairs
function mini_core.register_stair_and_slab(node)
	local node_def = core.registered_nodes[node]
	core.register_node(node.."_stair", {
		description = node_def.description.." Stairs",
		drawtype = "nodebox",
		tiles = node_def.tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = node_def.groups,
		sounds = node_def.sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.0, 0.5},
				{-0.5, 0.0, 0.0, 0.5, 0.5, 0.5},
			},
		},
	})
	core.register_node(node.."_slab", {
		description = node_def.description.." Slab",
		drawtype = "nodebox",
		tiles = node_def.tiles,
		paramtype = "light",
		groups = node_def.groups,
		sounds = node_def.sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.0, 0.5},
			},
		},
	})
	core.register_craft({
		output = node.."_stair",
		recipe = {
			{"", "", node},
			{"", node, node},
			{node, node, node},
		},
	})
	core.register_craft({
		output = node.."_stair",
		recipe = {
			{node,"",""},
			{node, node,""},
			{node, node, node},
		},
	})
	core.register_craft({
		output = node.."slab",
		recipe = {
			{node, node, node},
		},
	})
end

--Furnace formspecs, carried over from mini_furnace
function mini_core.get_furnace_active_formspec(fuel_percent, item_percent)
	return mini_core.formspec_wrapper([[
		formspec_version[8]
		size[8.25,8.75]
		list[context;src;2.35,0.5;1,1;]
		list[context;fuel;2.35,3;1,1;]
		image[2.35,1.75;1,1;mini_furnace_ui_fire_bg.png^[lowpart:${fuel_pct}:mini_furnace_ui_fire.png]
		image[3.60,1.75;1,1;mini_inv_arrow.png^[lowpart:${item_pct}:mini_inv_arrow_full.png^[transformR270]
		list[context;dst;4.85,1.75;1,1;]
		list[current_player;main;0.5,4.5;6,2;6]
		list[current_player;main;0.5,7.25;6,1;0]
	]],{
		fuel_pct = fuel_percent,
		item_pct = item_percent
	})
end

function mini_core.get_furnace_inactive_formspec()
	return [[
		formspec_version[8]
		size[8.25,8.75]
		list[context;src;2.35,0.5;1,1;]
		list[context;fuel;2.35,3;1,1;]
		image[2.35,1.75;1,1;mini_furnace_ui_fire_bg.png]
		image[3.60,1.75;1,1;mini_inv_arrow.png^[transformR270]
		list[context;dst;4.85,1.75;1,1;]
		list[current_player;main;0.5,4.5;6,2;6]
		list[current_player;main;0.5,7.25;6,1;0]
	]]
end

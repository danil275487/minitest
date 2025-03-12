--Easier schematic loading
function mini_core.mts(name)
	return core.get_modpath("mini_assets").."/schems/"..name..".mts"
end

--Helper function for tilesheets
--[[
	sheet = sheet to use, see mini_assets/textures/sheets/ (string)
			(example: "node" -> mini_node_sheet.png)
	x,y = position of tile (int)
	w,h = size of tilesheet in tiles (int, opt)
	esc = should texmod be escaped? (bool, opt)
		  used in combination with other texmods
]]
function mini_core.sheet(sheet, x,y, w,h, esc)
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

--Fake list-style grid of items
--[[
	x,y = position (int)
	r,c = row/column (int)
	tooltips = should tooltips be added? (bool, opt)
	background = should backgrounds be added? (colorspec, opt)
	spacing = spacing between each cell
	items = items (table)
]]
function mini_core.item_grid(param)
	local elements, idx = {}, 1
	param.spacing = param.spacing or 1.25
	param.items = type(param.items) == "string" and {param.items} or param.items
	elements[1] = "container["..param.x..","..param.y.."]"
	elements[2] = "box[0,0.2;"..(param.r+((param.spacing-1)*(param.r-1)))..","..(param.c+((param.spacing-1)*(param.c-1)))..";red]"
	for gy = 1, param.c * param.spacing, param.spacing do
		for gx = 1, param.r * param.spacing, param.spacing do
			if idx > #param.items then break end
			param.items[idx] = param.items[idx] or ""
			local xpos = param.x+gx-1
			local ypos = param.y+gy-1
			local desc = ItemStack(param.items[idx]):get_description()
			if param.background then
				elements[#elements+1] = "box["..xpos..","..ypos..";1,1;"..param.background.."]"
			end
			if param.tooltips == true then
				elements[#elements+1] = "tooltip["..xpos..","..ypos..";1,1;"..desc.."]"
			end
			elements[#elements+1] = "item_image["..xpos..","..ypos..";1,1;"..param.items[idx].."]"
			idx = idx + 1
		end
	end
	elements[#elements+1] = "container_end[]"
	return table.concat(elements, "\n")
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

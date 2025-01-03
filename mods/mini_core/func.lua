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
	w,h = size, scaled according to row/column amount (int)
	r,c = row/column (int)
	i = items (table)
	t = should tooltips be added? (bool, opt)
	b = should backgrounds be added? (colorspec, opt)
	s = spacing between each cell
]]
function mini_core.item_grid(x,y, w,h, r,c, i, t,b,s)
	local elements, idx = {}, 1
	s = s or 1.25
	i = type(i) == "string" and {i} or i
	for gy = 1, c * s, s do
		for gx = 1, r * s, s do
			if idx > #i then break end
			i[idx] = i[idx] or ""

			local elem_x = (x + gx - 1)+(w/r)-1
			local elem_y = (y + gy - 1)

			if b then
				elements[#elements + 1] = "box["..(x + gx - 1)..","..(y + gy - 1)..";"..w/r..","..h/c..";"..b.."]"
			end
			if t then
				elements[#elements + 1] = "tooltip["..(x + gx - 1)..","..(y + gy - 1)..";"..w/r..","..h/c..";"..ItemStack(i[idx]):get_description().."]"
			end
			elements[#elements + 1] = "item_image["..elem_x..","..elem_y..";1,1;"..i[idx].."]"
			idx = idx + 1
		end
	end
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

function tprint (t, s)
	for k, v in pairs(t) do
		local kfmt = '["' .. tostring(k) ..'"]'
		if type(k) ~= 'string' then
			kfmt = '[' .. k .. ']'
		end
		local vfmt = '"'.. tostring(v) ..'"'
		if type(v) == 'table' then
			tprint(v, (s or '')..kfmt)
		else
			if type(v) ~= 'string' then
				vfmt = tostring(v)
			end
			print(type(t)..(s or '')..kfmt..' = '..vfmt)
		end
	end
end

--Taken from https://gist.github.com/NFrid/2b4b62900d68f68d30f4ba82fbeeb02d
function dump(o, tbs, tb)
  tb = tb or 0
  tbs = tbs or '  '
  if type(o) == 'table' then
	local s = '{'
	if (next(o)) then s = s .. '\n' else return s .. '}' end
	tb = tb + 1
	for k,v in pairs(o) do
	  if type(k) ~= 'number' then k = '"' .. k .. '"' end
	  s = s .. tbs:rep(tb) .. '[' .. k .. '] = ' .. dump(v, tbs, tb)
	  s = s .. ',\n'
	end
	tb = tb - 1
	return s .. tbs:rep(tb) .. '}'
  else
	return tostring(o)
  end
end

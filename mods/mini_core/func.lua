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
	if not can_grow(pos) then
		core.get_node_timer(pos):start(math.random(60,480))
		return
	end
	local node = core.get_node(pos)
	if node.name == "mini_farming:oak_sapling" then
		core.remove_node(pos)
		core.place_schematic({x = pos.x-3, y = pos.y-1, z = pos.z-3}, mini_core.mts("tree"), "random", nil, false)
	end
end

--Return proper mesh and texture for leaves depending on "Bushy leaves" option
function mini_core.is_bushy()
	if core.settings:get("mini_bushy_leaves") == true then --why does this now return false always?
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

--Register a stairs and slab node for given node
function mini_core.register_stair_and_slab(subname, recipeitem, groups, tiles, description, texture_alpha)
	core.register_node("mini_stairs:"..subname.."_stair", {
		description = description.." Stairs",
		drawtype = "nodebox",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.0, 0.5},
				{-0.5, 0.0, 0.0, 0.5, 0.5, 0.5},
			},
		},
	})
	core.register_node("mini_stairs:"..subname.."_slab", {
		description = description.." Slab",
		drawtype = "nodebox",
		tiles = tiles,
		paramtype = "light",
		groups = groups,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.0, 0.5},
			},
		},
		use_texture_alpha = texture_alpha
	})

	if recipeitem then
		core.register_craft({
			output = "mini_stairs:"..subname.."_stair",
			recipe = {
				{"", "", recipeitem},
				{"", recipeitem, recipeitem},
				{recipeitem, recipeitem, recipeitem},
			},
		})
		core.register_craft({
			output = "mini_stairs:"..subname.."_stair",
			recipe = {
				{recipeitem,"",""},
				{recipeitem, recipeitem,""},
				{recipeitem, recipeitem, recipeitem},
			},
		})
		core.register_craft({
			output = "mini_stairs:"..subname.."_slab",
			recipe = {
				{recipeitem, recipeitem, recipeitem},
			},
		})
	end
end

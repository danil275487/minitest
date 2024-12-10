--Easier schematic loading
function mts(name)
	return core.get_modpath("mini_assets").."/schems/"..name..".mts"
end

--Helper function for tilesheets
function sheet(sheet, x, y)
	return 'mini_'..sheet..'_sheet.png^[sheet:8x8:'..x..','..y
end

--Simple formspec wrapper that does variable substitution
function formspec_wrapper(formspec, variables)
	local retval = formspec
	for k,v in pairs(variables) do
		retval = retval:gsub("${"..k.."}", v)
	end
	return retval
end

--Tree growing
function can_grow(pos)
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
function grow_sapling(pos)
	if not can_grow(pos) then
		core.get_node_timer(pos):start(math.random(60,480))
		return
	end
	local node = core.get_node(pos)
	if node.name == "mini_farming:oak_sapling" then
		core.remove_node(pos)
		core.place_schematic({x = pos.x-3, y = pos.y-1, z = pos.z-3}, mts("tree"), "random", nil, false)
	end
end

--Return proper mesh and texture for leaves depending on "Bushy leaves" option
function is_bushy()
	if 	core.settings:get("mini_bushy_leaves") == true then
		return {
			drawtype = "mesh",
			tiles = "mini_oak_leaves_bushy.png",
			apple_tiles = "[combine:16x16:0,0=mini_oak_leaves_bushy.png:4,4=mini_apple_leaves.png"
		}
	else
		return {
			drawtype = "allfaces_optional",
			tiles = "mini_oak_leaves.png",
			apple_tiles = "mini_oak_leaves.png^mini_apple_leaves.png"
		}
	end
end

-- Create a detached inventory
local inv_creative = core.create_detached_inventory("creative", {
	allow_move = function()
		return 0
	end,
	allow_put = function()
		return -1
	end,
	allow_take = function()
		return -1
	end,
})

local max_page = 1
local ipp = 5

core.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "mini_core:creative" and fields.quit == nil and fields.creative == nil then
		if fields.inventory then
			core.show_formspec(player:get_player_name(), "", mini_core.formspecs.inventory(player:get_player_name()))
			return
		end
		local page = fields.internal_paginator
		if fields.inv_creative_prev then
			page = page - 1
		elseif fields.inv_creative_next then
			page = page + 1
		end
		if page < 1 then
			page = 1
		end
		if page > max_page then
			page = max_page
		end
		core.show_formspec(player:get_player_name(), "mini_core:creative", mini_core.formspecs.creative(page, max_page, ipp))
	end
end)

core.register_on_mods_loaded(function()
	local items = {}
	for itemstring, def in pairs(core.registered_items) do
		if itemstring ~= ""
		and itemstring ~= "unknown"
		and itemstring ~= "ignore"
		and itemstring ~= "air"
		and itemstring ~= "worldedit:placeholder"
		and def.groups.not_in_creative_inventory ~= 1 then
			table.insert(items, itemstring)
		end
	end
	--[[ Items should be sorted in this order
	1. Nodes (Parts)
	2. Craftitems/Tools
	Because the parts are probably what you wanna see first. ]]
	local function compare(item1, item2)
		local def1 = core.registered_items[item1]
		local def2 = core.registered_items[item2]
		local tool1 = def1.type == "tool"
		local tool2 = def2.type == "tool"
		local craftitem1 = def1.type == "craft"
		local craftitem2 = def2.type == "craft"
		if tool1 and not tool2 then
			return false
		elseif not tool1 and tool2 then
			return true
		elseif craftitem1 and not craftitem2 then
			return false
		elseif not craftitem1 and craftitem2 then
			return true
		else
			return item1 < item2
		end
	end
	table.sort(items, compare)
	inv_creative:set_size("main", #items)
	max_page = math.ceil(#items / ipp)
	for i=1, #items do
		inv_creative:add_item("main", items[i])
	end
end)


-- Create a detached inventory
local inv_creative = core.create_detached_inventory("creative", {
	allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
		return 0
	end,
	allow_put = function(inv, listname, index, stack, player)
		return -1
	end,
	allow_take = function(inv, listname, index, stack, player)
		return -1
	end,
})
local max_page = 1
local ipp = 5
function mini_core.get_creative_formspec(page)
	local start = 0 + (page-1)*ipp
	return mini_core.formspec_wrapper([[
		formspec_version[8]
		size[8.25,9.25]
		list[detached:creative;main;0.5,1.25;5,5;${start}]
		button[6.75,1.25;1,1;inv_creative_prev;\/\\]
		background9[6.75,2.25;1,4;${bg_dark};false;8]
		label[0,1;${scrubber_pos}]
		background9[6.75,${scrubber_pos}; 1,0.75;${bg};false;12]
		button[6.75,6.25;1,1;inv_creative_next;\\\/]
		list[current_player;main;0.5,7.75;6,1;0]
		field[0,0;0,0;internal_paginator;;${page}]
		background9[0,0;8.25,0.75;${bg_dark};false;8]
		button[0,0;3,0.75;inventory;Inventory]
		button[3,0;3,0.75;creative;Creative]
	]], {
		bg = mini_core.sheet("ui",0,0,6,1).."^[resize:24x24",
		bg_dark = mini_core.sheet("ui",2,0,6,1).."^[resize:24x24",
		start = start,
		page = page,
		max_page = max_page,
		scrubber_pos = 2.25+(5.5-2.25)*(page-1)/(max_page-1)
	})
end

core.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "mini_core:creative" and fields.quit == nil and fields.creative == nil then
		if fields.inventory then
			core.show_formspec(player:get_player_name(), "", mini_core.get_inventory_formspec())
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
		core.show_formspec(player:get_player_name(), "mini_core:creative", mini_core.get_creative_formspec(page))
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


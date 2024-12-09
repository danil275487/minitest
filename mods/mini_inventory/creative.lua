local F = core.formspec_escape

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
local ipp = 24

function get_creative_formspec(page)
	local start = 0 + (page-1)*ipp
	return formspec_wrapper([[
		size[8.25,9]
		real_coordinates[true]
		background9[0,0.75;8.25,8.25;mt_formspec_bg.png;false;12]
		bgcolor[#00000080;true]
		style_type[button;border=false;bgimg=mt_formspec_bg.png;bgimg_pressed=mt_formspec_bg_dark.png;bgimg_middle=12,12]
		listcolors[#787878ff;#505050ff]
		list[detached:creative;main;0.5,1.25;6,4;${start}]
		button[0.5,6.25;1,1;inv_creative_prev;\<]
		label[1.75,6.75;Page: ${page} / ${max_page}]
		button[4,6.25;1,1;inv_creative_next;\>]
		list[current_player;main;0.5,7.5;6,1;0]
		field[0,0;0,0;internal_paginator;;${page}]
		button[0,0;2,0.75;inventory;Inventory]
		button[2,0;2,0.75;creative;Creative]
	]], {
		start = start,
		page = page,
		max_page = max_page
	})
end

core.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "mini_inventory:creative" and fields.quit == nil and fields.creative == nil then
		if fields.inventory then
			core.show_formspec(player:get_player_name(), "", get_inventory_formspec())
			return
		end
		local page = fields.internal_paginator
		if fields.inv_creative_prev then
			page = page - 1
		elseif fields.inv_creative_next then
			page = page + 1
		end
		if page < 1 then
			page = max_page
		end
		if page > max_page then
			page = 1
		end
		core.show_formspec(player:get_player_name(), "mini_inventory:creative", get_creative_formspec(page))
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

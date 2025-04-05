local creative_items = {}

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

core.register_on_mods_loaded(function()
	for itemstring, def in pairs(core.registered_items) do
		if itemstring ~= ""
		and itemstring ~= "unknown"
		and itemstring ~= "ignore"
		and itemstring ~= "air"
		and itemstring ~= "worldedit:placeholder"
		and def.groups.not_in_creative_inventory ~= 1 then
			table.insert(creative_items, itemstring)
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
	table.sort(creative_items, compare)
	inv_creative:set_size("main", #creative_items)
	for i=1, #creative_items do
		inv_creative:add_item("main", creative_items[i])
	end
end)

--handle inventory tab buttons
local function handle_inventory_formspec(fields, player)
	local scroll = 0

	if fields.inventory then
		fslib.show_formspec(player, mini_core.formspecs.inventory(player), function(fields)
			if fields.creative then
				handle_inventory_formspec(fields, player)
			end
		end)
	end
	if fields.creative then
		fslib.show_formspec(player, mini_core.formspecs.creative(#creative_items, scroll), function(fields)
			core.debug(scroll)
			core.debug(dump(fields))
			if fields.inventory then
				handle_inventory_formspec(fields, player)
				end
			if fields.scroll_down then
				scroll = scroll + (10+2/8)*2
			end
			if fields.scroll_up then
				scroll = scroll - (10+2/8)*2
			end
		end)
	end
end

core.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "" then
		handle_inventory_formspec(fields, player)
	end
end)

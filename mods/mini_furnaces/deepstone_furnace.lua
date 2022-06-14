--
-- Formspecs
--

local function get_furnace_active_formspec(fuel_percent, item_percent)
	return "size[8.25,8.75]"..
		"real_coordinates[true]"..
		"background9[0,0;0,0;mt_formspec_bg.png;true;12]"..
		"bgcolor[#00000080;true]"..
		"listcolors[#787878ff;#505050ff]"..
		"list[context;src;2.35,0.5;1,1;]"..
		"list[context;fuel;2.35,3;1,1;]"..
		"image[2.35,1.75;1,1;mt_furnace_ui_fire_bg.png^[lowpart:"..(fuel_percent)..":mt_furnace_ui_fire.png]"..
		"image[3.60,1.75;1,1;mt_inv_arrow.png^[lowpart:"..(item_percent)..":mt_inv_arrow_full.png^[transformR270]"..
		"list[context;dst;4.85,1.75;1,1;]"..
		"list[current_player;main;0.5,4.5;6,2;6]"..
		"list[current_player;main;0.5,7.25;6,1;0]"
end

local function get_furnace_inactive_formspec()
	return "size[8.25,8.75]"..
		"real_coordinates[true]"..
		"background9[0,0;0,0;mt_formspec_bg.png;true;12]"..
		"bgcolor[#00000080;true]"..
		"listcolors[#787878ff;#505050ff]"..
		"list[context;src;2.35,0.5;1,1;]"..
		"list[context;fuel;2.35,3;1,1;]"..
		"image[2.35,1.75;1,1;mt_furnace_ui_fire_bg.png]"..
		"image[3.60,1.75;1,1;mt_inv_arrow.png^[transformR270]"..
		"list[context;dst;4.85,1.75;1,1;]"..
		"list[current_player;main;0.5,4.5;6,2;6]"..
		"list[current_player;main;0.5,7.25;6,1;0]"
end

--
-- Node callback functions that are the same for active and inactive furnace
--

local function can_dig(pos, player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("fuel") and inv:is_empty("dst") and inv:is_empty("src")
end

local function swap_node(pos, name)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos, node)
end

local function furnace_node_timer(pos, elapsed)
	--
	-- Initialize metadata
	--
	local meta = minetest.get_meta(pos)
	local fuel_time = meta:get_float("fuel_time") or 0
	local src_time = meta:get_float("src_time") or 0
	local fuel_totaltime = meta:get_float("fuel_totaltime") or 0
	local inv = meta:get_inventory()
	local srclist, fuellist
	local dst_full = false
	local timer_elapsed = meta:get_int("timer_elapsed") or 0
	meta:set_int("timer_elapsed", timer_elapsed + 1)
	local cookable, cooked
	local fuel
	local update = true
	while elapsed > 0 and update do
		update = false
		srclist = inv:get_list("src")
		fuellist = inv:get_list("fuel")
		-- Cooking
		-- Check if we have cookable content
		local aftercooked
		cooked, aftercooked = minetest.get_craft_result({method = "cooking", width = 1, items = srclist})
		cookable = cooked.time ~= 0
		local el = math.min(elapsed, fuel_totaltime - fuel_time)
		if cookable then -- fuel lasts long enough, adjust el to cooking duration
			el = math.min(el, cooked.time - src_time)
		end
		-- Check if we have enough fuel to burn
		if fuel_time < fuel_totaltime then
			-- The furnace is currently active and has enough fuel
			fuel_time = fuel_time + el
			-- If there is a cookable item then check if it is ready yet
			if cookable then
				src_time = src_time + el + 0.25
				if src_time >= cooked.time then
					-- Place result in dst list if possible
					if inv:room_for_item("dst", cooked.item) then
						inv:add_item("dst", cooked.item)
						inv:set_stack("src", 1, aftercooked.items[1])
						src_time = src_time - cooked.time
						update = true
					else
						dst_full = true
					end
				else
					-- Item could not be cooked: probably missing fuel
					update = true
				end
			end
		else
			-- Furnace ran out of fuel
			if cookable then
				-- We need to get new fuel
				local afterfuel
				fuel, afterfuel = minetest.get_craft_result({method = "fuel", width = 1, items = fuellist})

				if fuel.time == 0 then
					-- No valid fuel in fuel list
					fuel_totaltime = 0
					src_time = 0
				else
					-- Take fuel from fuel list
					inv:set_stack("fuel", 1, afterfuel.items[1])
					-- Put replacements in dst list or drop them on the furnace.
					local replacements = fuel.replacements
					if replacements[1] then
						local leftover = inv:add_item("dst", replacements[1])
						if not leftover:is_empty() then
							local above = vector.new(pos.x, pos.y + 1, pos.z)
							local drop_pos = minetest.find_node_near(above, 1, {"air"}) or above
							minetest.item_drop(replacements[1], nil, drop_pos)
						end
					end
					update = true
					fuel_totaltime = fuel.time + (fuel_totaltime - fuel_time)
				end
			else
				-- We don't need to get new fuel since there is no cookable item
				fuel_totaltime = 0
				src_time = 0
			end
			fuel_time = 0
		end

		elapsed = elapsed - el
	end

	if fuel and fuel_totaltime > fuel.time then
		fuel_totaltime = fuel.time
	end
	if srclist and srclist[1]:is_empty() then
		src_time = 0
	end

	-- Update formspec, infotext and node
	local formspec
	local item_state
	local item_percent = 0
	if cookable then
		item_percent = math.floor(src_time / cooked.time * 100)
		if dst_full then
			item_state =  "100% (output full)"
		else
			item_state =  "@1%", item_percent
		end
	else
		if srclist and not srclist[1]:is_empty() then
			item_state =  "Not cookable"
		else
			item_state =  "Empty"
		end
	end

	local fuel_state =  "Empty"
	local active = false
	local result = false

	if fuel_totaltime ~= 0 then
		active = true
		local fuel_percent = 100 - math.floor(fuel_time / fuel_totaltime * 100)
		fuel_state =  "@1%", fuel_percent
		formspec = get_furnace_active_formspec(fuel_percent, item_percent)
		swap_node(pos, "mini_furnaces:deep_furnace_active")
		-- make sure timer restarts automatically
		result = true
	else
		if fuellist and not fuellist[1]:is_empty() then
			fuel_state =  "@1%", 0
		end
		formspec = get_furnace_inactive_formspec()
		swap_node(pos, "mini_furnaces:deep_furnace")
		-- stop timer on the inactive furnace
		minetest.get_node_timer(pos):stop()
		meta:set_int("timer_elapsed", 0)
	end


	local infotext = "Deep Stone Furnace"
	
	--
	-- Set meta values
	--
	meta:set_float("fuel_totaltime", fuel_totaltime)
	meta:set_float("fuel_time", fuel_time)
	meta:set_float("src_time", src_time)
	meta:set_string("formspec", formspec)
	meta:set_string("infotext", infotext)

	return result
end

--
-- Node definitions
--

minetest.register_node("mini_furnaces:deep_furnace", {
	description =  "Deep Stone Furnace",
	tiles = {
		"mini_deep_stone.png",
		"mini_deep_stone.png",
		"mini_deep_stone_bricks.png",
		"mini_deep_stone_bricks.png",
		"mini_deep_stone_bricks.png",
		"mini_deep_stone_bricks.png^mini_furnace.png"
	},
	paramtype2 = "facedir",
	groups = { cracky=2, level = 1 },
	can_dig = can_dig,
	on_timer = furnace_node_timer,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('src', 1)
		inv:set_size('fuel', 1)
		inv:set_size('dst', 1)
		furnace_node_timer(pos, 0)
	end,

	on_metadata_inventory_move = function(pos)
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_metadata_inventory_put = function(pos)
		-- start timer function, it will sort out whether furnace can burn or not.
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_metadata_inventory_take = function(pos)
		-- check whether the furnace is empty or not.
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_break = function(pos)
		local drops = {}
		mt_nodes.get_inventory_drops(pos, "src", drops)
		mt_nodes.get_inventory_drops(pos, "fuel", drops)
		mt_nodes.get_inventory_drops(pos, "dst", drops)
		drops[#drops+1] = "mini_furnaces:deep_furnace"
		minetest.remove_node(pos)
		return drops
	end,
})

minetest.register_node("mini_furnaces:deep_furnace_active", {
	description =  "Deep Stone Furnace",
	tiles = {
		"mini_deep_stone.png",
		"mini_deep_stone.png",
		"mini_deep_stone_bricks.png",
		"mini_deep_stone_bricks.png",
		"mini_deep_stone_bricks.png",
		"mini_deep_stone_bricks.png^mini_furnace_lit.png"
	},
	paramtype2 = "facedir",
	light_source = 8,
	drop = "mini_furnaces:deep_furnace",
	groups = {cracky=2, level = 1, not_in_creative_inventory=1},
	on_timer = furnace_node_timer,
	can_dig = can_dig,
})

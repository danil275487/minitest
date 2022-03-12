farming = {}
local plant_lists = {}
local plant_nodename_to_id_list = {}

local function get_intervals_counter(pos, interval, chance)
	local meta = minetest.get_meta(pos)
	local time_speed = tonumber(minetest.settings:get('time_speed') or 72)
	local current_game_time
	if time_speed == nil then
		return 1
	end
	if (time_speed < 0.1) then
		return 1
	end
	local time_multiplier = 86400 / time_speed
	current_game_time = .0 + ((minetest.get_day_count() + minetest.get_timeofday()) * time_multiplier)

	local approx_interval = math.max(interval, 1) * math.max(chance, 1)

	local last_game_time = meta:get_string("last_gametime")
	if last_game_time then
		last_game_time = tonumber(last_game_time)
	end
	if not last_game_time or last_game_time < 1 then
		last_game_time = current_game_time - approx_interval / 10
	elseif last_game_time == current_game_time then
		current_game_time = current_game_time + approx_interval
	end

	local elapsed_game_time = .0 + current_game_time - last_game_time

	meta:set_string("last_gametime", tostring(current_game_time))

	return elapsed_game_time / approx_interval
end

local function get_avg_light_level(pos)
	local node_light = tonumber(minetest.get_node_light(pos) or 0)
	local meta = minetest.get_meta(pos)
	local counter = meta:get_int("avg_light_count")
	local summary = meta:get_int("avg_light_summary")
	if counter > 99 then
		counter = 51
		summary = math.ceil((summary + 0.0) / 2.0)
	else
		counter = counter + 1

	end
	summary = summary + node_light
	meta:set_int("avg_light_count", counter)
	meta:set_int("avg_light_summary", summary)
	return math.ceil((summary + 0.0) / counter)
end

function farming:add_plant(identifier, full_grown, names, interval, chance)
	plant_lists[identifier] = {}
	plant_lists[identifier].full_grown = full_grown
	plant_lists[identifier].names = names
	plant_lists[identifier].interval = interval
	plant_lists[identifier].chance = chance
	minetest.register_abm({
		label = string.format("Farming plant growth (%s)", identifier),
		nodenames = names,
		interval = interval,
		chance = chance,
		action = function(pos, node)
			local low_speed = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name ~= "mini_farming:farmland_wet"
			farming:grow_plant(identifier, pos, node, false, false, low_speed)
		end,
	})
	for _, nodename in pairs(names) do
		plant_nodename_to_id_list[nodename] = identifier
	end
end

-- Attempts to advance a plant at pos by one or more growth stages (if possible)
-- identifier: Identifier of plant as defined by farming:add_plant
-- pos: Position
-- node: Node table
-- stages: Number of stages to advance (optional, defaults to 1)
-- ignore_light: if true, ignore light requirements for growing

-- Returns true if plant has been grown by 1 or more stages.
-- Returns false if nothing changed.
function farming:grow_plant(identifier, pos, node, stages, ignore_light, low_speed)
	local average_light_level = get_avg_light_level(pos)
	local plant_info = plant_lists[identifier]
	local intervals_counter = get_intervals_counter(pos, plant_info.interval, plant_info.chance)
	local low_speed = low_speed or false
	if low_speed then
		if intervals_counter < 1.01 and math.random(0, 9) > 0 then
			return
		else
			intervals_counter = intervals_counter / 10
		end
	end
	if not minetest.get_node_light(pos) and not ignore_light and intervals_counter < 1.5 then
		return false
	end
	if minetest.get_node_light(pos) < 10 and not ignore_light and intervals_counter < 1.5 then
		return false
	end

	if intervals_counter >= 1.5 then
		if average_light_level < 0.1 then
			return false
		end
		if average_light_level < 10 then
			intervals_counter = intervals_counter * average_light_level / 10
		end
	end

	local step = nil

	for i, name in ipairs(plant_info.names) do
		if name == node.name then
			step = i
			break
		end
	end
	if step == nil then
		return false
	end
	if not stages then
		stages = 1
	end
	--stages = stages + math.ceil(intervals_counter)
	local new_node = {name = plant_info.names[step+stages]}
	if new_node.name == nil then
		new_node.name = plant_info.full_grown
	end
	new_node.param = node.param
	new_node.param2 = node.param2
	minetest.set_node(pos, new_node)
	return true
end

function farming:place_seed(itemstack, placer, pointed_thing, plantname)
	local pt = pointed_thing
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

	-- Use pointed node's on_rightclick function first, if present
	local node = minetest.get_node(pt.under)
	if placer and not placer:get_player_control().sneak then
		if minetest.registered_nodes[node.name] and minetest.registered_nodes[node.name].on_rightclick then
			return minetest.registered_nodes[node.name].on_rightclick(pt.under, node, placer, itemstack) or itemstack
		end
	end

	local pos = {x=pt.above.x, y=pt.above.y-1, z=pt.above.z}
	local farmland = minetest.get_node(pos)
	pos= {x=pt.above.x, y=pt.above.y, z=pt.above.z}
	local place_s = minetest.get_node(pos)

	if string.find(farmland.name, "mini_farming:farmland") and string.find(place_s.name, "air")  then
		minetest.add_node(pos, {name=plantname, param2 = minetest.registered_nodes[plantname].place_param2})
		local intervals_counter = get_intervals_counter(pos, 1, 1)
	else
		return
	end

	if not minetest.is_creative_enabled(placer:get_player_name()) then
		itemstack:take_item()
	end
	return itemstack
end


minetest.register_lbm({
	label = "Add growth for unloaded farming plants",
	name = "mini_farming:farming_growth",
	nodenames = {"group:plant"},
	run_at_every_load = true,
	action = function(pos, node)
		local identifier = plant_nodename_to_id_list[node.name]
		if not identifier then
			return
		end
		local low_speed = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name ~= "mini_farming:farmland_wet"
		farming:grow_plant(identifier, pos, node, false, false, low_speed)
	end,
})

--Farmlands
minetest.register_node("mini_farming:farmland", {
	description = "Farmland",
	tiles = { "mt_atlas.png^[sheet:8x8:6,4", "mt_atlas.png^[sheet:8x8:1,0" },
	drop = "mini_nodes:dirt",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_int("wet", 0)
	end,
	groups = { crumbly = 3 },
})

minetest.register_node("mini_farming:farmland_wet", {
	description = "Farmland",
	tiles = { "mt_atlas.png^[sheet:8x8:5,4", "mt_atlas.png^[sheet:8x8:1,0" },
	drop = "mini_nodes:dirt",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_int("wet", 7)
	end,
	groups = { crumbly = 3 },
})

minetest.register_abm({
	label = "Farmland hydration",
	nodenames = {"mini_farming:farmland", "mini_farming:farmland_wet"},
	interval = 15,
	chance = 4,
	action = function(pos, node)
		-- Get wetness value
		local meta = minetest.get_meta(pos)
		local wet = meta:get_int("wet")
		if not wet then
			if node.name == "mini_farming:farmland" then
				wet = 0
			else
				wet = 7
			end
		end

		-- Turn back into dirt when covered by solid node
		local above_node = minetest.get_node_or_nil({x=pos.x,y=pos.y+1,z=pos.z})
		if above_node then
			if minetest.get_item_group(above_node.name, "solid") ~= 0 then
				node.name = "mini_nodes:dirt"
				minetest.set_node(pos, node)
				return
			end
		end

		-- Check an area of 9×2×9 around the node for nodename (9×9 on same level and 9×9 below)
		local check_surroundings = function(pos, nodename)
			local nodes = minetest.find_nodes_in_area({x=pos.x-4,y=pos.y,z=pos.z-4}, {x=pos.x+4,y=pos.y+1,z=pos.z+4}, {nodename})
			return #nodes > 0
		end

		if check_surroundings(pos, "group:water") then
			if node.name ~= "mini_farming:farmland_wet" then
				-- Make it wet
				node.name = "mini_farming:farmland_wet"
				minetest.set_node(pos, node)
			end
		else -- No water nearby.
			-- The decay branch (make farmland dry or turn back to dirt)

			-- No decay near unloaded areas since these might include water.
			if not check_surroundings(pos, "ignore") then
				if wet <= 0 then
					local n_def = minetest.registered_nodes[node.name] or nil
					local nn = minetest.get_node_or_nil({x=pos.x,y=pos.y+1,z=pos.z})
					if not nn or not nn.name then
						return
					end
					local nn_def = minetest.registered_nodes[nn.name] or nil

					if nn_def and minetest.get_item_group(nn.name, "plant") == 0 then
						node.name = "mini_nodes:dirt"
						minetest.set_node(pos, node)
						return
					end
				else
					if wet == 7 then
						node.name = "mini_farming:farmland"
						minetest.swap_node(pos, node)
					end
					-- Slowly count down wetness
					meta:set_int("wet", wet-1)
				end
			end
		end
	end,
})

--Wheat
local sel_heights = {
	-5/16,
	5/16,
	6/16,
}

for i = 1, 3 do
	minetest.register_node("mini_farming:wheat_plant_"..i, {
		description = "Wheat",
		paramtype = "light",
		paramtype2 = "meshoptions",
		place_param2 = 3,
		sunlight_propagates = true,
		walkable = false,
		drawtype = "plantlike",
		drop = "mini_items:seeds",
		tiles = {"mt_atlas.png^[sheet:8x8:"..(i-1)..",4"},
		inventory_image = "mt_atlas.png^[sheet:8x8:"..(i-1)..",4",
		wield_image = "mt_atlas.png^[sheet:8x8:"..(i-1)..",4",
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, sel_heights[i], 0.5}
			},
		},
		groups = {dig_immediate=3, not_in_creative_inventory=1, plant=1},
	})
end

minetest.register_node("mini_farming:wheat_plant", {
	description = "Wheat",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 3,
	walkable = false,
	drawtype = "plantlike",
	tiles = {"mt_atlas.png^[sheet:8x8:3,4"},
	inventory_image = "mt_atlas.png^[sheet:8x8:3,4",
	wield_image = "mt_atlas.png^[sheet:8x8:3,4",
	drop = {
		max_items = 4,
		items = {
			{ items = {'mini_items:seeds'} },
			{ items = {'mini_items:seeds'}, rarity = 2},
			{ items = {'mini_items:seeds'}, rarity = 5},
			{ items = {'mini_items:wheat'} }
		}
	},
	groups = {dig_immediate=3, not_in_creative_inventory=1, plant=1,attached_node=1},
})

farming:add_plant("plant_wheat", "mini_farming:wheat_plant", {"mini_farming:wheat_plant_1", "mini_farming:wheat_plant_2", "mini_farming:wheat_plant_3"}, 30,10)

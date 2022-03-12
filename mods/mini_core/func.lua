--Easier schematic loading
function mts(name)
	return minetest.get_modpath("mini_core").."/schems/"..name..".mts"
end

-- Simple formspec wrapper that does variable substitution
function formspec_wrapper(formspec, variables)
	local retval = formspec
	for k,v in pairs(variables) do
		retval = retval:gsub("${"..k.."}", v)
	end
	return retval
end

--Tree growing
function can_grow(pos)
	local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not node_under then
		return false
	end
	if minetest.get_item_group(node_under.name, "soil") == 0 then
		return false
	end
	local light_level = minetest.get_node_light(pos)
	if not light_level or light_level < 8 then
		return false
	end
	return true
end

--Grow sapling
function grow_sapling(pos)
	if not can_grow(pos) then
		minetest.get_node_timer(pos):start(math.random(60,480))
		return
	end
	local node = minetest.get_node(pos)
	if node.name == "mini_farming:oak_sapling" then
		minetest.remove_node(pos)
		minetest.place_schematic({x = pos.x-3, y = pos.y-1, z = pos.z-3}, mts("tree"), "random", nil, false)
	end
end

--Functions for hoes
function create_soil(pos, inv)
	if pos == nil then
		return false
	end
	local node = minetest.get_node(pos)
	local name = node.name
	local above = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z})
	if minetest.get_item_group(name, "cultivatable") == 1 then
		if above.name == "air" then
			node.name = "mini_farming:farmland"
			minetest.set_node(pos, node)
			-- 1/10 chance of dropping a seed item
			if math.random(10) == 10 then
				minetest.item_drop(ItemStack("mini_items:seeds"), nil, {x=pos.x, y=pos.y+1, z=pos.z})
			end

			return true
		end
	end
	return false
end

hoe_on_place_function = function(wear_divisor)
	return function(itemstack, user, pointed_thing)
		-- Call on_rightclick if the pointed node defines it
		local node = minetest.get_node(pointed_thing.under)
		if user and not user:get_player_control().sneak then
			if minetest.registered_nodes[node.name] and minetest.registered_nodes[node.name].on_rightclick then
				return minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, user, itemstack) or itemstack
			end
		end

		if create_soil(pointed_thing.under, user:get_inventory()) then
			if not minetest.is_creative_enabled(user:get_player_name()) then
				itemstack:add_wear(65535/wear_divisor)
			end
			return itemstack
		end
	end
end

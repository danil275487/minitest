mini_core.buckets = {}
mini_core.buckets.liquids = {}

function mini_core.register_liquid(def)
	mini_core.buckets.liquids[def.node] = def
	mini_core.buckets.liquids[core.registered_nodes[def.node].liquid_alternative_flowing] = def

	if def.itemname ~= nil then
		core.register_craftitem(def.itemname, {
			description = def.name,
			inventory_image = def.inventory_image,
			stack_max = 1,
			liquids_pointable = true,
			on_place = function(itemstack, user, pointed_thing)
				-- Must be pointing to node
				if pointed_thing.type ~= "node" then
					return
				end

				local node = core.get_node_or_nil(pointed_thing.under)
				local ndef = node and core.registered_nodes[node.name]

				-- Call on_rightclick if the pointed node defines it
				if ndef and ndef.on_rightclick and
						not (user and user:is_player() and
						user:get_player_control().sneak) then
					return ndef.on_rightclick(
						pointed_thing.under,
						node, user,
						itemstack)
				end

				local lpos

				-- Check if pointing to a buildable node
				if ndef and ndef.buildable_to then
					-- buildable; replace the node
					lpos = pointed_thing.under
				else
					-- not buildable to; place the liquid above
					-- check if the node above can be replaced

					lpos = pointed_thing.above
					node = core.get_node_or_nil(lpos)
					local above_ndef = node and core.registered_nodes[node.name]

					if not above_ndef or not above_ndef.buildable_to then
						-- do not remove the bucket with the liquid
						return itemstack
					end
				end

				core.set_node(lpos, {name = def.node})
				return ItemStack("mini_items:bucket")
			end
		})
	end
end

core.register_craftitem("mini_items:bucket", {
	description = "Bucket",
	inventory_image = mini_core.sheet('item',4,0),
	liquids_pointable = true,
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type == "object" then
			pointed_thing.ref:punch(user, 1.0, { full_punch_interval=1.0 }, nil)
			return user:get_wielded_item()
		elseif pointed_thing.type ~= "node" then
			-- do nothing if it's neither object nor node
			return
		end
		-- Check if pointing to a liquid source
		local node = core.get_node(pointed_thing.under)
		local liquiddef = mini_core.buckets.liquids[node.name]
		local item_count = user:get_wielded_item():get_count()

		if liquiddef ~= nil
		and liquiddef.itemname ~= nil
		and node.name == liquiddef.node then

			-- default set to return filled bucket
			local giving_back = liquiddef.itemname

			-- check if holding more than 1 empty bucket
			if item_count > 1 then

				-- if space in inventory add filled bucked, otherwise drop as item
				local inv = user:get_inventory()
				if inv:room_for_item("main", {name=liquiddef.itemname}) then
					inv:add_item("main", liquiddef.itemname)
				else
					local pos = user:get_pos()
					pos.y = math.floor(pos.y + 0.5)
					core.add_item(pos, liquiddef.itemname)
				end

				-- set to return empty buckets minus 1
				giving_back = "mini_items:bucket "..tostring(item_count-1)

			end

			-- force_renew requires a source neighbour
			local source_neighbor = false
			if liquiddef.force_renew then
				source_neighbor =
					core.find_node_near(pointed_thing.under, 1, liquiddef.source)
			end
			if not (source_neighbor and liquiddef.force_renew) then
				core.add_node(pointed_thing.under, {name = "air"})
			end

			return ItemStack(giving_back)
		else
			-- non-liquid nodes will have their on_punch triggered
			local node_def = core.registered_nodes[node.name]
			if node_def then
				node_def.on_punch(pointed_thing.under, node, user, pointed_thing)
			end
			return user:get_wielded_item()
		end
	end
})

mini_core.register_liquid({
	node = "mini_nodes:water_source",
	itemname = "mini_items:water_bucket",
	inventory_image= mini_core.sheet('item',5,0),
	name = "Water Bucket"
})

mini_core.register_liquid({
	node = "mini_nodes:river_water_source",
	itemname = "mini_items:river_water_bucket",
	inventory_image= mini_core.sheet('item',6,0),
	name = "River Water Bucket"
})

mini_core.register_liquid({
	node = "mini_nodes:lava_source",
	itemname = "mini_items:lava_bucket",
	inventory_image= mini_core.sheet('item',7,0),
	name = "Lava Bucket"
})

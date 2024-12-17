core.register_craftitem("mini_items:bottle", {
	description = "Bottle",
	inventory_image = mini_core.sheet('item',0,3),
	liquids_pointable = true,
	on_use = function(itemstack,user,pointed_thing)
		local node = core.get_node(pointed_thing.under)
		local inv = user:get_inventory()
		if core.get_item_group(node.name, "water") == 1 then
			if node.name == "mini_nodes:water_source" or node.name == "mini_nodes:water_flowing" then
				inv:add_item("main", ItemStack("mini_items:water_bottle"))
			elseif node.name == "mini_nodes:river_water_source" or node.name == "mini_nodes:river_water_flowing" then
				inv:add_item("main", ItemStack("mini_items:river_water_bottle"))
			end
			itemstack:take_item()
			return itemstack
		else
			return itemstack
		end
	end
})

--function mini_core.register_potion()

core.register_craftitem("mini_items:water_bottle", {
	description = "Bottle with Water",
	inventory_image = mini_core.sheet('item',5,3).."^"..mini_core.sheet('item',0,3),
	on_use = function(itemstack,user)
		local count = itemstack:get_count()
		local inv = user:get_inventory()
		inv:add_item("main", "mini_items:bottle")
		return "mini_items:water_bottle "..count-1
	end
})

core.register_craftitem("mini_items:river_water_bottle", {
	description = "Bottle with River Water",
	inventory_image = mini_core.sheet('item',5,3).."^"..mini_core.sheet('item',0,3),
	on_use = function(itemstack,user)
		local hp = user:get_hp()
		user:set_hp(hp+5)
		local count = itemstack:get_count()
		local inv = user:get_inventory()
		inv:add_item("main", "mini_items:bottle")
		return "mini_items:river_water_bottle "..count-1
	end
})

core.register_craftitem("mini_items:heal_potion", {
	description = "Healing Potion",
	inventory_image = mini_core.sheet('item',1,3).."^"..mini_core.sheet('item',0,3),
	on_use = function(itemstack,user)
		local hp = user:get_hp()
		user:set_hp(hp+10)
		local count = itemstack:get_count()
		local inv = user:get_inventory()
		inv:add_item("main", "mini_items:bottle")
		return "mini_items:heal_potion "..count-1
	end
})

core.register_craftitem("mini_items:speed_potion", {
	description = "Speed Potion",
	inventory_image = mini_core.sheet('item',2,3).."^"..mini_core.sheet('item',0,3),
	on_use = function(itemstack,user)
		user:set_fov(1.10, true, 0.25)
		user:set_physics_override({
			speed = 2.5
		})
		core.after(10, function()
			user:set_fov(0, true, 0.5)
			user:set_physics_override({
				speed = 1
			})
		end, user)
		local count = itemstack:get_count()
		local inv = user:get_inventory()
		inv:add_item("main", "mini_items:bottle")
		return "mini_items:speed_potion "..count-1
	end
})

core.register_craftitem("mini_items:jump_potion", {
	description = "Jump Potion",
	inventory_image = mini_core.sheet('item',3,3).."^"..mini_core.sheet('item',0,3),
	on_use = function(itemstack,user)
		user:set_fov(1.10, true, 0.25)
		user:set_physics_override({
			jump = 1.5
		})
		core.after(10, function()
			user:set_fov(0, true, 0.5)
			user:set_physics_override({
				jump = 1
			})
		end, user)
		local count = itemstack:get_count()
		local inv = user:get_inventory()
		inv:add_item("main", "mini_items:bottle")
		return "mini_items:jump_potion "..count-1
	end
})

core.register_craftitem("mini_items:river_heal_potion", {
	description = "Healing Potion",
	inventory_image = mini_core.sheet('item',1,3).."^"..mini_core.sheet('item',0,3),
	on_use = function(itemstack,user)
		local hp = user:get_hp()
		user:set_hp(hp+15)
		local count = itemstack:get_count()
		local inv = user:get_inventory()
		inv:add_item("main", "mini_items:bottle")
		return "mini_items:river_heal_potion "..count-1
	end
})

core.register_craftitem("mini_items:river_speed_potion", {
	description = "Speed Potion",
	inventory_image = mini_core.sheet('item',2,3).."^"..mini_core.sheet('item',0,3),
	on_use = function(itemstack,user)
		user:set_fov(1.10, true, 0.25)
		user:set_physics_override({
			speed = 2.5
		})
		core.after(25, function()
			user:set_fov(0, true, 0.5)
			user:set_physics_override({
				speed = 1
			})
		end, user)
		local count = itemstack:get_count()
		local inv = user:get_inventory()
		inv:add_item("main", "mini_items:bottle")
		return "mini_items:river_speed_potion "..count-1
	end
})

core.register_craftitem("mini_items:river_jump_potion", {
	description = "Jump Potion",
	inventory_image = mini_core.sheet('item',3,3).."^"..mini_core.sheet('item',0,3),
	on_use = function(itemstack,user)
		user:set_fov(1.10, true, 0.25)
		user:set_physics_override({
			jump = 1.5
		})
		core.after(25, function()
			user:set_fov(0, true, 0.5)
			user:set_physics_override({
				jump = 1
			})
		end, user)
		local count = itemstack:get_count()
		local inv = user:get_inventory()
		inv:add_item("main", "mini_items:bottle")
		return "mini_items:jump_potion "..count-1
	end
})

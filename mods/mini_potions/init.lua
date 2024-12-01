core.register_craftitem("mini_potions:bottle", {
	description = "Bottle",
	inventory_image = "mini_bottle.png",
	liquids_pointable = true,
	on_use = function(itemstack,user,pointed_thing)
		local node = core.get_node(pointed_thing.under)
		local inv = user:get_inventory()
		if core.get_item_group(node.name, "water") == 1 then
			if node.name == "mini_liquids:water_source" or node.name == "mini_liquids:water_flowing" then
				inv:add_item("main", ItemStack("mini_potions:water_bottle"))
			elseif node.name == "mini_liquids:river_water_source" or node.name == "mini_liquids:river_water_flowing" then
				inv:add_item("main", ItemStack("mini_potions:river_water_bottle"))
			end
			itemstack:take_item()
			return itemstack
		else
			return itemstack
		end
	end
})

core.register_craftitem("mini_potions:water_bottle", {
	description = "Bottle with Water",
	inventory_image = "mini_water_bottle.png^mini_bottle.png",
	on_use = function(itemstack,user)
		local count = itemstack:get_count()
		local inv = user:get_inventory()
		inv:add_item("main", "mini_potions:bottle")
		return "mini_potions:water_bottle "..count-1
	end
})

core.register_craftitem("mini_potions:river_water_bottle", {
	description = "Bottle with River Water",
	inventory_image = "mini_river_water_bottle.png^mini_bottle.png",
	on_use = function(itemstack,user)
		local count = itemstack:get_count()
		local inv = user:get_inventory()
		inv:add_item("main", "mini_potions:bottle")
		return "mini_potions:river_water_bottle "..count-1
	end
})

core.register_craftitem("mini_potions:heal_potion", {
	description = "Healing Potion",
	inventory_image = "mini_heal_potion.png^mini_bottle.png",
	on_use = function(itemstack,user)
		local hp = user:get_hp()
		user:set_hp(hp+10)
		local count = itemstack:get_count()
		local inv = user:get_inventory()
		inv:add_item("main", "mini_potions:bottle")
		return "mini_potions:heal_potion "..count-1
	end
})

core.register_craftitem("mini_potions:speed_potion", {
	description = "Speed Potion",
	inventory_image = "mini_speed_potion.png^mini_bottle.png",
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
		inv:add_item("main", "mini_potions:bottle")
		return "mini_potions:speed_potion "..count-1
	end
})

core.register_craftitem("mini_potions:jump_potion", {
	description = "Jump Potion",
	inventory_image = "mini_jump_potion.png^mini_bottle.png",
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
		inv:add_item("main", "mini_potions:bottle")
		return "mini_potions:jump_potion "..count-1
	end
})

core.register_craftitem("mini_potions:river_heal_potion", {
	description = "Healing Potion",
	inventory_image = "mini_heal_potion.png^mini_bottle.png",
	on_use = function(itemstack,user)
		local hp = user:get_hp()
		user:set_hp(hp+15)
		local count = itemstack:get_count()
		local inv = user:get_inventory()
		inv:add_item("main", "mini_potions:bottle")
		return "mini_potions:river_heal_potion "..count-1
	end
})

core.register_craftitem("mini_potions:river_speed_potion", {
	description = "Speed Potion",
	inventory_image = "mini_speed_potion.png^mini_bottle.png",
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
		inv:add_item("main", "mini_potions:bottle")
		return "mini_potions:river_speed_potion "..count-1
	end
})

core.register_craftitem("mini_potions:river_jump_potion", {
	description = "Jump Potion",
	inventory_image = "mini_jump_potion.png^mini_bottle.png",
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
		inv:add_item("main", "mini_potions:bottle")
		return "mini_potions:jump_potion "..count-1
	end
})

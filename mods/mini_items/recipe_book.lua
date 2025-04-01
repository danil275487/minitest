--The item
core.register_craftitem(":mini_items:recipe_book", {
	description = "Recipe Book",
	inventory_image = mini_core.sheet("item",5,1),
	stack_max = 1,
	on_drop = function()
		return
	end,
	on_place = function(itemstack, user)
		local stack = itemstack
		local meta = stack:get_meta()
		if meta:get_string("page") == "" then
			meta:set_string("page", 0)
		end
		local function show_formspec()
			fslib.show_formspec(user, mini_core.formspecs.recipe_book(meta:get_string("page")), function(fields)
				if fields.prev then
					meta:set_string("page", meta:get_string("page")-2)
					user:set_wielded_item(stack)
					show_formspec()
				end
				if fields.next then
					meta:set_string("page", meta:get_string("page")+2)
					user:set_wielded_item(stack)
					show_formspec()
				end
				if fields.reset then
					meta:set_string("page", 0)
					user:set_wielded_item(stack)
					show_formspec()
				end
			end)
		end
		show_formspec()
	end
})

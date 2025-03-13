local contexts = {}

local function get_context(name)
	local context = contexts[name] or {}
	contexts[name] = context
	return context
end

core.register_on_leaveplayer(function(player)
	contexts[player:get_player_name()] = nil
end)

--Formspec navigation
core.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "mini_items:recipe_book" and fields.quit == nil then
		local context = get_context(player:get_player_name())
		if fields.back then
			context.page = context.page - 1
		end
			if fields.forward then
			context.page = context.page + 1
		end
		if context.page <= 1 then
			context.page = 1
		end
		if context.page >= #mini_core.registered_recipes then
			context.page = #mini_core.registered_recipes
		end
		core.show_formspec(player:get_player_name(),"mini_items:recipe_book",mini_core.formspecs.recipe_book(context.page))
	end
end)

--The item
core.register_craftitem("mini_items:recipe_book", {
	description = "Recipe Book",
	inventory_image = mini_core.sheet("item",5,1),
	stack_max = 1,
	on_drop = function()
		return
	end,
	on_place = function(itemstack, user)
		get_context(user:get_player_name()).page = get_context(user:get_player_name()).page or 1
		core.show_formspec(user:get_player_name(),"mini_items:recipe_book",mini_core.formspecs.recipe_book(get_context(user:get_player_name()).page))
	end
})

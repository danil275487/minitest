local contexts = {}

local function get_context(name)
	local context = contexts[name] or {}
	contexts[name] = context
	return context
end

core.register_on_leaveplayer(function(player)
	contexts[player:get_player_name()] = nil
end)

--The formspec
function mini_core.show_recipe_book_formspec(page)
	local recipe = mini_core.registered_recipes[page]
	local method_image = ""
	if recipe.method == "normal" then
		method_image = "mini_inv_arrow.png"
	else
		method_image = "mini_furnace_ui_fire_bg.png"
	end
	return mini_core.formspec_wrapper([[
		formspec_version[8]
		size[7,6]
		no_prepend[]
		label[0,0.25;page: ${page}]
		image[0,4;1,1;${method_image}]
		${input}
		${output}
		button[0,5;1,1;back;<]
		button[6,5;1,1;forward;>]
	]], {
		method_image = method_image,
		page = page.."/"..#mini_core.registered_recipes,
		input = mini_core.item_grid(0,1,3,3,recipe.width,3,recipe.items, _, _, 1),
		output = mini_core.item_grid(3.75,1,1,1,1,1, recipe.output, _, _, 1),
	})
end

--Formspec navigation
core.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "mini_items:recipe_book_ui" and fields.quit == nil then
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
		core.show_formspec(player:get_player_name(),"mini_items:recipe_book_ui",mini_core.show_recipe_book_formspec(context.page))
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
		core.show_formspec(user:get_player_name(),"mini_items:recipe_book_ui",mini_core.show_recipe_book_formspec(get_context(user:get_player_name()).page))
	end
})

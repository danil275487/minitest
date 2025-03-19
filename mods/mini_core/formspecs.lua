mini_core.formspecs = {}

local bg = mini_core.sheet("ui",0,0,6,1).."^[resize:24x24"
local bg_dark = mini_core.sheet("ui",2,0,6,1).."^[resize:24x24"
local button_active = mini_core.sheet("ui",1,0,6,1).."^[resize:24x24"

--global formspec prepend
function mini_core.formspecs.prepend()
	return fslib.build_formspec({
		{"background9", {0,0}; {0,0}; bg, true, 8},
		{"listcolors", "#787878ff", "#505050ff", "#00000000", "#7869c4ff", "#ffffffff"},
		{"style_type", "button:default"; "border=false"; "bgimg="..bg; "bgimg_middle=8,8"},
		{"style_type", "button:pressed"; "border=false"; "bgimg="..bg_dark; "bgimg_middle=8,8"}
	})
end

--inventory formspec
function mini_core.formspecs.inventory(player)
	local creative_buttons, sub = {}, 0.75
	if core.is_creative_enabled(player) then
		sub = 0
		creative_buttons = {
			{"background9", {0,0}; {8.25,0.75}; bg_dark, false, 8},
			{"button", {0,0}; {3,0.75}; "inventory", "Inventory"},
			{"button", {3,0}; {3,0.75}; "creative", "Creative"},
		}
	end
	return fslib.build_formspec({
		{"formspec_version", 8},
		{"size", {8.25, 8.25-sub}},
		{"list", "current_player", "main", {0.5, 4-sub}; {6, 2}; 6},
		{"list", "current_player", "main", {0.5, 6.75-sub}; {6, 1}},
		{"list", "current_player", "craft", {1.75, 1.25-sub}; {2, 1}},
		{"list", "current_player", "craft", {1.75, 2.50-sub}; {2, 1}; 3},
		{"image", {4.25, 1.875-sub}; {1, 1}; "mini_inv_arrow.png^[transformR270"},
		{"list", "current_player", "craftpreview", {5.5, 1.875-sub}; {1, 1}},
		unpack(creative_buttons)
	})
end

function mini_core.formspecs.creative(page, max_page, ipp)
	local start = 0 + (page-1)*ipp
	local scrubber_pos = 2.25+(5.5-2.25)*(page-1)/(max_page-1)
	return fslib.build_formspec({
		{"formspec_version", 8},
		{"size", {8.25, 9.25}},
		{"list", "detached:creative", "main", {0.5, 1.25}; {5, 5}, start},
		{"list", "current_player", "main", {0.5, 7.75}; {6, 1}},
		{"listring"},
		{"field", {0,0}; {0,0}; "internal_paginator";"";page},
		{"button", {6.75, 1.25}; {1, 1}; "inv_creative_prev", "/\\"},
		{"button", {6.75, 6.25}; {1, 1}; "inv_creative_next", "\\/"},
		{"background9", {6.75, 2.25}; {1,4}; bg_dark, false, 8},
		{"background9", {6.75, scrubber_pos}; {1,0.75}; bg, false, 8},
		{"background9", {0,0}; {8.25,0.75}; bg_dark, false, 8},
		{"button", {0,0}; {3,0.75}; "inventory", "Inventory"},
		{"button", {3,0}; {3,0.75}; "creative", "Creative"},
	})
end

--node formspecs
function mini_core.formspecs.crafting_table()
	return [[
		formspec_version[8]
		size[8.25,8.75]
		list[current_player;main;0.5,4.5;6,2;6]
		list[current_player;main;0.5,7.25;6,1;0]
		list[current_player;craft;1.125,0.5;3,3;]
		image[4.875,1.75;1,1;mini_inv_arrow.png^[transformR270]
		list[current_player;craftpreview;6.125,1.75;1,1;]
	]]
end

function mini_core.formspecs.chest()
	return [[
		formspec_version[8]
		size[8.25,8.75]
		list[current_player;main;0.5,4.5;6,2;6]
		list[current_player;main;0.5,7.25;6,1;0]
		list[current_name;main;0.5,0.5;6,3;]
	]]
end

 --furnace formspecs
function mini_core.formspecs.furnace()
	return [[
		formspec_version[8]
		size[8.25,8.75]
		list[context;src;2.35,0.5;1,1;]
		list[context;fuel;2.35,3;1,1;]
		image[2.35,1.75;1,1;mini_furnace_ui_fire_bg.png]
		image[3.60,1.75;1,1;mini_inv_arrow.png^[transformR270]
		list[context;dst;4.85,1.75;1,1;]
		list[current_player;main;0.5,4.5;6,2;6]
		list[current_player;main;0.5,7.25;6,1;0]
	]]
end

function mini_core.formspecs.furnace_active(fuel_percent, item_percent)
	return mini_core.formspec_wrapper([[
		formspec_version[8]
		size[8.25,8.75]
		list[context;src;2.35,0.5;1,1;]
		list[context;fuel;2.35,3;1,1;]
		image[2.35,1.75;1,1;mini_furnace_ui_fire_bg.png^[lowpart:${fuel_pct}:mini_furnace_ui_fire.png]
		image[3.60,1.75;1,1;mini_inv_arrow.png^[lowpart:${item_pct}:mini_inv_arrow_full.png^[transformR270]
		list[context;dst;4.85,1.75;1,1;]
		list[current_player;main;0.5,4.5;6,2;6]
		list[current_player;main;0.5,7.25;6,1;0]
	]],{
		fuel_pct = fuel_percent,
		item_pct = item_percent
	})
end

--item formspecss
function mini_core.formspecs.recipe_book(page)
	local recipe = mini_core.registered_recipes[page]
	core.debug(recipe.width)
	local method_image
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

		button[0,5;1,1;back;<]
		button[6,5;1,1;forward;>]
	]], {
		method_image = method_image,
		page = page.."/"..#mini_core.registered_recipes,
		input = mini_core.item_grid({
					x = 0, y = 0.2,
					r = recipe.width, c = 3,
					tooltips = true,
					background = "green",
					spacing = 1.5,
					items = recipe.items
				}),
-- 		output = mini_core.item_grid({
-- 					 x = 3.75, y = 1,
-- 					 r = 1, c = 1,
-- 					 tooltips = true,
-- 					 background = _,
-- 					 spacing = 1,
-- 					 items = recipe.output
-- 				 }),
	})
end

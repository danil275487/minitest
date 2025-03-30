mini_core.formspecs = {}

--images
local bg_dark = mini_core.sheet("ui",0,0).."^[resize:32x32"
local bg_gray = mini_core.sheet("ui",1,0).."^[resize:32x32"
local bg_yellow = mini_core.sheet("ui",5,0).."^[resize:32x32"
local bg_blue = mini_core.sheet("ui",7,0).."^[resize:32x32"

local fold_yellow = mini_core.tile_image(mini_core.sheet("ui",0,1, 8,8, true).."\\^[resize\\:32x32", 32,32, 1, 14)
local fold_blue = mini_core.tile_image(mini_core.sheet("ui",1,1, 8,8, true).."\\^[resize\\:32x32", 32,32, 1, 14)
local page_flip = mini_core.sheet("ui",3,1, 4,4)
local arrow_book = mini_core.sheet("ui",2,1, 4,4)
local fire_book = mini_core.sheet("ui",2,2, 4,4)

local arrow = mini_core.sheet("ui",0,1, 4,4)
local arrow_full = mini_core.sheet("ui",1,1, 4,4, true)
local fire = mini_core.sheet("ui",0,2, 4,4)
local fire_full = mini_core.sheet("ui",1,2, 4,4, true)


--global formspec prepend
function mini_core.formspecs.prepend()
	return fslib.build_formspec({
		{"background9", {0,0}; {0,0}; bg_gray, true, 8},
		{"listcolors", "#787878ff", "#505050ff", "#00000000", "#7869c4ff", "#ffffffff"},
		{"style_type", "button:default"; "border=false"; "bgimg="..bg_gray; "bgimg_middle=8,8"},
		{"style_type", "button:pressed"; "border=false"; "bgimg="..bg_blue; "bgimg_middle=8,8"}
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
		{"image", {4.25, 1.875-sub}; {1, 1}; arrow.."^[transformR270"},
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
		{"background9", {6.75, scrubber_pos}; {1,0.75}; bg_gray, false, 8},
		{"background9", {0,0}; {8.25,0.75}; bg_dark, false, 8},
		{"button", {0,0}; {3,0.75}; "inventory", "Inventory"},
		{"button", {3,0}; {3,0.75}; "creative", "Creative"},
	})
end

--node formspecs
function mini_core.formspecs.crafting_table()
	return fslib.build_formspec({
		{"formspec_version", 8},
		{"size", {8.25, 8.75}},
		{"list", "current_player", "main", {0.5, 4.5}; {6, 2}; 6},
		{"list", "current_player", "main", {0.5, 7.25}; {6, 1}},
		{"list", "current_player", "craft", {1.125, 0.5}; {3, 3}},
		{"image", {4.875, 1.75}; {1, 1}; arrow.."^[transformR270"},
		{"list", "current_player", "craftpreview", {6.125, 1.75}; {1, 1}},
	})
end

function mini_core.formspecs.chest()
	return fslib.build_formspec({
		{"formspec_version", 8},
		{"size", {8.25, 8.75}},
		{"list", "current_player", "main", {0.5, 4.5}; {6, 2}; 6},
		{"list", "current_player", "main", {0.5, 7.25}; {6, 1}},
		{"list", "current_name", "main", {0.5, 0.5}; {6, 3}},
	})
end

 --furnace formspecs
function mini_core.formspecs.furnace()
	return fslib.build_formspec({
		{"formspec_version", 8},
		{"size", {8.25,8.75}},
		{"list", "current_player", "main", {0.5,4.5}; {6,2}; 6},
		{"list", "current_player", "main", {0.5,7.25}; {6,1}},
		{"list", "context", "fuel", {2.35,3}; {1,1}},
		{"list", "context", "src", {2.35,0.5}; {1,1}},
		{"list", "context", "dst", {4.85,1.75}; {1,1}},
		{"image", {2.35,1.75}; {1,1}; fire},
		{"image", {3.60,1.75}; {1,1}; arrow.."^[transformR270"},
	})
end

function mini_core.formspecs.furnace_active(fuel_percent, item_percent)
	local fire_img = fire.."^[lowpart:"..fuel_percent..":"..fire_full
	local arrow_img = "("..arrow.."^[lowpart:"..item_percent..":"..arrow_full..")^[transformR270"
	return fslib.build_formspec({
		{"formspec_version", 8},
		{"size", {8.25,8.75}},
		{"list", "current_player", "main", {0.5,4.5}; {6,2}; 6},
		{"list", "current_player", "main", {0.5,7.25}; {6,1}},
		{"list", "context", "fuel", {2.35,3}; {1,1}},
		{"list", "context", "src", {2.35,0.5}; {1,1}},
		{"list", "context", "dst", {4.85,1.75}; {1,1}},
		{"image", {2.35,1.75}; {1,1}; fire_img},
		{"image", {3.60,1.75}; {1,1}; arrow_img},
	})
end

--item formspecss
function mini_core.formspecs.recipe_book(page)
	local function gen_page(side, recipe)
		local desc = core.registered_items[recipe.output].description
		local form = {
			{"container", {4/8+(side*5),4/8}},
			{"hypertext", {0,1/8}; {4,6/8}; "itemname", "<global color=#574200 size=16 halign=center valign=top><b>"..desc.."</b>"},
			{"hypertext", {1,5+4/8}; {2,4/8}; "page", "<global color=#574200 size=16 halign=center valign=bottom>"..page+side.."/"..#mini_core.registered_recipes},
		}

		if recipe.type == "normal" then
			form[#form+1] = {"image", {1+4/8,4/8}; {1,1}; arrow_book}
		else
			form[#form+1] = {"image", {1+4/8,5}; {1,1}; fire_book}
		end

		form[#form+1] = {"container_end"}
		if recipe then
			core.debug(dump(recipe))
			return form
		end
		core.debug("recipe", recipe.output, "on side", side, "returned nil")
		return {}
	end

	local form = {
		{"formspec_version", 8},
		{"size", {10, 7}},
		{"no_prepend"},
		{"background9", {0,0}; {0,0}; bg_blue, true, 8},
		{"background9", {5,0}; {4/8,7}; fold_blue},
		{"background9", {5-4/8,0}; {4/8,7}; fold_blue.."^[transformR180"},
		{"background9", {3/8,3/8}; {0,0}; bg_yellow, true, 8},
		{"background9", {5,3/8}; {4/8,6+2/8}; fold_yellow},
		{"background9", {5-4/8,3/8}; {4/8,6+2/8}; fold_yellow.."^[transformR180"},
		{"style", "prev"; "border=false"},
		{"style", "next"; "border=false"},
		{"tooltip", "prev"; "Previous page", "#bfce72", "#574200"},
		{"tooltip", "next"; "Next page", "#bfce72", "#574200"},
		{"image_button", {3/8,6-3/8}; {1,1}; page_flip, "prev", ""},
		{"image_button", {9-3/8,6-3/8}; {1,1}; page_flip.."^[transformFX", "next", ""},
	}

	for _,v in pairs(gen_page(0, mini_core.registered_recipes[page])) do
		form[#form+1] = v
	end
	for _,v in pairs(gen_page(1, mini_core.registered_recipes[page+1])) do
		form[#form+1] = v
	end

	return fslib.build_formspec(form)
end

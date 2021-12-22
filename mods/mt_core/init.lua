--Load .lua files
dofile(minetest.get_modpath("mt_core") .. "/func.lua")
dofile(minetest.get_modpath("mt_core") .. "/hand.lua")
dofile(minetest.get_modpath("mt_core") .. "/craft.lua")

--Set up player relatee stuff and sky
mt_core = {}
minetest.register_on_joinplayer(function(player)
	player:set_properties({
		visual = "upright_sprite",
		textures = {"mt_char.png", "mt_char_back.png" },
		visual_size = { x = 0.85, y = 1.95 },
	})
	player:hud_set_hotbar_image("mt_hotbar.png")
	player:hud_set_hotbar_selected_image("mt_hotbar_selected.png")
	player:set_sky({
		base_color = "#67b6bd",
		type = "regular",
		sky_color = {
			day_sky = "#67b6bd",
			day_horizon = "#67b6bd",
			
			dawn_sky = "#7869c4",
			dawn_horizon = "#7869c4",
			
			night_sky = "#40318d",
			night_horizon = "#40318d",
			
			indoors = "#787878",
			}
	})
	player:set_sun({
		texture = "mt_sun.png",
		sunrise_visible = false,
	})
	player:set_moon({
		texture = "mt_moon.png",
	})
	player:set_stars({
		count = "2500",
		star_color = "#ffffffff",
		scale = "0.5",
	})
	player:set_clouds({
		density = 0.3,
		color = "#ffffffff",
		thickness = 5,
		speed = {x=5,z=0}
	})
end)

--Infinite materials in creative
minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
	if placer and placer:is_player() then
		return minetest.is_creative_enabled(placer:get_player_name())
	end
end
)

--Give initial items
local give_if_not_gotten_already = function(inv, list, item)
	if not inv:contains_item(list, item) then
			inv:add_item(list, item)
	end
end

local give_initial_stuff = function(player)
	local inv = player:get_inventory()
	give_if_not_gotten_already(inv, "main", "mt_items:stone_axe_wood_stick")
end

minetest.register_on_newplayer(function(player)
	give_initial_stuff(player)
end)

--Little funny easter egg :)
--DM me in Discord if you want to drop a apple on death.
minetest.register_on_dieplayer(function(entity, reason)
	if entity:get_player_name() == "Danil_2461" then
		minetest.item_drop(ItemStack("mt_items:apple"), entity, entity:get_pos())
	end
end)

--Drop items on death
minetest.register_on_dieplayer(function(entity, reason)
	if entity:is_player() then
		local inv = entity:get_inventory()
		for _, list_name in ipairs(inv:get_list("main")) do
			local pos = entity:get_pos()
			pos.y = pos.y + 1
			pos.x = pos.x + math.random(-5,5)
			minetest.item_drop(list_name, entity, entity:get_pos())
		end
		inv:set_list("main", {})
	end
end)
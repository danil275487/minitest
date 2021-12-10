--Load .lua files
dofile(minetest.get_modpath("mt_core") .. "/func.lua")
dofile(minetest.get_modpath("mt_core") .. "/hand.lua")
dofile(minetest.get_modpath("mt_core") .. "/craft.lua")

--Set up the sky
minetest.register_on_joinplayer(function(player)
	player:set_properties({
		visual = "upright_sprite",
		textures = {"mt_char.png", "mt_char_back.png" },
		visual_size = { x = 0.85, y = 1.95 },
	})
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
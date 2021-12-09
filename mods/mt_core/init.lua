--Load .lua files
dofile(minetest.get_modpath("mt_core") .. "/inventory.lua")
dofile(minetest.get_modpath("mt_core") .. "/func.lua")
dofile(minetest.get_modpath("mt_core") .. "/nodes.lua")
dofile(minetest.get_modpath("mt_core") .. "/items.lua")
dofile(minetest.get_modpath("mt_core") .. "/mapgen.lua")

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

--Register hand
if minetest.settings:get_bool("creative_mode") then
	local digtime = 42
	local caps = {times = {42, 42, 42}, uses = 0, maxlevel = 256}
	minetest.register_item(":", {
		type = "none",
		wield_image = "mt_hand.png",
		wield_scale = {x = 0.5, y = 1, z = 4},
		range = 9,
		tool_capabilities = {
			full_punch_interval = 0.9,
			max_drop_level = 0,
			groupcaps = {
				crumbly = caps,
				cracky  = caps,
				snappy  = caps,
				choppy  = caps,
				oddly_breakable_by_hand = caps,
				dig_immediate = {
					times = {[2] = digtime, [3] = 0},
					uses = 0,
					maxlevel = 256
				},
			},
			damage_groups = {fleshy = 10},
		}
	})
else
	minetest.register_item(":", {
		type = "none",
		wield_image = "mt_hand.png",
		wield_scale = {x = 0.5, y = 1, z = 4},
		tool_capabilities = {
			full_punch_interval = 0.9,
			max_drop_level = 0,
			groupcaps = {
				crumbly = {
					times = {[2] = 3.00, [3] = 1.0},
					uses = 0,
					maxlevel = 1,
				},
				snappy = {
					times = {[3] = 0.25},
					uses = 0,
					maxlevel = 1,
				},
				oddly_breakable_by_hand = {
					times = {[1] = 3.50, [2] = 2.00, [3] = 0.70},
					uses = 0,
				},
			},
			damage_groups = {fleshy = 1},
		}
	})
end

--Infinite materials in creative
minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
	if placer and placer:is_player() then
		return minetest.is_creative_enabled(placer:get_player_name())
	end
end)
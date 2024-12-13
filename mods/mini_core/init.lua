mini_core = {}

--Load .lua files
dofile(core.get_modpath("mini_core") .. "/func.lua")
dofile(core.get_modpath("mini_core") .. "/hand.lua")

--Set up player related stuff and sky
core.register_on_joinplayer(function(player)
	player:set_properties({
		visual = "upright_sprite",
		textures = {"mini_player.png", "mini_player_back.png" },
		visual_size = { x = 0.875, y = 1.875 },
		collisionbox = { -0.4375, 0, -0.4375, 0.4375, 1.875, 0.4375 },
		eye_height = 1.75,
	})
	player:set_fov(65, false)
	player:hud_set_hotbar_image("mini_hotbar.png")
	player:hud_set_hotbar_selected_image("mini_hotbar_selected.png")

	--physics
	player:set_physics_override({
		sneak_glitch = true
	})

	--visual
	player:set_sky({
		type = "regular",
		body_orbit_tilt = 20,
		sky_color = {
			day_sky = "#67b6bd",
			day_horizon = "#67b6bd",
			
			dawn_sky = "#7869c4",
			dawn_horizon = "#7869c4",
			
			night_sky = "#40318d",
			night_horizon = "#40318d",
			
			indoors = "#787878",
		},
		fog = {
			fog_start = 0.2
		}
	})
	player:set_sun({
		texture = "mini_sun.png",
		sunrise_visible = false,
	})
	player:set_moon({
		texture = "mini_moon.png",
	})
	player:set_stars({
		count = "5000",
		star_color = "#67b6bd",
		scale = "0.1",
	})
	player:set_clouds({
		density = 0.3,
		color = "#ffffffff",
		shadow = "#9f9f9f",
		height = 250,
		thickness = 48,
		speed = {x=5,z=3},
		density = 0.5
	})
	player:set_lighting({
		saturation = 1,
		shadows = {
			intensity = 1,
			tint = "#787878"
		},
		exposure = {
			luminance_min = -4,
			luminance_max = -2,
			exposure_correlation = 0,
			speed_dark_bright = 200,
			speed_bright_dark = 100,
			center_weight_power = 3
		},
		bloom = {
			intensity = 0.05,
			strength_factor = 2,
			radius = 1
		},
		volumetric_light = {
			strength = 0.25
		}
	})
end)

--Infinite materials in creative
core.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
	if placer and placer:is_player() then
		return core.is_creative_enabled(placer:get_player_name())
	end
end
)

core.register_on_newplayer(function(player)
	local inv = player:get_inventory()
	if not inv:contains_item("main", "mini_tools:stone_axe_wood_stick") then
		inv:add_item("main", "mini_tools:stone_axe_wood_stick")
	end
end)

--Drop items on death
core.register_on_dieplayer(function(entity, reason)
	if entity:is_player() then
		local inv = entity:get_inventory()
		local player_name = entity:get_player_name()
		for _, list_name in ipairs(inv:get_list("main")) do
			local pos = entity:get_pos()
			pos.x = pos.x + math.random(-2,2)
			pos.z = pos.z + math.random(-2,2)
			pos.y = pos.y + math.random(0,2)
			core.item_drop(list_name, entity, pos)
		end
		inv:set_list("main", {})
		core.chat_send_player(player_name, "You died.")
	end
end)

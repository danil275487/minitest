dofile(core.get_modpath("mini_furnaces") .. "/furnace.lua")
dofile(core.get_modpath("mini_furnaces") .. "/deepstone_furnace.lua")

function mini_core.get_furnace_active_formspec(fuel_percent, item_percent)
	return mini_core.formspec_wrapper([[
		size[8.25,8.75]
		real_coordinates[true]
		background9[0,0;0,0;mini_formspec_bg.png;true;12]
		bgcolor[#00000080;true]
		listcolors[#787878ff;#505050ff]
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

function mini_core.get_furnace_inactive_formspec()
	return [[
		size[8.25,8.75]
		real_coordinates[true]
		background9[0,0;0,0;mini_formspec_bg.png;true;12]
		bgcolor[#00000080;true]
		listcolors[#787878ff;#505050ff]
		list[context;src;2.35,0.5;1,1;]
		list[context;fuel;2.35,3;1,1;]
		image[2.35,1.75;1,1;mini_furnace_ui_fire_bg.png]
		image[3.60,1.75;1,1;mini_inv_arrow.png^[transformR270]
		list[context;dst;4.85,1.75;1,1;]
		list[current_player;main;0.5,4.5;6,2;6]
		list[current_player;main;0.5,7.25;6,1;0]
	]]
end

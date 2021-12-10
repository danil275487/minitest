stamina = {}
STAMINA_TICK = 800	
STAMINA_TICK_MIN = 4
STAMINA_HEALTH_TICK = 4
STAMINA_MOVE_TICK = 0.5
STAMINA_EXHAUST_DIG = 3
STAMINA_EXHAUST_PLACE = 1
STAMINA_EXHAUST_MOVE = 1.5
STAMINA_EXHAUST_JUMP = 5
STAMINA_EXHAUST_CRAFT = 20
STAMINA_EXHAUST_PUNCH = 40
STAMINA_EXHAUST_LVL = 160
STAMINA_HEAL = 1
STAMINA_HEAL_LVL = 5
STAMINA_STARVE = 1
STAMINA_STARVE_LVL = 3
STAMINA_VISUAL_MAX = 20
SPRINT_SPEED = 0.8	
SPRINT_JUMP = 0.1
SPRINT_DRAIN = 0.35
local function get_int_attribute(player, key)
	local level = player:get_attribute(key)
	if level then
		return tonumber(level)
	else
		return nil
	end
end
local function stamina_update_level(player, level)
	local old = get_int_attribute(player, "stamina:level")
	if level == old then
		return
	end
	player:set_attribute("stamina:level", level)

	player:hud_change(player:get_attribute("stamina:hud_id"), "number", math.min(STAMINA_VISUAL_MAX, level))
end
local function stamina_get_exhaustion(player)
	return get_int_attribute(player, "stamina:exhaustion")
end

stamina.change = function(player, change)
	local name = player:get_player_name()
	if not name or not change or change == 0 then
		return false
	end
	local level = get_int_attribute(player, "stamina:level") + change
	if level < 0 then level = 0 end
	if level > STAMINA_VISUAL_MAX then level = STAMINA_VISUAL_MAX end
	stamina_update_level(player, level)
	return true
end
local function exhaust_player(player, v)
	if not player or not player.is_player or not player:is_player() or not player.set_attribute then
		return
	end
	local name = player:get_player_name()
	if not name then
		return
	end
	local exhaustion = stamina_get_exhaustion(player) or 0
	exhaustion = exhaustion + v
	if exhaustion > STAMINA_EXHAUST_LVL then
		exhaustion = 0
		local h = get_int_attribute(player, "stamina:level")
		if h > 0 then
			stamina_update_level(player, h - 1)
		end
	end
	player:set_attribute("stamina:exhaustion", exhaustion)
end
local stamina_timer = 0
local health_timer = 0
local action_timer = 0
local function stamina_globaltimer(dtime)
	stamina_timer = stamina_timer + dtime
	health_timer = health_timer + dtime
	action_timer = action_timer + dtime
	if action_timer > STAMINA_MOVE_TICK then
		for _,player in ipairs(minetest.get_connected_players()) do
			local controls = player:get_player_control()
			if controls.jump then
				exhaust_player(player, STAMINA_EXHAUST_JUMP)
			elseif controls.up or controls.down or controls.left or controls.right then
				exhaust_player(player, STAMINA_EXHAUST_MOVE)
			end
		end
		action_timer = 0
	end
	if stamina_timer > STAMINA_TICK then
		for _,player in ipairs(minetest.get_connected_players()) do
			local h = get_int_attribute(player, "stamina:level")
			if h > STAMINA_TICK_MIN then
				stamina_update_level(player, h - 1)
			end
		end
		stamina_timer = 0
	end
	if health_timer > STAMINA_HEALTH_TICK then
		for _,player in ipairs(minetest.get_connected_players()) do
			local air = player:get_breath() or 0
			local hp = player:get_hp()
			local h = get_int_attribute(player, "stamina:level")
			if h >= STAMINA_HEAL_LVL and h >= hp and hp > 0 and air > 0 then
				player:set_hp(hp + STAMINA_HEAL)
				stamina_update_level(player, h - 1)
			end
			if get_int_attribute(player, "stamina:level") < STAMINA_STARVE_LVL then
				player:set_hp(hp - STAMINA_STARVE)
			end
		end
		health_timer = 0
	end
end
core.do_item_eat = function(hp_change, replace_with_item, itemstack, user, pointed_thing)
	local old_itemstack = itemstack
	itemstack = stamina.eat(hp_change, replace_with_item, itemstack, user, pointed_thing)
	for _, callback in pairs(core.registered_on_item_eats) do
		local result = callback(hp_change, replace_with_item, itemstack, user, pointed_thing, old_itemstack)
		if result then
			return result
		end
	end
	return itemstack
end
function stamina.eat(hp_change, replace_with_item, itemstack, user, pointed_thing)
	if not itemstack then
		return itemstack
	end
	if not user then
		return itemstack
	end
	local level = get_int_attribute(user, "stamina:level") or 0
	if level >= STAMINA_VISUAL_MAX then
		return itemstack
	end
	if hp_change > 0 then
		level = level + hp_change
		stamina_update_level(user, level)
	end
	minetest.sound_play("stamina_eat", {to_player = user:get_player_name(), gain = 0.7})
	local pos = user:getpos()
	pos.y = pos.y + 1.5
	local itemname = itemstack:get_name()
	local texture  = minetest.registered_items[itemname].inventory_image
	local dir = user:get_look_dir()
	minetest.add_particlespawner({
		amount = 5,
		time = 0.1,
		minpos = pos,
		maxpos = pos,
		minvel = {x = dir.x - 1, y = dir.y, z = dir.z - 1},
		maxvel = {x = dir.x + 1, y = dir.y, z = dir.z + 1},
		minacc = {x = 0, y = -5, z = 0},
		maxacc = {x = 0, y = -9, z = 0},
		minexptime = 1,
		maxexptime = 1,
		minsize = 1,
		maxsize = 2,
		texture = texture,
	})
	itemstack:take_item()
	if replace_with_item then
		if itemstack:is_empty() then
			itemstack:add_item(replace_with_item)
		else
			local inv = user:get_inventory()
			if inv:room_for_item("main", {name=replace_with_item}) then
				inv:add_item("main", replace_with_item)
			else
				pos.y = math.floor(pos.y - 1.0)
				core.add_item(pos, replace_with_item)
			end
		end
	end
	return itemstack
end

if minetest.setting_getbool("enable_damage") and minetest.is_yes(minetest.setting_get("enable_stamina") or "1") then
	minetest.register_on_joinplayer(function(player)
		local level = STAMINA_VISUAL_MAX
		if get_int_attribute(player, "stamina:level") then
			level = math.min(get_int_attribute(player, "stamina:level"), STAMINA_VISUAL_MAX)
		else
			player:set_attribute("stamina:level", level)
		end
		local id = player:hud_add({
			name = "stamina",
			hud_elem_type = "statbar",
			position = {x = 0.5, y = 1},
			size = {x = 24, y = 24},
			text = "stamina_hud_fg.png",
			text2 = "stamina_hud_bg.png",
			number = level,
			item = STAMINA_VISUAL_MAX,
			alignment = {x = -1, y = -1},
			offset = {x = (-10 * 24) - 25, y = -(48 + 48 + 16)},
			max = 0,
		})
		player:set_attribute("stamina:hud_id", id)
	end)
	minetest.register_globalstep(stamina_globaltimer)
	minetest.register_on_placenode(function(pos, oldnode, player, ext)
		exhaust_player(player, STAMINA_EXHAUST_PLACE)
	end)
	minetest.register_on_dignode(function(pos, oldnode, player, ext)
		exhaust_player(player, STAMINA_EXHAUST_DIG)
	end)
	minetest.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
		exhaust_player(player, STAMINA_EXHAUST_CRAFT)
	end)
	minetest.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
		exhaust_player(hitter, STAMINA_EXHAUST_PUNCH)
	end)
	minetest.register_on_respawnplayer(function(player)
		stamina_update_level(player, STAMINA_VISUAL_MAX)
	end)
end
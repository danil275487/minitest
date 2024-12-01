mt_hunger = {}
MT_HUNGER_TICK = 800	
MT_HUNGER_TICK_MIN = 4
MT_HUNGER_HEALTH_TICK = 4
MT_HUNGER_MOVE_TICK = 0.5
MT_HUNGER_EXHAUST_DIG = 3
MT_HUNGER_EXHAUST_PLACE = 1
MT_HUNGER_EXHAUST_MOVE = 1.5
MT_HUNGER_EXHAUST_JUMP = 5
MT_HUNGER_EXHAUST_CRAFT = 20
MT_HUNGER_EXHAUST_PUNCH = 40
MT_HUNGER_EXHAUST_LVL = 160
MT_HUNGER_HEAL = 1
MT_HUNGER_HEAL_LVL = 5
MT_HUNGER_STARVE = 1
MT_HUNGER_STARVE_LVL = 3
MT_HUNGER_VISUAL_MAX = 20
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
local function mt_hunger_update_level(player, level)
	local old = get_int_attribute(player, "mt_hunger:level")
	if level == old then
		return
	end
	player:set_attribute("mt_hunger:level", level)

	player:hud_change(player:get_attribute("mt_hunger:hud_id"), "number", math.min(MT_HUNGER_VISUAL_MAX, level))
end
local function mt_hunger_get_exhaustion(player)
	return get_int_attribute(player, "mt_hunger:exhaustion")
end

mt_hunger.change = function(player, change)
	local name = player:get_player_name()
	if not name or not change or change == 0 then
		return false
	end
	local level = get_int_attribute(player, "mt_hunger:level") + change
	if level < 0 then level = 0 end
	if level > MT_HUNGER_VISUAL_MAX then level = MT_HUNGER_VISUAL_MAX end
	mt_hunger_update_level(player, level)
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
	local exhaustion = mt_hunger_get_exhaustion(player) or 0
	exhaustion = exhaustion + v
	if exhaustion > MT_HUNGER_EXHAUST_LVL then
		exhaustion = 0
		local h = get_int_attribute(player, "mt_hunger:level")
		if h > 0 then
			mt_hunger_update_level(player, h - 1)
		end
	end
	player:set_attribute("mt_hunger:exhaustion", exhaustion)
end
local mt_hunger_timer = 0
local health_timer = 0
local action_timer = 0
local function mt_hunger_globaltimer(dtime)
	mt_hunger_timer = mt_hunger_timer + dtime
	health_timer = health_timer + dtime
	action_timer = action_timer + dtime
	if action_timer > MT_HUNGER_MOVE_TICK then
		for _,player in ipairs(core.get_connected_players()) do
			local controls = player:get_player_control()
			if controls.jump then
				exhaust_player(player, MT_HUNGER_EXHAUST_JUMP)
			elseif controls.up or controls.down or controls.left or controls.right then
				exhaust_player(player, MT_HUNGER_EXHAUST_MOVE)
			end
		end
		action_timer = 0
	end
	if mt_hunger_timer > MT_HUNGER_TICK then
		for _,player in ipairs(core.get_connected_players()) do
			local h = get_int_attribute(player, "mt_hunger:level")
			if h > MT_HUNGER_TICK_MIN then
				mt_hunger_update_level(player, h - 1)
			end
		end
		mt_hunger_timer = 0
	end
	if health_timer > MT_HUNGER_HEALTH_TICK then
		for _,player in ipairs(core.get_connected_players()) do
			local air = player:get_breath() or 0
			local hp = player:get_hp()
			local h = get_int_attribute(player, "mt_hunger:level")
			if h >= MT_HUNGER_HEAL_LVL and h >= hp and hp > 0 and air > 0 then
				player:set_hp(hp + MT_HUNGER_HEAL)
				mt_hunger_update_level(player, h - 1)
			end
			if get_int_attribute(player, "mt_hunger:level") < MT_HUNGER_STARVE_LVL then
				player:set_hp(hp - MT_HUNGER_STARVE)
			end
		end
		health_timer = 0
	end
end
core.do_item_eat = function(hp_change, replace_with_item, itemstack, user, pointed_thing)
	local old_itemstack = itemstack
	itemstack = mt_hunger.eat(hp_change, replace_with_item, itemstack, user, pointed_thing)
	for _, callback in pairs(core.registered_on_item_eats) do
		local result = callback(hp_change, replace_with_item, itemstack, user, pointed_thing, old_itemstack)
		if result then
			return result
		end
	end
	return itemstack
end
function mt_hunger.eat(hp_change, replace_with_item, itemstack, user, pointed_thing)
	if not itemstack then
		return itemstack
	end
	if not user then
		return itemstack
	end
	local level = get_int_attribute(user, "mt_hunger:level") or 0
	if level >= MT_HUNGER_VISUAL_MAX then
		return itemstack
	end
	if hp_change > 0 then
		level = level + hp_change
		mt_hunger_update_level(user, level)
	end
	local pos = user:getpos()
	pos.y = pos.y + 1.5
	local itemname = itemstack:get_name()
	local texture  = core.registered_items[itemname].inventory_image
	local dir = user:get_look_dir()
	core.add_particlespawner({
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

if core.setting_getbool("enable_damage") and core.is_yes(core.setting_get("enable_mt_hunger") or "1") then
	core.register_on_joinplayer(function(player)
		local level = MT_HUNGER_VISUAL_MAX
		if get_int_attribute(player, "mt_hunger:level") then
			level = math.min(get_int_attribute(player, "mt_hunger:level"), MT_HUNGER_VISUAL_MAX)
		else
			player:set_attribute("mt_hunger:level", level)
		end
		local id = player:hud_add({
			name = "mt_hunger",
			hud_elem_type = "statbar",
			position = {x = 0.5, y = 1},
			size = {x = 24, y = 24},
			text = "mt_hunger_hud_fg.png",
			text2 = "mt_hunger_hud_bg.png",
			number = level,
			item = MT_HUNGER_VISUAL_MAX,
			alignment = {x = -1, y = -1},
			offset = {x = (-10 * 24) - 25, y = -(48 + 48 + 16)},
			max = 0,
		})
		player:set_attribute("mt_hunger:hud_id", id)
	end)
	core.register_globalstep(mt_hunger_globaltimer)
	core.register_on_placenode(function(pos, oldnode, player, ext)
		exhaust_player(player, MT_HUNGER_EXHAUST_PLACE)
	end)
	core.register_on_dignode(function(pos, oldnode, player, ext)
		exhaust_player(player, MT_HUNGER_EXHAUST_DIG)
	end)
	core.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
		exhaust_player(player, MT_HUNGER_EXHAUST_CRAFT)
	end)
	core.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
		exhaust_player(hitter, MT_HUNGER_EXHAUST_PUNCH)
	end)
	core.register_on_respawnplayer(function(player)
		mt_hunger_update_level(player, MT_HUNGER_VISUAL_MAX)
	end)
end
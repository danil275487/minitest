mini_core.sounds = {}

mini_core.sounds.dig_hard = {
	-- Definition of node sounds to be played at various events.
	-- All fields in this table are optional.

	footstep = {name = "mini_dig_hard", gain = 0.1},
	-- If walkable, played when object walks on it. If node is
	-- climbable or a liquid, played when object moves through it.
	-- Sound is played at the base of the object's collision-box.
	-- Gain is multiplied by `0.6`.
	-- For local player, it's played position-less, with normal gain.

	dig = {name = "mini_dig_hard"},
	-- While digging node.
	-- If `"__group"`, then the sound will be
	-- `{name = "default_dig_<groupname>", gain = 0.5}` , where `<groupname>` is the
	-- name of the item's digging group with the fastest digging time.
	-- In case of a tie, one of the sounds will be played (but we
	-- cannot predict which one)
	-- Default value: `"__group"`

	dug = {name = "mini_dig_hard", gain = 0.5},
	-- Node was dug

	place = {name = "mini_dig_hard", gain = 0.2},
	-- Node was placed. Also played after falling

	fall = {name = "mini_dig_hard", gain = 0.1},
	-- When node starts to fall or is detached
}

mini_core.sounds.dig_soft = {
	-- Definition of node sounds to be played at various events.
	-- All fields in this table are optional.

	footstep = {name = "mini_dig_soft", gain = 0.1},
	-- If walkable, played when object walks on it. If node is
	-- climbable or a liquid, played when object moves through it.
	-- Sound is played at the base of the object's collision-box.
	-- Gain is multiplied by `0.6`.
	-- For local player, it's played position-less, with normal gain.

	dig = {name = "mini_dig_soft"},
	-- While digging node.
	-- If `"__group"`, then the sound will be
	-- `{name = "default_dig_<groupname>", gain = 0.5}` , where `<groupname>` is the
	-- name of the item's digging group with the fastest digging time.
	-- In case of a tie, one of the sounds will be played (but we
	-- cannot predict which one)
	-- Default value: `"__group"`

	dug = {name = "mini_dig_soft", gain = 0.5},
	-- Node was dug

	place = {name = "mini_dig_soft", gain = 0.2},
	-- Node was placed. Also played after falling

	fall = {name = "mini_dig_soft", gain = 0.1},
	-- When node starts to fall or is detached
}

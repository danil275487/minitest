function register_stair_and_slab(subname, recipeitem, groups, tiles, description, texture_alpha)
	minetest.register_node("mini_stairs:"..subname.."_stair", {
		description = description.." Stairs",
		drawtype = "nodebox",
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.0, 0.5},
				{-0.5, 0.0, 0.0, 0.5, 0.5, 0.5},
			},
		},
	})
	if recipeitem then
		minetest.register_craft({
			output = "mini_stairs:"..subname.."_stair",
			recipe = {
				{"", "", recipeitem},
				{"", recipeitem, recipeitem},
				{recipeitem, recipeitem, recipeitem},
			},
		})
		minetest.register_craft({
			output = "mini_stairs:"..subname.."_stair",
			recipe = {
				{recipeitem,"",""},
				{recipeitem, recipeitem,""},
				{recipeitem, recipeitem, recipeitem},
			},
		})
	end
	minetest.register_node("mini_stairs:"..subname.."_slab", {
		description = description.." Slab",
		drawtype = "nodebox",
		tiles = tiles,
		paramtype = "light",
		groups = groups,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.0, 0.5},
			},
		},
		use_texture_alpha = texture_alpha
	})

	if recipeitem then
		minetest.register_craft({
			output = "mini_stairs:"..subname.."_slab",
			recipe = {
				{recipeitem, recipeitem, recipeitem},
			},
		})
	end
end

register_stair_and_slab(
	"stone",
	"mini_nodes:stone",
	{ cracky = 3 },
	{ "mt_atlas.png^[sheet:8x8:0,1" },
	"Stone"
)

register_stair_and_slab(
	"deep_stone",
	"mini_nodes:deep_stone",
	{ cracky = 2, level = 1 },
	{ "mt_atlas.png^[sheet:8x8:0,5" },
	"Deep Stone"
)

register_stair_and_slab(
	"stone_brick",
	"mini_nodes:stone_bricks",
	{ cracky = 3 },
	{ "mt_atlas.png^[sheet:8x8:7,1" },
	"Stone Brick"
)

register_stair_and_slab(
	"deep_stone_brick",
	"mini_nodes:deep_stone_bricks",
	{ cracky = 2, level = 1 },
	{ "mt_atlas.png^[sheet:8x8:1,5" },
	"Deep Stone Brick"
)

register_stair_and_slab(
	"oak_plank",
	"mini_nodes:oak_planks",
	{ choppy = 3 },
	{ "mt_atlas.png^[sheet:8x8:6,1" },
	"Oak Plank"
)

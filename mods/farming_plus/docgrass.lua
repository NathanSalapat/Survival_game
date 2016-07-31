
-- to deal with leftover docfarming grass
 
minetest.register_node("farming_plus:docgrass", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_docgrass.png"},
	drop = {
		max_items = 1,
		items = {
			{ items = {'farming_plus:peach_seed'}, rarity = 10},
			{ items = {'farming_plus:melon_seed'}, rarity = 10},
			{ items = {'farming_plus:raspberry_seed'}, rarity = 10},
			{ items = {'farming_plus:walnut_seed'}, rarity = 10},
			{ items = {'farming_plus:lemon_seed'}, rarity = 10},
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_alias("docfarming:grass", "farming_plus:docgrass")

-- original farming_plus carrot by PilzAdam
-- 3 more growth stages added by MTDad

-- main `S` code in init.lua
local S
S = farming.S

minetest.register_craftitem("farming_plus:carrot_seed", {
	description = S("Carrot Seeds"),
	inventory_image = "farming_carrot_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming_plus:carrot_1")
	end
})

minetest.register_node("farming_plus:carrot_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_carrot_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+3/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:carrot_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_carrot_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+5/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:carrot_3", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_carrot_3.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+9/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:carrot_4", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_carrot_4.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+11/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:carrot_5", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_carrot_5.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+12/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:carrot_6", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_carrot_6.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+13/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:carrot", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_carrot_7.png"},
	drop = {
		max_items = 6,
		items = {
			{ items = {'farming_plus:carrot_seed'} },
			{ items = {'farming_plus:carrot_seed'}, rarity = 2},
			{ items = {'farming_plus:carrot_seed'}, rarity = 5},
			{ items = {'farming_plus:carrot_item'} },
			{ items = {'farming_plus:carrot_item'}, rarity = 2 },
			{ items = {'farming_plus:carrot_item'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("farming_plus:carrot_item", {
	description = S("Carrot"),
	inventory_image = "farming_carrot.png",
	groups = {food_carrot = 1},
	on_use = minetest.item_eat(3),
})

farming.add_plant("farming_plus:carrot", {"farming_plus:carrot_1", "farming_plus:carrot_2", "farming_plus:carrot_3", "farming_plus:carrot_4", "farming_plus:carrot_5", "farming_plus:carrot_6"}, 250, 2)

minetest.register_alias("docfarming:carrotseed", "farming_plus:carrot_seed")
minetest.register_alias("docfarming:carrot", "farming_plus:carrot_item")
minetest.register_alias("farming:carrot", "farming_plus:carrot_item")
minetest.register_alias("docfarming:carrot1", "farming_plus:carrot_1")
minetest.register_alias("farming:carrot_1", "farming_plus:carrot_1")
minetest.register_alias("docfarming:carrot2", "farming_plus:carrot_2")
minetest.register_alias("farming:carrot_2", "farming_plus:carrot_2")
minetest.register_alias("docfarming:carrot3", "farming_plus:carrot_3")
minetest.register_alias("farming:carrot_3", "farming_plus:carrot_3")
minetest.register_alias("docfarming:carrot4", "farming_plus:carrot_4")
minetest.register_alias("farming:carrot_4", "farming_plus:carrot_4")
minetest.register_alias("farming:carrot_5", "farming_plus:carrot_5")
minetest.register_alias("farming:carrot_6", "farming_plus:carrot_6")
minetest.register_alias("farming:carrot_7", "farming_plus:carrot")
minetest.register_alias("farming:carrot_8", "farming_plus:carrot")

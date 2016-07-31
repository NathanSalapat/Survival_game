-- coffee
-- imported into farming_plus from farming redo by MTDad

minetest.register_craftitem("farming_plus:coffee_beans", {
	description = "Coffee Beans",
	inventory_image = "farming_coffee_beans.png",
	groups = {food_coffee = 1},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming_plus:coffee_1")
	end,
})

minetest.register_node("farming_plus:coffee_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_coffee_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+5/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, attached_node=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:coffee_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_coffee_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+7/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, attached_node=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:coffee_3", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_coffee_3.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+9/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, attached_node=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:coffee_4", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_coffee_4.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+11/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, attached_node=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:coffee", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_coffee_5.png"},
	drop = {
		items = {
			{items = {"farming_plus:coffee_beans 2"}, rarity=1},
			{items = {"farming_plus:coffee_beans 2"}, rarity=2},
			{items = {"farming_plus:coffee_beans 2"}, rarity=3},
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, attached_node=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

farming.add_plant("farming_plus:coffee", {"farming_plus:coffee_1", "farming_plus:coffee_2", "farming_plus:coffee_3", "farming_plus:coffee_4"}, 250, 4)

minetest.register_alias("farming:coffee_beans", "farming_plus:coffee_beans")
minetest.register_alias("farming:coffee_1", "farming_plus:coffee_1")
minetest.register_alias("farming:coffee_2", "farming_plus:coffee_2")
minetest.register_alias("farming:coffee_3", "farming_plus:coffee_3")
minetest.register_alias("farming:coffee_4", "farming_plus:coffee_4")
minetest.register_alias("farming:coffee_5", "farming_plus:coffee")

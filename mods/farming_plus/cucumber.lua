-- Docfarming Cucumber imported into Farming_Plus by MTDad

-- main `S` code in init.lua
local S
S = farming.S

minetest.register_craftitem("farming_plus:cucumber_seed", {
	description = S("Cucumber Seeds"),
	inventory_image = "farming_cucumber_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming_plus:cucumber_1")
	end
})

minetest.register_node("farming_plus:cucumber_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_cucumber_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+3/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:cucumber_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_cucumber_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+5/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:cucumber_3", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_cucumber_3.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+7/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:cucumber_4", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_cucumber_4.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+9/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:cucumber_5", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_cucumber_5.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+11/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:cucumber_6", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_cucumber_6.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+13/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:cucumber", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_cucumber_7.png"},
	drop = {
		max_items = 3, --reduced from 6>3
		items = {
--			{ items = {'farming_plus:cucumber_seed'} },
--			{ items = {'farming_plus:cucumber_seed'}, rarity = 2},
--			{ items = {'farming_plus:cucumber_seed'}, rarity = 5},
			{ items = {'farming_plus:cucumber_item'} },
			{ items = {'farming_plus:cucumber_item'}, rarity = 2 },
			{ items = {'farming_plus:cucumber_item'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("farming_plus:cucumber_item", {
	description = S("Cucumber"),
	inventory_image = "farming_cucumber.png",
	groups = {food_cucumber = 1},
	on_use = minetest.item_eat(3),
})

-- Craft added for seed acquisition
minetest.register_craft({
	output = "farming_plus:cucumber_seed 4",
	recipe = {
		{"farming_plus:cucumber_item"},
	}
})

farming.add_plant("farming_plus:cucumber", {"farming_plus:cucumber_1", "farming_plus:cucumber_2", "farming_plus:cucumber_3", "farming_plus:cucumber_4", "farming_plus:cucumber_5", "farming_plus:cucumber_6"}, 250, 2)

minetest.register_alias("docfarming:cucumberseed", "farming_plus:cucumber_seed")
minetest.register_alias("docfarming:cucumber", "farming_plus:cucumber_item")
minetest.register_alias("farming:cucumber", "farming_plus:cucumber_item")
minetest.register_alias("docfarming:cucumber1", "farming_plus:cucumber_1")
minetest.register_alias("farming:cucumber_1", "farming_plus:cucumber_1")
minetest.register_alias("docfarming:cucumber2", "farming_plus:cucumber_2")
minetest.register_alias("farming:cucumber_2", "farming_plus:cucumber_2")
minetest.register_alias("docfarming:cucumber3", "farming_plus:cucumber_5")
minetest.register_alias("farming:cucumber_3", "farming_plus:cucumber_5")
minetest.register_alias("docfarming:cucumber4", "farming_plus:cucumber")
minetest.register_alias("farming:cucumber_4", "farming_plus:cucumber")


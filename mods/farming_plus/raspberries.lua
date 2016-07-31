-- Raspberries
-- Original code for the Farming_Plus Mod by PilzAdam, modified by MTDad
-- Plant spreading behavior inspired by DocFarming raspberry, by Doc
-- Textures by MTDad

-- main `S` code in init.lua
local S
S = farming.S

minetest.register_craftitem("farming_plus:raspberry_seed", {
	description = S("Raspberry Starter"),
	inventory_image = "farming_raspberry_start.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming_plus:raspberry_1")
	end
})

minetest.register_node("farming_plus:raspberry_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "farming_plus:raspberry_seed",
	tiles = {"farming_raspberry_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+4/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:raspberry_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "farming_plus:raspberry_seed",
	tiles = {"farming_raspberry_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+6/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:raspberry_3", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "farming_plus:raspberry_seed",
	tiles = {"farming_raspberry_3.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+8/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_node("farming_plus:raspberry_4", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = {
		max_items = 4,
		items = {
			{ items = {"farming_plus:raspberry_seed"} },
			{ items = {"farming_plus:raspberry_seed"}, rarity = 2},
			{ items = {"farming_plus:raspberry_seed"}, rarity = 5},
			{ items = {"farming_plus:raspberry_seed"}, rarity = 10},
		}
	},
	tiles = {"farming_raspberry_4.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+10/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1, spreading=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:raspberry_5", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_raspberry_5.png"},
	after_dig_node = function(pos)
		minetest.env:add_node(pos, {name="farming_plus:raspberry_4"})
	end,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+12/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:raspberry_6", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",

	drop = "",
	tiles = {"farming_raspberry_6.png"},
	after_dig_node = function(pos)
		minetest.env:add_node(pos, {name="farming_plus:raspberry_4"})
	end,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+14/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:raspberry", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_raspberry_7.png"},
	after_dig_node = function(pos)
		minetest.env:add_node(pos, {name="farming_plus:raspberry_4"})
	end,
	drop = {
		max_items = 3, -- reduced from 6>3
		items = {
--			{ items = {'farming_plus:raspberry_start'} },
--			{ items = {'farming_plus:raspberry_start'}, rarity = 2},
--			{ items = {'farming_plus:raspberry_start'}, rarity = 5},
			{ items = {'farming_plus:raspberry_item'} },
			{ items = {'farming_plus:raspberry_item'}, rarity = 2 },
			{ items = {'farming_plus:raspberry_item'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("farming_plus:raspberry_item", {
	description = S("Raspberry"),
	inventory_image = "farming_raspberry.png",
	groups = {food_raspberry = 1, raspberry = 1},
	on_use = minetest.item_eat(2),
})

farming.add_plant("farming_plus:raspberry", {"farming_plus:raspberry_1", "farming_plus:raspberry_2", "farming_plus:raspberry_3", "farming_plus:raspberry_4", "farming_plus:raspberry_5", "farming_plus:raspberry_6"}, 250, 2, 1)

minetest.register_alias("docfarming:raspberryseed", "farming_plus:raspberry_seed")
minetest.register_alias("docfarming:raspberry", "farming_plus:raspberry_item")
minetest.register_alias("farming:raspberries", "farming_plus:raspberry_item")
minetest.register_alias("docfarming:raspberry1", "farming_plus:raspberry_1")
minetest.register_alias("farming:raspberry_1", "farming_plus:raspberry_1")
minetest.register_alias("docfarming:raspberry2", "farming_plus:raspberry_2")
minetest.register_alias("farming:raspberry_2", "farming_plus:raspberry_2")
minetest.register_alias("docfarming:raspberry3", "farming_plus:raspberry_3")
minetest.register_alias("farming:raspberry_3", "farming_plus:raspberry_3")
minetest.register_alias("docfarming:raspberry4", "farming_plus:raspberry_4")
minetest.register_alias("farming:raspberry_4", "farming_plus:raspberry_4")


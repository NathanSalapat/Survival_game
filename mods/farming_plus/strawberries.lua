-- Original strawberries.lua for the Farming_Plus Mod by PilzAdam
-- Modified and retextured by MTDad
-- Spreading behavior inspired by the Docfarming Raspberry

-- main `S` code in init.lua
local S
S = farming.S

minetest.register_craftitem("farming_plus:strawberry_seed", {
	description = S("Strawberry Starter"),
	inventory_image = "farming_strawberry_start.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming_plus:strawberry_1")
	end
})

minetest.register_node("farming_plus:strawberry_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "farming_plus:strawberry_seed",
	tiles = {"farming_strawberry_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+4/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:strawberry_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "farming_plus:strawberry_seed",
	tiles = {"farming_strawberry_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+6/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:strawberry_3", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "farming_plus:strawberry_seed",
	tiles = {"farming_strawberry_3.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+8/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_node("farming_plus:strawberry_4", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = {
		max_items = 4,
		items = {
			{ items = {"farming_plus:strawberry_seed"} },
			{ items = {"farming_plus:strawberry_seed"}, rarity = 2},
			{ items = {"farming_plus:strawberry_seed"}, rarity = 5},
			{ items = {"farming_plus:strawberry_seed"}, rarity = 10},
		}
	},
	tiles = {"farming_strawberry_4.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+10/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1, spreading=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:strawberry_5", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_strawberry_5.png"},
	after_dig_node = function(pos)
		minetest.env:add_node(pos, {name="farming_plus:strawberry_4"})
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

minetest.register_node("farming_plus:strawberry_6", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",

	drop = "",
	tiles = {"farming_strawberry_6.png"},
	after_dig_node = function(pos)
		minetest.env:add_node(pos, {name="farming_plus:strawberry_4"})
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

minetest.register_node("farming_plus:strawberry", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_strawberry_7.png"},
	after_dig_node = function(pos)
		minetest.env:add_node(pos, {name="farming_plus:strawberry_4"})
	end,
	drop = {
		max_items = 3, -- reduced from 6>3
		items = {
--			{ items = {'farming_plus:strawberry_seed'} },
--			{ items = {'farming_plus:strawberry_seed'}, rarity = 2},
--			{ items = {'farming_plus:strawberry_seed'}, rarity = 5},
			{ items = {'farming_plus:strawberry_item'} },
			{ items = {'farming_plus:strawberry_item'}, rarity = 2 },
			{ items = {'farming_plus:strawberry_item'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("farming_plus:strawberry_item", {
	description = S("Strawberry"),
	inventory_image = "farming_strawberry.png",
	groups = {food_strawberry = 1},
	on_use = minetest.item_eat(2),
})

farming.add_plant("farming_plus:strawberry", {"farming_plus:strawberry_1", "farming_plus:strawberry_2", "farming_plus:strawberry_3", "farming_plus:strawberry_4", "farming_plus:strawberry_5", "farming_plus:strawberry_6"}, 250, 2, 1)


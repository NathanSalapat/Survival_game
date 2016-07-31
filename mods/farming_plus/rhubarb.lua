-- Original farming_plus rhubarb by PilzAdam,
-- Modified by MTDad to be "everbearing" and "spreading", inspired by the Docfarming raspberry,

-- main `S` code in init.lua
local S
S = farming.S

-- changed from "seed" to "start" -MTD
minetest.register_craftitem("farming_plus:rhubarb_seed", {
	description = S("Rhubarb Starter"),
	inventory_image = "farming_rhubarb_start.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming_plus:rhubarb_1")
	end
})

minetest.register_node("farming_plus:rhubarb_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "farming_plus:rhubarb_seed",
	tiles = {"farming_rhubarb_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+5/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:rhubarb_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "farming_plus:rhubarb_seed",
	tiles = {"farming_rhubarb_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+11/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:rhubarb_3", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_rhubarb_3.png"},
	drop = {
		max_items = 3,
		items = {
			{ items = {"farming_plus:rhubarb_seed"} },
			{ items = {"farming_plus:rhubarb_seed"}, rarity = 2 },
			{ items = {"farming_plus:rhubarb_seed"}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:rhubarb_4", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_rhubarb_4.png"},
	drop = {
		max_items = 3,
		items = {
			{ items = {"farming_plus:rhubarb_seed"} },
			{ items = {"farming_plus:rhubarb_seed"}, rarity = 2 },
			{ items = {"farming_plus:rhubarb_seed"}, rarity = 3 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1, spreading=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:rhubarb_5", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_rhubarb_5.png"},
	drop = {
		max_items = 4,
		items = {
			{ items = {"farming_plus:rhubarb_seed 2"} },
			{ items = {"farming_plus:rhubarb_seed"}, rarity = 2 },
			{ items = {"farming_plus:rhubarb_seed"}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:rhubarb_6", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_rhubarb_6.png"},
	drop = {
		max_items = 4,
		items = {
			{ items = {"farming_plus:rhubarb_seed 2"} },
			{ items = {"farming_plus:rhubarb_seed"}, rarity = 2 },
			{ items = {"farming_plus:rhubarb_seed"}, rarity = 3 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_node("farming_plus:rhubarb", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_rhubarb_7.png"},
	after_dig_node = function(pos)
		minetest.env:add_node(pos, {name="farming_plus:rhubarb_1"})
	end,
	drop = {
		max_items = 3, -- reduced 6>3
		items = {
--			{ items = {'farming_plus:rhubarb_seed'} },
--			{ items = {'farming_plus:rhubarb_seed'}, rarity = 2},
--			{ items = {'farming_plus:rhubarb_seed'}, rarity = 5},
			{ items = {'farming_plus:rhubarb_item'} },
			{ items = {'farming_plus:rhubarb_item'}, rarity = 2 },
			{ items = {'farming_plus:rhubarb_item'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("farming_plus:rhubarb_item", {
	description = S("Rhubarb"),
	inventory_image = "farming_rhubarb.png",
	groups = {food_rhubarb = 1},
	on_use = minetest.item_eat(2),
})

farming.add_plant("farming_plus:rhubarb", {"farming_plus:rhubarb_1", "farming_plus:rhubarb_2", "farming_plus:rhubarb_3", "farming_plus:rhubarb_4", "farming_plus:rhubarb_5", "farming_plus:rhubarb_6"}, 250, 2, 1)

minetest.register_alias("farming:rhubarb", "farming_plus:rhubarb_item")
minetest.register_alias("farming:rhubarb_1", "farming_plus:rhubarb_1")
minetest.register_alias("farming:rhubarb_2", "farming_plus:rhubarb_2")
minetest.register_alias("farming:rhubarb_3", "farming_plus:rhubarb_3")


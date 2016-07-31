-- original farming_plus code by AdamPilz modified by MTDad.
-- textures by MTDad.

-- main `S` code in init.lua
local S
S = farming.S

minetest.register_craftitem("farming_plus:walnut_item", {
	description = S("Walnut"),
	inventory_image = "farming_walnut.png",
	groups = {food_walnut = 1},
	on_use = minetest.item_eat(4),
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming_plus:walnut_1")
	end
})

-- trunk growth
minetest.register_node("farming_plus:walnut_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_orangetrunk_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+5/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:walnut_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_orangetrunk_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+10/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:walnut_3", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_orangetrunk_3.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+15/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:walnut_4", {
	paramtype = "light",
	walkable = true,
	drawtype = "plantlike",
	tiles = {"farming_orangetrunk_4.png"},
	drop = {
		max_items = 3,
		items = {
			{ items = {'default:wood'} },
			{ items = {'default:wood'}, rarity = 2 },
			{ items = {'default:wood'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:walnut_5", {
	paramtype = "light",
	walkable = true,
	drawtype = "plantlike",
	tiles = {"farming_orangetrunk_4.png"},
	drop = {
		max_items = 3,
		items = {
			{ items = {'default:wood'} },
			{ items = {'default:wood'}, rarity = 2 },
			{ items = {'default:wood'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:walnut", {
	paramtype = "light",
	walkable = true,
	drawtype = "plantlike",
	tiles = {"farming_orangetrunk_4.png"},
	drop = {
		max_items = 3,
		items = {
			{ items = {'default:wood'} },
			{ items = {'default:wood'}, rarity = 2 },
			{ items = {'default:wood'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

-- second tier growth section
minetest.register_node("farming_plus:walnut_4b", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_walnut_leaves.png"},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:walnut_5b", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_walnut_blossoms.png"},
	after_dig_node = function(pos)
		minetest.set_node(pos, {name = "farming_plus:walnut_4b"})
		pos.y = pos.y-1
		minetest.set_node(pos, {name = "farming_plus:walnut_4"})
	end,
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:walnutb", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_walnut_fruited.png"},
	after_dig_node = function(pos)
		minetest.set_node(pos, {name = "farming_plus:walnut_4b"})
		pos.y = pos.y-1
		minetest.set_node(pos, {name = "farming_plus:walnut_4"})
	end,
	drop = {
		max_items = 4,
		items = {
			{ items = {"farming_plus:walnut_item"} },
			{ items = {"farming_plus:walnut_item"}, rarity = 2},
			{ items = {"farming_plus:walnut_item"}, rarity = 3},
			{ items = {"farming_plus:walnut_item"}, rarity = 4},
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

farming.add_plant("farming_plus:walnut", {"farming_plus:walnut_1", "farming_plus:walnut_2", "farming_plus:walnut_3",
		"farming_plus:walnut_4", "farming_plus:walnut_5"}, 250, 4, 1, 2)

-- aliases for older versions
minetest.register_alias("farming_plus:walnut_leaves", "farming_plus:walnutb")
minetest.register_alias("farming_plus:walnut_blossoms", "farming_plus:walnutb")
minetest.register_alias("farming_plus:walnut_fruited", "farming_plus:walnutb")


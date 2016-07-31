-- original farming_plus code by AdamPilz modified by MTDad.
-- textures by MTDad.

-- main `S` code in init.lua
local S
S = farming.S

minetest.register_craftitem("farming_plus:lemon_seed", {
	description = S("Lemon Seeds"),
	inventory_image = "farming_lemon_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming_plus:lemon_1")
	end
})

minetest.register_craftitem("farming_plus:lemon_item", {
	description = S("Lemon"),
	inventory_image = "farming_lemon.png",
	groups = {food_lemon = 1},
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	output = "farming_plus:lemon_seed",
	recipe = {
		{"farming_plus:lemon_item"},
	}
})

-- trunk growth
minetest.register_node("farming_plus:lemon_1", {
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

minetest.register_node("farming_plus:lemon_2", {
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

minetest.register_node("farming_plus:lemon_3", {
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

minetest.register_node("farming_plus:lemon_4", {
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

minetest.register_node("farming_plus:lemon_5", {
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

minetest.register_node("farming_plus:lemon", {
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

-- second tier growth section,
minetest.register_node("farming_plus:lemon_4b", {
	paramtype = "light",
	walkable = true,
	drawtype = "allfaces_optional",
	drop = "",
	tiles = {"farming_fruittree_1.png"},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:lemon_5b", {
	paramtype = "light",
	walkable = true,
	drawtype = "allfaces_optional",
	drop = "",
	tiles = {"farming_lemon_blossoms.png"},
	after_dig_node = function(pos)
		minetest.set_node(pos, {name = "farming_plus:lemon_4b"})
		pos.y = pos.y-1
		minetest.set_node(pos, {name = "farming_plus:lemon_4"})
	end,
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:lemonb", {
	paramtype = "light",
	walkable = true,
	drawtype = "allfaces_optional",
	tiles = {"farming_lemon_fruited.png"},
	after_dig_node = function(pos)
		minetest.set_node(pos, {name = "farming_plus:lemon_4b"})
		pos.y = pos.y-1
		minetest.set_node(pos, {name = "farming_plus:lemon_4"})
	end,
	drop = {
		max_items = 4,
		items = {
			{ items = {"farming_plus:lemon_item"} },
			{ items = {"farming_plus:lemon_item"}, rarity = 2},
			{ items = {"farming_plus:lemon_item"}, rarity = 3},
			{ items = {"farming_plus:lemon_item"}, rarity = 4},
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

farming.add_plant("farming_plus:lemon", {"farming_plus:lemon_1", "farming_plus:lemon_2", "farming_plus:lemon_3",
		"farming_plus:lemon_4", "farming_plus:lemon_5"}, 250, 4, 1, 2)

-- aliases for older versions
minetest.register_alias("farming_plus:lemon_leaves", "farming_plus:lemonb")
minetest.register_alias("farming_plus:lemon_blossoms", "farming_plus:lemonb")
minetest.register_alias("farming_plus:lemon_fruited", "farming_plus:lemonb")


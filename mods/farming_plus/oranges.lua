-- original Farming_plus oranges.lua by PilzAdam modified by MTDad.
-- converted from plant to dwarf tree, new textures by MTDad.

-- main `S` code in init.lua
local S
S = farming.S

minetest.register_craftitem("farming_plus:orange_seed", {
	description = S("Orange Seeds"),
	inventory_image = "farming_orange_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming_plus:orange_1")
	end
})

minetest.register_craftitem("farming_plus:orange_item", {
	description = S("Orange"),
	inventory_image = "farming_orange.png",
	groups = {food_orange = 1},
	on_use = minetest.item_eat(4),
})

-- orange seed craft added here
minetest.register_craft({
	output = "farming_plus:orange_seed",
	recipe = {
		{"farming_plus:orange_item"},
	}
})

minetest.register_node("farming_plus:orange_1", {
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

minetest.register_node("farming_plus:orange_2", {
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

minetest.register_node("farming_plus:orange_3", {
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

minetest.register_node("farming_plus:orange_4", {
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
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:orange_5", {
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
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:orange", {
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
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

-- second tier growth section
minetest.register_node("farming_plus:orange_4b", {
	paramtype = "light",
	walkable = true,
	drawtype = "allfaces_optional",
	drop = "",
	tiles = {"farming_fruittree_1.png"},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:orange_5b", {
	paramtype = "light",
	walkable = true,
	drawtype = "allfaces_optional",
	drop = "",
	tiles = {"orange_blossoms.png"},
	after_dig_node = function(pos)
		minetest.set_node(pos, {name = "farming_plus:orange_4b"})
		pos.y = pos.y-1
		minetest.set_node(pos, {name = "farming_plus:orange_4"})
	end,
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:orangeb", {
	paramtype = "light",
	walkable = true,
	drawtype = "allfaces_optional",
	tiles = {"orange_fruited.png"},
	after_dig_node = function(pos)
		minetest.set_node(pos, {name = "farming_plus:orange_4b"})
		pos.y = pos.y-1
		minetest.set_node(pos, {name = "farming_plus:orange_4"})
	end,
	drop = {
		max_items = 4,
		items = {
			{ items = {"farming_plus:orange_item"} },
			{ items = {"farming_plus:orange_item"}, rarity = 2},
			{ items = {"farming_plus:orange_item"}, rarity = 3},
			{ items = {"farming_plus:orange_item"}, rarity = 4},
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

-- for original farming_plus orange replacement, not needed otherwise
--minetest.register_abm({
--	nodenames = "farming_plus:orange",
--	interval = 30,
--	chance = 5,
--	action = function(pos, node)
--		pos.y=pos.y+1
--		if minetest.get_node(pos).name == "air" then
--			minetest.set_node(pos, {name="farming_plus:orangeb"})
--		end
--	end
--})

farming.add_plant("farming_plus:orange", {"farming_plus:orange_1", "farming_plus:orange_2", "farming_plus:orange_3", "farming_plus:orange_4",
		"farming_plus:orange_5"}, 250, 4, 1, 2)

-- aliases for older versions
minetest.register_alias("farming_plus:orange_leaves", "farming_plus:orangeb")
minetest.register_alias("farming_plus:orange_blossoms", "farming_plus:orangeb")
minetest.register_alias("farming_plus:orange_fruited", "farming_plus:orangeb")


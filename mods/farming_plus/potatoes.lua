
-- original farming_plus potatoes by PilzAdam
-- modified by MTDad, stages increased.

-- main `S` code in init.lua
local S
S = farming.S

minetest.register_craftitem("farming_plus:potato_seed", {
	description = ("Seed Potatoes"),
	inventory_image = "farming_potato_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming_plus:potato_1")
	end
})

-- craft to cut up your potatoes for seed potatoes
minetest.register_craft({
	output = "farming_plus:potato_seed 4",
	recipe = {
		{"farming_plus:potato_item"},
	}
})

minetest.register_node("farming_plus:potato_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_potato_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+4/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:potato_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_potato_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+6/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_node("farming_plus:potato_3", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_potato_3.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+7/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:potato_4", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_potato_4.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+9/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})
minetest.register_node("farming_plus:potato_5", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_potato_5.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+11/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:potato_6", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_potato_6.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+13/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:potato", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_potato_7.png"},
	drop = {
		max_items = 4, -- reduced from 6>4
		items = {
--			{ items = {'farming_plus:potato_seed'} },
--			{ items = {'farming_plus:potato_seed'}, rarity = 2},
--			{ items = {'farming_plus:potato_seed'}, rarity = 5},
			{ items = {'farming_plus:potato_item 2'} },
			{ items = {'farming_plus:potato_item'}, rarity = 3 },
			{ items = {'farming_plus:potato_item'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("farming_plus:potato_item", {
	description = S("Potato"),
	inventory_image = "farming_potato.png",
	groups = {food_potato = 1},
-- added for mtfood compatibility, potato slices overwrites seed craft
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming_plus:potato_1")
	end
})

farming.add_plant("farming_plus:potato", {"farming_plus:potato_1", "farming_plus:potato_2", "farming_plus:potato_3", "farming_plus:potato_4", "farming_plus:potato_5", "farming_plus:potato_6"}, 250, 2)

minetest.register_alias("farming_plus:potatoe_item", "farming_plus:potato_item")
minetest.register_alias("farming_plus:potatoe_seed", "farming_plus:potato_seed")
minetest.register_alias("farming_plus:potatoe", "farming_plus:potato")
minetest.register_alias("farming_plus:potatoe_1", "farming_plus:potato_1")
minetest.register_alias("farming_plus:potatoe_2", "farming_plus:potato_2")
minetest.register_alias("docfarming:potato", "farming_plus:potato_item")
minetest.register_alias("farming:potato", "farming_plus:potato_item")
minetest.register_alias("docfarming:potato1", "farming_plus:potato_1")
minetest.register_alias("farming:potato_1", "farming_plus:potato_1")
minetest.register_alias("docfarming:potato2", "farming_plus:potato_2")
minetest.register_alias("farming:potato_2", "farming_plus:potato_3")
minetest.register_alias("docfarming:potato3", "farming_plus:potato_5")
minetest.register_alias("farming:potato_3", "farming_plus:potato")
minetest.register_alias("docfarming:potato4", "farming_plus:potato")
minetest.register_alias("farming:potato_4", "farming_plus:potato")
-- for compatibility and replacement
minetest.register_alias("docfarming:bakedpotato", "farming:baked_potato")
minetest.register_craftitem(":farming:baked_potato", {
	description = "Baked Potato",
	inventory_image = "farming_baked_potato.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming:baked_potato",
	recipe = "farming:potato"
})


-- Docfarming Corn imported into Farming_Plus by MTDad

-- main `S` code in init.lua
local S
S = farming.S

minetest.register_craftitem("farming_plus:corn_seed", {
	description = S("Corn Seeds"),
	inventory_image = "farming_cornseed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming_plus:corn_1")
	end

})

minetest.register_craftitem("farming_plus:corn_item", {
	description = S("Corn"),
	inventory_image = "farming_corn.png",
	groups = {food_corn = 1},
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	output = "farming_plus:corn_seed 4",
	recipe = {
		{"farming_plus:corn_item"},
	}
})

-- corn on the cob from Farming Redo by TenPlus1

minetest.register_craftitem("farming_plus:corn_cob", {
	description = "Corn on the Cob",
	inventory_image = "farming_corn_cob.png",
	on_use = minetest.item_eat(5),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 5,
	output = "farming_plus:corn_cob",
	recipe = "farming_plus:corn_item"
})

-- ground level growth
minetest.register_node("farming_plus:corn_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_corn_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+3/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:corn_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_corn_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+3/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:corn_3", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_corn_4b.png"},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:corn_4", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_corn_4.png"},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:corn_5", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_corn_5.png"},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:corn", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_corn_5.png"},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

-- 2nd tier growth
minetest.register_node("farming_plus:corn_4b", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_corn_4b.png"},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:corn_5b", {
	paramtype = "light",
	walkable = true,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_corn_5b.png"},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:cornb", {
	paramtype = "light",
	walkable = true,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_corn_6b.png"},
	drop = {
		max_items = 3, --reduced from 6>3
		items = {
			{ items = {'farming_plus:corn_item'} },
			{ items = {'farming_plus:corn_item'}, rarity = 2},
			{ items = {'farming_plus:corn_item'}, rarity = 5},
--			{ items = {'farming_plus:corn_seed'} },
--			{ items = {'farming_plus:corn_seed'}, rarity = 2 },
--			{ items = {'farming_plus:corn_seed'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

-- 3rd tier growth
minetest.register_node("farming_plus:corn_5c", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_corn_5c.png"},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:cornc", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_corn_6c.png"},
	drop = {
		max_items = 3,  -- reduced from 6>3
		items = {
			{ items = {'farming_plus:corn_item'} },
			{ items = {'farming_plus:corn_item'}, rarity = 2},
			{ items = {'farming_plus:corn_item'}, rarity = 5},
--			{ items = {'farming_plus:corn_seed'} },
--			{ items = {'farming_plus:corn_seed'}, rarity = 2 },
--			{ items = {'farming_plus:corn_seed'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
})

farming.add_plant("farming_plus:corn", {"farming_plus:corn_1", "farming_plus:corn_2", "farming_plus:corn_3",
		"farming_plus:corn_4", "farming_plus:corn_5"}, 250, 2, nil, 3)


minetest.register_alias("docfarming:cornseed", "farming_plus:corn_seed")
minetest.register_alias("docfarming:corn", "farming_plus:corn_item")
minetest.register_alias("farming:corn", "farming_plus:corn_item")
minetest.register_alias("docfarming:corn1", "farming_plus:corn_1")
minetest.register_alias("farming:corn_1", "farming_plus:corn_1")
minetest.register_alias("docfarming:corn2", "farming_plus:corn_2")
minetest.register_alias("farming:corn_2", "farming_plus:corn_2")
minetest.register_alias("docfarming:corn3", "farming_plus:corn_4")
minetest.register_alias("farming:corn_3", "farming_plus:corn_3")
minetest.register_alias("docfarming:corn4", "farming_plus:corn_5")
minetest.register_alias("docfarming:corn21", "farming_plus:corn_4b")
minetest.register_alias("docfarming:corn22", "farming_plus:corn_5b")
minetest.register_alias("docfarming:corn23", "farming_plus:cornb")
minetest.register_alias("docfarming:corn31", "farming_plus:corn_5c")
minetest.register_alias("docfarming:corn32", "farming_plus:cornc")
minetest.register_alias("farming:corn_4", "farming_plus:corn_3")
minetest.register_alias("farming:corn_5", "farming_plus:corn_3")
minetest.register_alias("farming:corn_6", "farming_plus:corn_3")
minetest.register_alias("farming:corn_7", "farming_plus:cornc")
minetest.register_alias("farming:corn_8", "farming_plus:cornc")
minetest.register_alias("farming_plus:corn_21", "farming_plus:corn_4b")
minetest.register_alias("farming_plus:corn_22", "farming_plus:corn_5b")
minetest.register_alias("farming_plus:corn_23", "farming_plus:cornb")
minetest.register_alias("farming_plus:corn_31", "farming_plus:corn_5c")
minetest.register_alias("farming_plus:corn_32", "farming_plus:cornc")
minetest.register_alias("farming:corn_cob", "farming_plus:corn_cob")

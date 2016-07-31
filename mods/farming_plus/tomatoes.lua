-- original Farming_plus tomatoes.lua by AdamPilz modified by MTDad.
-- growth stages doubled from 4 to 8, new textures by MTDad.

-- main `S` code in init.lua
local S
S = farming.S

minetest.register_craftitem("farming_plus:tomato_seed", {
	description = S("Tomato Seeds"),
	inventory_image = "farming_tomato_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming_plus:tomato_1")
	end
})

minetest.register_node("farming_plus:tomato_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_tomato_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+4/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:tomato_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_tomato_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+6/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:tomato_3", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_tomato_3.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+8/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:tomato_4", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_tomato_4.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+10/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:tomato_5", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_tomato_5.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+8/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:tomato_6", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_tomato_6.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+12/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:tomato_7", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_tomato_7.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+14/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:tomato", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_tomato_8.png"},
	drop = {
-- reduced from 6>3 max items 
		max_items = 3,
		items = {
--			{ items = {'farming_plus:tomato_seed'} },
--			{ items = {'farming_plus:tomato_seed'}, rarity = 2},
--			{ items = {'farming_plus:tomato_seed'}, rarity = 5},
			{ items = {'farming_plus:tomato_item'} },
			{ items = {'farming_plus:tomato_item'}, rarity = 2 },
			{ items = {'farming_plus:tomato_item'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("farming_plus:tomato_item", {
	description = S("Tomato"),
	inventory_image = "farming_tomato.png",
	groups = {food_tomato = 1},
	on_use = minetest.item_eat(4),
})

-- changed from 50,20 to 120,2
farming.add_plant("farming_plus:tomato", {"farming_plus:tomato_1", "farming_plus:tomato_2", "farming_plus:tomato_3", 		"farming_plus:tomato_4", "farming_plus:tomato_5", "farming_plus:tomato_6", "farming_plus:tomato_7"}, 250, 2)

-- tomato seed crafting added here
minetest.register_craft ({
	output = "farming_plus:tomato_seed 4",
	recipe = {
		{"farming_plus:tomato_item"},
	}
})

minetest.register_alias("farming:tomato", "farming_plus:tomato_item")
minetest.register_alias("farming:tomato_1", "farming_plus:tomato_1")
minetest.register_alias("farming:tomato_2", "farming_plus:tomato_2")
minetest.register_alias("farming:tomato_3", "farming_plus:tomato_3")
minetest.register_alias("farming:tomato_4", "farming_plus:tomato_4")
minetest.register_alias("farming:tomato_5", "farming_plus:tomato_5")
minetest.register_alias("farming:tomato_6", "farming_plus:tomato_6")
minetest.register_alias("farming:tomato_7", "farming_plus:tomato")
minetest.register_alias("farming:tomato_8", "farming_plus:tomato")

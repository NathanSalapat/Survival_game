-- Melon
-- Originally from Farming Redo by Tenplus, adapted to Farming_Plus by MTDad

-- main `S` code in init.lua
local S
S = farming.S

minetest.register_craftitem("farming_plus:melon_item", {
	description = S("Melon Slice"),
	inventory_image = "farming_melon_slice.png",
	groups = {food_melon = 1},
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	output = "farming_plus:melon",
	recipe = {
		{"farming_plus:melon_item", "farming_plus:melon_item", "farming_plus:melon_item"},
		{"farming_plus:melon_item", "farming_plus:melon_item", "farming_plus:melon_item"},
		{"farming_plus:melon_item", "farming_plus:melon_item", "farming_plus:melon_item"},
	}
})

minetest.register_craft({
	output = "farming_plus:melon_item 9",
	recipe = {
		{"farming_plus:melon"},
	}
})

-- Seeds and Craft added by MTDad
minetest.register_craftitem("farming_plus:melon_seed", {
	description = S("Melon Seed"),
	inventory_image = "farming_melon_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming_plus:melon_1")
	end,
})

minetest.register_craft({
	output = "farming_plus:melon_seed",
	recipe = {
		{"farming_plus:melon_item"},
	}
})
-- Define Melon growth stages

minetest.register_node("farming_plus:melon_1", {
	drawtype = "plantlike",
	tiles = {"farming_melon_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+2/16, 0.5},},
	groups = {snappy=3,flammable=2,plant=1,not_in_creative_inventory=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:melon_2", {
	drawtype = "plantlike",
	tiles = {"farming_melon_2.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+4/16, 0.5},},
	groups = {snappy=3,flammable=2,plant=1,not_in_creative_inventory=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:melon_3", {
	drawtype = "plantlike",
	tiles = {"farming_melon_3.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+6/16, 0.5},},
	groups = {snappy=3,flammable=2,plant=1,not_in_creative_inventory=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:melon_4", {
	drawtype = "plantlike",
	tiles = {"farming_melon_4.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+8/16, 0.5},},
	groups = {snappy=3,flammable=2,plant=1,not_in_creative_inventory=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:melon_5", {
	drawtype = "plantlike",
	tiles = {"farming_melon_5.png"},
	paramtype = "light",
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+10/16, 0.5},},
	groups = {snappy=3,flammable=2,plant=1,not_in_creative_inventory=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:melon_6", {
	drawtype = "plantlike",
	tiles = {"farming_melon_6.png"},
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+12/16, 0.5},},
	groups = {snappy=3,flammable=2,plant=1,not_in_creative_inventory=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:melon_7", {
	drawtype = "plantlike",
	tiles = {"farming_melon_7.png"},
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = {type = "fixed",fixed = {-0.5, -0.5, -0.5, 0.5, -0.5+14/16, 0.5},},
	groups = {snappy=3,flammable=2,plant=1,not_in_creative_inventory=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:melon", {
	drawtype = "nodebox",
	description = "Melon",
	tiles = {"farming_melon_top.png", "farming_melon_top.png", "farming_melon_side.png"},
	paramtype = "light",
	walkable = true,
	is_ground_content = true,
	drop = {
		items = {
			{items = {'farming_plus:melon_item 9'},rarity=1},
		}
	},
	groups = {choppy=3,flammable=2,plant=1},
	sounds = default.node_sound_wood_defaults(),
})
farming.add_plant("farming_plus:melon", {"farming_plus:melon_1", "farming_plus:melon_2", "farming_plus:melon_3", "farming_plus:melon_4", "farming_plus:melon_5", "farming_plus:melon_6", "farming_plus:melon_7"}, 300, 2)

minetest.register_alias("farming:melon_slice", "farming_plus:melon_item")
minetest.register_alias("farming:melon_1", "farming_plus:melon_1")
minetest.register_alias("farming:melon_2", "farming_plus:melon_2")
minetest.register_alias("farming:melon_3", "farming_plus:melon_3")
minetest.register_alias("farming:melon_4", "farming_plus:melon_4")
minetest.register_alias("farming:melon_5", "farming_plus:melon_5")
minetest.register_alias("farming:melon_6", "farming_plus:melon_6")
minetest.register_alias("farming:melon_7", "farming_plus:melon_7")
minetest.register_alias("farming:melon_8", "farming_plus:melon")

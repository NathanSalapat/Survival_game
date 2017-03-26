-- Nodes

minetest.register_node("intersecting:luxore", {
	description = "Lux Ore",
	tiles = {"intersecting_luxore.png"},
	paramtype = "light",
	light_source = 14,
	groups = {cracky = 3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("intersecting:light", {
	description = "Light",
	tiles = {"intersecting_light.png"},
	paramtype = "light",
	light_source = 14,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

-- Crafting.

minetest.register_craft({
    output = "intersecting:light 8",
    recipe = {
        {"default:glass", "default:glass", "default:glass"},
        {"default:glass", "intersecting:luxore", "default:glass"},
        {"default:glass", "default:glass", "default:glass"},
    },
})

minetest.register_craft({
    output = "intersecting:light 8",
    recipe = {
        {"default:obsidian_glass", "default:obsidian_glass", "default:obsidian_glass"},
        {"default:obsidian_glass", "intersecting:luxore", "default:obsidian_glass"},
        {"default:obsidian_glass", "default:obsidian_glass", "default:obsidian_glass"},
    },
})

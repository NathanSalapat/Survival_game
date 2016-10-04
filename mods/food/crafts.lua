minetest.register_craft( {
	output = "food:drinking_glass 7",
	recipe = {
		{ "default:glass", "", "default:glass" },
		{ "default:glass", "default:glass", "default:glass" }
	}
})

minetest.register_craft( {
	output = "food:bottle 7",
	recipe = {
		{ "default:glass", "", "default:glass" },
		{ "default:glass", "", "default:glass" },
		{ "default:glass", "default:glass", "default:glass" }
	}
})

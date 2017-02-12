minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:desert_sand"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 29,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "plants:barrel_cacti_1_sp",
})

minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:desert_sand"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.02,
			spread = {x = 100, y = 100, z = 100},
			seed = 219,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "plants:prickly_pear_1",
})

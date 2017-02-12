for i in ipairs (ores.material_table) do
	local metal = ores.material_table[i][1]

minetest.register_craft({
	output = 'ores:'..metal..'_sheet 5',
	recipe = {
		{'ores:'..metal..'_ingot', 'ores:'..metal..'_ingot', 'ores:'..metal..'_ingot'},
	},
})

minetest.register_craft({
	type = 'cooking',
	output = 'ores:'..metal..'_ingot',
	recipe = 'ores:'..metal..'_lump',
})
end

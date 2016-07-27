local meats = {
{'steak'},
{'pork'},
{'poultry'},
}

for i in ipairs (meats) do
	local meat_type = meats[i][1]

minetest.register_craft({
		type = 'cooking',
		output = 'food:'..meat_type..'_cooked',
		recipe = 'food:'..meat_type..'_raw',
		cooktime = 10,
})
end

minetest.register_craft({
		type = 'cooking',
		output = 'food:meaty_stew_cooked',
		recipe = 'food:meaty_stew_raw',
		cooktime = 30,
})

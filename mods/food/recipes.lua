local meats = {
{'steak'},
{'pork'},
{'fowl'},
}

for i in ipairs (meats) do
	local meat_type = meats[i][1]

minetest.register_craft({
		output = 'food:'..meat_type..'_salted',
		recipe = {
			{'survival:salt', 'survival:salt', 'survival:salt'},
			{'survival:salt', 'food:'..meat_type..'_raw', 'survival:salt'},
			{'survival:salt', 'survival:salt', 'survival:salt'},
			}
})
end

minetest.register_craft({
		output = 'food:meaty_stew_raw',
		recipe = {
			{'', 'group:meat', ''},
			{'crops:tomato', 'crops:corn', 'crops:potato'},
			{'', 'thirst:wooden_bowl', ''},
			}
})



--Group groups
local raw_meat = {meat=1, meat_raw=1}
local cooked_meat = {meat=1, meat_cooked=1}
local smoked_meat = {meat=1, meat_smoked=1}
local spoiled_meat = {meat=1, meat_spoiled=1}
local salted_meat = {meat=1, meat_salted=1}
local dried_meat = {meat=1, meat_cooked=1, meat_dried=1}

--Foods Table
local food_table = { --craft, desc, health, hydration, groups
{'steak_raw', 'Raw Steak', .4, .25, raw_meat},
{'steak_cooked', 'Cooked Steak', .5, .1, cooked_meat},
{'steak_smoked', 'Smoked Steak', .5, -.3, smoked_meat},
{'steak_spoiled', 'Rotten Steak', -2, .1, spoiled_meat},
{'steak_salted', 'Salted Steak', .5, -1, salted_meat},
{'steak_dried', 'Dried Jerky', .75, -1.5, dried_meat}
}


--Parse Table
for i in ipairs (food_table) do
	local craft = food_table[i][1]
	local desc = food_table[i][2]
	local health = food_table[i][3]
	local hydration = food_table[i][4]
	local group = food_table[i][5]

--Actual craftitem registration
minetest.register_craftitem('food:'..craft, {
	description = desc,
	inventory_image = 'food_'..craft..'.png',
	groups = group,
	on_use = function(itemstack, user, pointed_thing)
		thirsty.drink(user, hydration, 20)
		local eat_func = minetest.item_eat(health)
		return eat_func(itemstack, user, pointed_thing)
	end,
})
end

minetest.register_craft({
		type = 'cooking',
		output = 'food:steak_cooked',
		recipe = 'food:steak_raw',
		cooktime = 10,
		})

minetest.register_craft({
		output = 'food:steak_salted',
		recipe = {
			{'survival:salt', 'survival:salt', 'survival:salt'},
			{'survival:salt', 'food:steak_raw', 'survival:salt'},
			{'survival:salt', 'survival:salt', 'survival:salt'},
			}
})

--Group groups
local raw_meat = {meat=1, meat_raw=1}
local cooked_meat = {meat=1, meat_cooked=1}
local smoked_meat = {meat=1, meat_smoked=1}
local spoiled_meat = {meat_spoiled=1}
local salted_meat = {meat=1, meat_salted=1}
local dried_meat = {meat=1, meat_cooked=1, meat_dried=1}
local egg = {egg=1,}

-- Foods Table --
-- 2 health = 1 loaf in game
-- 2 hydration = 1 cups in game
local food_table = { --craft, desc, health, hydration, groups, chance(of getting food poisoning x/10)
{'steak_raw', 'Raw Steak', 2, 2, raw_meat, 6},
{'steak_cooked', 'Cooked Steak', 6, 1.5, cooked_meat, 0},
{'steak_smoked', 'Smoked Steak', 4.5, -3, smoked_meat, 0},
{'steak_spoiled', 'Rotten Steak', .5, 1, spoiled_meat, 10},
{'steak_salted', 'Salted Steak', 5, -2.5, salted_meat, 0},
{'steak_dried', 'Dried Jerky', 5, -1.5, dried_meat, 0},
{'pork_raw', 'Raw Pork', 1, 2, raw_meat, 6},
{'pork_cooked', 'Cooked Pork', 5, 1, cooked_meat, 0},
{'pork_smoked', 'Smoked Pork', 3.5, -3, smoked_meat, 0},
{'pork_spoiled', 'Rotten Pork', .5, 1, spoiled_meat, 10},
{'pork_salted', 'Salted Pork', 4.5, -1.5, salted_meat, 0},
{'poultry_raw', 'Raw Poultry', 1, 1, raw_meat, 9},
{'poultry_cooked', 'Cooked Poultry', 3, 1, cooked_meat, 0},
{'poultry_spoiled', 'Spoiled Poultry', .5, .5, spoiled_meat, 10},
{'egg_raw', 'Raw Egg', 1, .5, egg, 6},
{'egg_fried', 'Cooked Egg', 2, .5, egg, 0}
}


--Parse Table
for i in ipairs (food_table) do
	local craft = food_table[i][1]
	local desc = food_table[i][2]
	local health = food_table[i][3]
	local hydration = food_table[i][4]
	local grup = food_table[i][5]
	local chance = food_table[i][6]

--Actual craftitem registration
minetest.register_craftitem('food:'..craft, {
	description = desc,
	inventory_image = 'food_'..craft..'.png',
	groups = grup,
	on_use = function(itemstack, user, pointed_thing)
		local eat_func = minetest.item_eat(health)
--		local chance_level = math.random(0,10)
--[[		if chance_level < chance then
			local influencia = pathogen.get_pathogen('influencia')
			pathogen.infect = function(influencia, user)
		end
--]]
		thirsty.drink(user, hydration, 20) --controls the hydration gain
		return eat_func(itemstack, user, pointed_thing) --controls the fullness gain
		end
})
end

minetest.register_craftitem('survival:slug_raw', {
	description = 'slug',
	inventory_image = 'survival_slug_raw.png',
	on_use = function(player)
		local hp_gain = math.random(-4,1)
		local hp = player:get_hp()
		player:set_hp(hp + hp_gain)
	end
})

local food_table = { --craft, desc, invimg, health, hydration
{'slug_cooked', 'cooked slug', 'slug_cooked', .25, .1},
{'cricket_raw', 'cricket', 'cricket_raw', .25, .1},
{'cricket_cooked', 'cooked cricket', 'cricket_cooked', .125, .125},
{'worm_raw', 'worm', 'worm_raw', .25, .2},
{'worm_cooked', 'cooked worm', 'worm_cooked', .125, .1},
{'centipede_raw', 'centipede', 'centipede_raw', .25, .15},
{'centipede_cooked', 'cooked centipede', 'centipede_cooked', .25, .1},
{'milipede_raw', 'milipede', 'milipede_raw', -4, .1},
{'milipede_cooked', 'cooked milipede', 'milipede_cooked', -3, 0},
{'oyster_raw', 'raw oyster', 'oyster_raw', .5, .45},
{'oyster_cooked', 'cooked oyster', 'oyster_cooked', .6, .35},
{'mussel_raw', 'raw mussel', 'mussel_raw', -.7, .6},
{'mussel_cooked', 'cooked mussel', 'mussel_cooked', .6, .35},
{'sugar', 'sugar', 'sugar', .1, -1},
{'raw_kabob', 'uncooked seafood kabob', 'raw_kabob', 1, 1.5},
{'cooked_kabob', 'seafood kabob', 'cooked_kabob', 2.5, 1},
{'energy_bar', 'energy bar', 'energy_bar', 10, -4}
}

for i in ipairs (food_table) do
	local craft = food_table[i][1]
	local desc = food_table[i][2]
	local invimg = food_table[i][3]
	local health = food_table[i][4]
	local hydration = food_table[i][5]

minetest.register_craftitem('survival:'..craft, {
	description = desc,
	inventory_image = 'survival_'..invimg..'.png',
	on_use = function(itemstack, user, pointed_thing)
		thirsty.drink(user, hydration, 20)
		local eat_func = minetest.item_eat(health)
		return eat_func(itemstack, user, pointed_thing)
	end,
})
end

minetest.register_craftitem('food:meaty_stew_cooked', {
	description = 'Hearty meat stew',
	inventory_image = 'food_meat_stew.png',
	on_use = function(itemstack, user, pointed_thing)
		local eat_func = minetest.item_eat(1.5)
		thirsty.drink(user, 2, 20) --controls the hydration gain
		return eat_func(itemstack, user, pointed_thing) --controls the fullness gain
		end
})

minetest.register_craftitem('food:meaty_stew_raw', {
	description = 'Raw hearty meat stew',
	inventory_image = 'food_meat_stew_raw.png',
	on_use = function(itemstack, user, pointed_thing)
		local eat_func = minetest.item_eat(1.5)
--[[		local chance_level = math.random(0,10)
		if chance_level < 5 then
			local influencia = pathogen.get_pathogen('influencia')
			pathogen.infect = function(influencia, user)
		end
--]]
		thirsty.drink(user, 4, 20) --controls the hydration gain
		return eat_func(itemstack, user, pointed_thing) --controls the fullness gain
		end
})

minetest.register_craftitem('food:drinking_glass', {
   description = 'Drinking glass',
   inventory_image = 'food_drinking_glass.png',
})

minetest.register_craftitem('food:bottle', {
   description = 'Empty bottle',
   inventory_image = 'food_drinking_bottle.png',
})

--Foods Table
-- 2 health = 1 loaf in game
-- 2 hydration = 1 cups in game
local food_table = { --craft, desc
{'apple', 'Apple',},
{'pear', 'Pear',},
{'banana', 'Banana'},
{'blackberry', 'Blackberry'},
{'blueberry', 'Blueberry'},
{'raspberry', 'Raspberry'},
{'gooseberry', 'Gooseberry'},
}

--Parse Table
for i in ipairs (food_table) do
   local craft = food_table[i][1]
   local desc = food_table[i][2]

--Register foods.
--hunger.register_food(name, hunger_change, replace_with_item, poisen, heal, sound)
--local register_food = hunger.register_food
--register_food('food:jc_'..craft, .5, 'vessels:drinking_glass')

--Actual Node registration
minetest.register_craftitem('food:jcu_'..craft, {
   description = 'Cup of '..desc..' Juice',
   groups = {drink=1},
   inventory_image = 'food_jc_'..craft..'.png',
   on_use = function(itemstack, user, pointed_thing)
      thirsty.drink(user, 2, 20)
      local eat_func = minetest.item_eat(.5, 'vessels:drinking_glass')
      return eat_func(itemstack, user, pointed_thing)
   end,
})

minetest.register_craftitem('food:jbo_'..craft, {
   description = 'Bottle of '..desc..' Juice',
   groups = {drink=1},
   inventory_image = 'food_jbo_'..craft..'.png',
   on_use = function(itemstack, user, pointed_thing)
      thirsty.drink(user, 4, 20)
      local eat_func = minetest.item_eat(.5, 'vessels:drinking_glass')
      return eat_func(itemstack, user, pointed_thing)
   end,
})

minetest.register_craftitem('food:jbu_'..craft, {
   description = 'Bucket of '..desc..' Juice',
   inventory_image = 'food_jbu_'..craft..'.png',
   stack_max = 1,
})

end

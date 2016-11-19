--Foods Table
-- 2 health = 1 loaf in game
-- 2 hydration = 1 cups in game
local food_table = { --craft, desc
{'apple', 'Apple', '#ecff56'},
{'pear', 'Pear', '#96F97B'},
{'banana', 'Banana', '#eced9f'},
{'blackberry', 'Blackberry', '#581845'},
{'blueberry', 'Blueberry', '#521dcb'},
{'raspberry', 'Raspberry', '#C70039'},
{'gooseberry', 'Gooseberry', '#9cf57c'},
}

--Parse Table
for i in ipairs (food_table) do
   local desc = food_table[i][1]
   local craft = food_table[i][2]
   local color = food_table[i][3]

--Register foods.
--hunger.register_food(name, hunger_change, replace_with_item, poisen, heal, sound)
--local register_food = hunger.register_food
--register_food('food:jc_'..craft, .5, 'vessels:drinking_glass')

--Actual Node registration
minetest.register_craftitem('food:jcu_'..desc, {
   description = 'Cup of '..craft..' Juice',
   groups = {drink=1},
   inventory_image = 'food_glass_contents.png^[colorize:'..color..':200^food_drinking_glass.png',
   on_use = function(itemstack, user, pointed_thing)
      thirsty.drink(user, 4, 20)
      local eat_func = minetest.item_eat(.5, 'food:drinking_glass')
      return eat_func(itemstack, user, pointed_thing)
   end,
})

minetest.register_craftitem('food:jbo_'..desc, {
   description = 'Bottle of '..craft..' Juice',
   groups = {drink=1},
   inventory_image = 'food_bottle_contents.png^[colorize:'..color..':200^food_drinking_bottle.png',
   on_use = function(itemstack, user, pointed_thing)
      thirsty.drink(user, 8, 20)
      local eat_func = minetest.item_eat(.5, 'food:bottle')
      return eat_func(itemstack, user, pointed_thing)
   end,
})

minetest.register_craftitem('food:jbu_'..desc, {
   description = 'Bucket of '..craft..' Juice',
   inventory_image = 'bucket.png^(food_bucket_contents.png^[colorize:'..color..':200)',
   stack_max = 1,
})

end

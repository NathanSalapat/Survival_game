--Selection Boxes
local s_fruit = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	}

--Group groups
local g_fruit = {fleshy=3,dig_immediate=3,flammable=2,leafdecay=3,leafdecay_drop=1,flora=1}

--Foods Table
local food_table = { --craft, desc, health, hydration, selection box, groups
{'apple', 'Apple', .25, .3, s_fruit, g_fruit},
{'pear', 'Pear', .25, .3, s_fruit, g_fruit},
{'banana', 'Banana', .2, .15, s_fruit, g_fruit},
}


--Parse Table
for i in ipairs (food_table) do
	local craft = food_table[i][1]
	local desc = food_table[i][2]
	local health = food_table[i][3]
	local hydration = food_table[i][4]
	local selection = food_table[i][5]
	local group = food_table[i][6]

--Actual Node registration
minetest.register_node('food:'..craft, {
	drawtype = 'plantlike',
	paramtype = 'light',
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = selection,
	tiles = {'food_'..craft..'.png'},
	description = desc,
	groups = group,
	inventory_image = 'food_'..craft..'.png',
	on_use = function(itemstack, user, pointed_thing)
		thirsty.drink(user, hydration, 20)
		local eat_func = minetest.item_eat(health)
		return eat_func(itemstack, user, pointed_thing)
	end,
	after_place_node = function(pos)
		minetest.set_node(pos, {name = 'food_'..craft, param2=1})
	end,
})
end

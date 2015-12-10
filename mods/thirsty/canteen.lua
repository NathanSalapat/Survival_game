--[[ This file adds more recipes for the canteens to make sure water is gettable in any location. It also holds some overrides so when I update the main mod I don't have to go back and make all sorts of changes to make things work the way I want them to for the subgame. --]]

--Craft Recipes
minetest.register_craft({
	output = 'thirsty:bronze_canteen_snow',
		recipe = {
			{ 'default:snow', 'default:snow', 'default:snow'},
			{ 'default:snow', 'thirsty:bronze_canteen', 'default:snow'},
			{ 'default:snow', 'default:snow', 'default:snow'}
		}
})

minetest.register_craft({
	type = 'shapeless',
		output = 'thirsty:bronze_canteen_snow',
		recipe = {
			'default:snow_block', 'thirsty:bronze_canteen',
		}
})

minetest.register_craft({
	type = 'shapeless',
		output = 'thirsty:bronze_canteen',
		recipe = {
			'thirsty:bronze_canteen_snow',
		}
})

minetest.register_craft({
	output = 'thirsty:steel_canteen_snow',
	recipe = {
		{ 'default:snow', 'default:snow', 'default:snow'},
		{ 'default:snow', 'thirsty:steel_canteen', 'default:snow'},
		{ 'default:snow', 'default:snow', 'default:snow'}
		}
})

minetest.register_craft({
	type = 'shapeless',
	output = 'thirsty:steel_canteen_snow',
	recipe = {
		'default:snow_block', 'thirsty:steel_canteen',
	}
})

--Cooking recipes, melting/boiling the snow
minetest.register_craft({
    type = 'cooking',
    output = 'thirsty:bronze_canteen',
    recipe = 'thirsty:bronze_canteen_snow',
    cooktime = 20,
})

minetest.register_craft({
	type = 'cooking',
	output = 'thirsty:steel_canteen',
	recipe = 'thirsty:steel_canteen_snow',
	cooktime = 20,
})



--Craft items

minetest.register_craftitem('thirsty:bronze_canteen_snow', {
	description = 'Bronze canteen with snow',
	inventory_image = 'thirsty_bronze_canteen_16.png',
})

minetest.register_craftitem('thirsty:steel_canteen_snow', {
	description = 'Steel canteen with snow',
	inventory_image = 'thirsty_steel_canteen_16.png',
})

minetest.register_on_craft(function(itemstack)
    if itemstack:get_name() == 'thirsty:bronze_canteen' then
        itemstack:set_wear(40000)
        return itemstack
    end
end)

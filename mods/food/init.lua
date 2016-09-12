dofile(minetest.get_modpath('food')..'/abms.lua') --Active Block Modifiers that do different things.
dofile(minetest.get_modpath('food')..'/cooking.lua') --Cook all the things
dofile(minetest.get_modpath('food')..'/cooking_machines.lua') --Stoves, Smokers, things to cook the food.
dofile(minetest.get_modpath('food')..'/craftitems.lua') --yep, craftitems here, big surprise.
dofile(minetest.get_modpath('food')..'/formspecs.lua') --formspecs for different things.
dofile(minetest.get_modpath('food')..'/fruits.lua') --Fruits, need I document this?
dofile(minetest.get_modpath('food')..'/meats.lua') --Again, I think it's obvious
dofile(minetest.get_modpath('food')..'/recipes.lua') --Multi ingredient foods.
--dofile(minetest.get_modpath('food')..'/spoils.lua') --Mechanics for food to spoil
dofile(minetest.get_modpath('food')..'/traps.lua') --capture and eat yummy animals.
dofile(minetest.get_modpath('food')..'/drinks.lua') --Fresh drinks for everyone.
dofile(minetest.get_modpath('food')..'/drink_machines.lua') --there has to be a way to make the drinks.


food = {}

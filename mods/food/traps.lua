--Node Definitions
minetest.register_node('food:snare', { --simple way to catch small game
	description = 'Simple Snare',
	drawtype = 'mesh',
	mesh = 'food_snare.obj',
	tiles = {name='default_wood.png'},
	groups = {choppy=2, dig_immediate=2,},
	paramtype = 'light',
	paramtype2 = 'facedir',
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = 'fixed',
		fixed = {-.4, -.5, -.4, .4, .0, .4},
		},
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('main', 8*4)
		inv:set_size('bait', 1)
		inv:set_size('game', 1)
		meta:set_string('formspec', trap_empty)
		meta:set_string('infotext', 'Simple Snare')
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player) --yes you can bait with ANYTHING.
		local meta = minetest.env:get_meta(pos)
		minetest.swap_node(pos, {name = 'food:snare_baited'})
		meta:set_string('formspec', trap_baited)
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.env:get_meta(pos)
		meta:set_string('formspec', trap_empty)
	end,
})

minetest.register_node('food:snare_baited', { --baited trap
	drawtype = 'mesh',
	mesh = 'food_snare.obj',
	tiles = {name='default_wood.png'},
	groups = {choppy=2, dig_immediate=2,},
	paramtype = 'light',
	paramtype2 = 'facedir',
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = 'fixed',
		fixed = {-.4, -.5, -.4, .4, .0, .4},
		},
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.env:get_meta(pos)
		minetest.swap_node(pos, {name = 'food:snare'})
		meta:set_string('formspec', trap_empty)
	end,
	can_dig = function(pos,player)
		return false
	end,
})

--Craft Recipes
minetest.register_craft({
		output = 'food:snare',
		recipe = {
			{'more_fire:flintstone', 'more_fire:flintstone', 'more_fire:flintstone'},
			{'group:stick', 'farming:cotton', 'group:stick'},
			{'group:stick', 'group:stick', 'default:stick'},
			}
})

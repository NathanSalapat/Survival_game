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
		meta:set_string('infotext', 'Baited Simple Snare')
	end,
})

minetest.register_node('food:snare_baited', { --baited trap
	description = 'Simple Snare with Bait',
	drawtype = 'mesh',
	mesh = 'food_snare.obj',
	tiles = {name='default_wood.png'},
	groups = {choppy=2, dig_immediate=2, not_in_creative_inventory=1},
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
		meta:set_string('infotext', 'Simple Snare')
	end,
	can_dig = function(pos,player)
		return false
	end,
})

minetest.register_node('food:snare_game', { --trap with game
	description = 'Simple Snare with Game',
	drawtype = 'mesh',
	mesh = 'food_snare.obj',
	tiles = {name='default_wood.png'},
	groups = {choppy=2, dig_immediate=2, not_in_creative_inventory=1},
	paramtype = 'light',
	paramtype2 = 'facedir',
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = 'fixed',
		fixed = {-.4, -.5, -.4, .4, .0, .4},
		},
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		return 0
	end,
	can_dig = function(pos,player)
		return false
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		for i=1, inv:get_size('game') do
			local stack = inv:get_stack('game', i)
			local captured_item = stack:get_name()
			print ('this is what was captured')
			print (captured_item)
			if fields ['butcher'] then
				meta:set_string('formspec', trap_empty)
				meta:set_string('infotext', 'Simple Snare')
				minetest.swap_node(pos, {name = 'food:snare'})
				inv:set_stack('bait', 1,'')
				inv:set_stack('game', 1,'')
				if captured_item == 'mobs:bunny' then
					sender:get_inventory():add_item('main', 'food:steak_raw 2')
				elseif captured_item == 'mobs:rat' then
					sender:get_inventory():add_item('main', 'food:steak_raw 1')
				elseif captured_item == 'mobs:chicken' then
					sender:get_inventory():add_item('main', 'mobs:chicken_raw')
				elseif captured_item == 'goblins:goblin_king' then
					minetest.add_entity(pos, captured_item)
				end
			end
			if fields ['free_catch'] then
				meta:set_string('formspec', trap_empty)
				meta:set_string('infotext', 'Simple Snare')
				minetest.swap_node(pos, {name = 'food:snare'})
				inv:set_stack('bait', 1,'')
				inv:set_stack('game', 1,'')
				minetest.add_entity(pos, captured_item)
			end
		end
	end,
})

minetest.register_node('food:snare_raided', { --trap with game
	description = 'Raided Simple Snare',
	drawtype = 'mesh',
	mesh = 'food_snare_raided.obj',
	tiles = {name='default_wood.png'},
	groups = {choppy=2, dig_immediate=2, not_in_creative_inventory=1},
	paramtype = 'light',
	paramtype2 = 'facedir',
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = 'fixed',
		fixed = {-.4, -.5, -.4, .4, .0, .4},
		},
	on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.env:get_meta(pos)
		if fields ['reset'] then
			meta:set_string('formspec', trap_empty)
			meta:set_string('infotext', 'Simple Snare')
			minetest.swap_node(pos, {name = 'food:snare'})
		end
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

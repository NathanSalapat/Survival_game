--Node Definitions
minetest.register_node('food:smoker', { --This will allow for smoking meats
	description = 'Smoker',
	drawtype = 'mesh',
	mesh = 'food_smoker.obj',
	tiles = {name='food_smoker.png'},
	inventory_image = 'foodsmoker.png',
	groups = {choppy=2, dig_immediate=2,},
	paramtype = 'light',
	paramtype2 = 'facedir',
	selection_box = {
		type = 'fixed',
		fixed = {-.5, -.5, -.4, .5, .5, .4},
		},
	collision_box = {
		type = 'fixed',
		fixed = {-.5, -.5, -.4, .5, .5, .4},
		},
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('main', 8*4)
		inv:set_size('fuel', 1)
		inv:set_size('meat', 3*2)
		meta:set_string('formspec',
			'size[8,7]'..
			'label[0,0;Smoke meat to preserve it.]' ..
			'list[current_name;meat;1,.5;3,2;]'..
            'list[current_name;fuel;5,1.5;1,1]'..
            'list[current_player;main;0,3;8,4;]')
		meta:set_string('infotext', 'Smoker')
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		local node = minetest.get_node(pos)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		local timer = minetest.get_node_timer(pos)
		--[[
--------------- Thanks to Kaeza for this code
		local function is_item_in_group(itemname, group)
			local def = minetest.registered_items[name]
				if not def then return end
				return (def.groups and (def.groups[group] or 0)>0)
			end
		local item = inv:get_stack('fuel', 1)
		local fuel_groups = {'tree'} -- Groups considered "fuel"
			if item and (not item:is_empty()) then
				for _, g in ipairs(fuel_groups) do
					if is_item_in_group(item:get_name(), g) then
					-- We found some fuel. Do something with it.
					return
				end
			end
		end
---------------
--]]
		if inv:contains_item('fuel', 'default:tree') or inv:contains_item('fuel', 'default:jungletree') then
			minetest.swap_node(pos, {name = 'food:smoker_on', param2=node.param2})
			timer:start(8*60) --eight minutes to smoke meat
			meta:set_string('infotext', 'Burning Smoker')
			meta:set_string('formspec',
			'size[8,7]'..
			"label[0,0;Watched meat won't smoke]" ..
			'list[current_name;meat;1,.5;3,2;]'..
			'list[current_name;fuel;5,1.5;1,1]'..
			'list[current_player;main;0,3;8,4;]')
		end
	end,
})

minetest.register_node('food:smoker_on', { --Just a change in textures.
	description = 'Smoker',
	drawtype = 'mesh',
	mesh = 'food_smoker.obj',
	tiles = {name='food_smoker_on.png'},
	groups = {choppy=2, dig_immediate=2, not_in_creative_inventory=1},
	paramtype = 'light',
	paramtype2 = 'facedir',
	selection_box = {
		type = 'fixed',
		fixed = {-.5, -.5, -.4, .5, .5, .4},
		},
	collision_box = {
		type = 'fixed',
		fixed = {-.5, -.5, -.4, .5, .5, .4},
		},
})

--Craft Recipes
minetest.register_craft({
		output = 'food:smoker',
		recipe = {
			{'group:wood', 'group:wood', 'group:wood'},
			{'group:wood', 'farming:cotton', 'group:wood'},
			{'group:wood', 'group:wood', 'default:furnace'},
			}
})

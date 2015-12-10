minetest.register_abm({ --Brings animals into traps
	nodenames = {'food:snare_baited'},
	interval = 5,
	chance = 2,
	action = function(pos, node)
		local grass = minetest.find_node_near(pos, 2, 'group:flora')
		if grass == nil then
		end
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		for i=1, inv:get_size('bait') do
			local stack = inv:get_stack('bait', i)
			local bait = stack:get_name()
			if minetest.get_node_group(bait, 'flora') > 0 then
				meta:set_string('formspec', trap_game)
				meta:set_string('infotext', 'Simple Snare with Game')
				minetest.swap_node(pos, {name = 'food:snare_game'})
				--Randomly select something to populate the trap with.
				local critter = math.random(0,2)
					if critter == 0 then
						inv:set_stack('game', 1, 'mobs:bunny')
					end
					if critter == 1 then
						inv:set_stack('game', 1, 'mobs:chicken')
					end
					if critter == 2 then
						inv:set_stack('game', 1, 'mobs:rat')
					end
				return
			elseif bait == 'default:gold_lump' then --if trap contains gold capture Goblin.
				meta:set_string('formspec', trap_game)
				meta:set_string('infotext', 'Simple Snare with Game')
				minetest.swap_node(pos, {name = 'food:snare_game'})
				inv:set_stack('game', 1, 'goblins:goblin_king')
				return
			elseif minetest.get_node_group(bait, 'meat') > 0 then
				meta:set_string('formspec', trap_game)
				meta:set_string('infotext', 'Simple Snare with Game')
				minetest.swap_node(pos, {name = 'food:snare_game'})
				inv:set_stack('game', 1, 'mobs:pumba')
				return
			end
		end
	end,
})

minetest.register_abm({ --steals capture game from snares and leaves them needing to be reset.
	nodenames = {'food:snare_game'},
	interval = 60,
	chance = 10,
	action = function(pos, node)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		meta:set_string('formspec', trap_raided)
		meta:set_string('infotext', 'Raided Simple Snare')
		minetest.swap_node(pos, {name = 'food:snare_raided'})
		inv:set_stack('bait', 1,'')
		inv:set_stack('game', 1,'')
	end
})

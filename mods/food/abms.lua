minetest.register_abm({ --Brings animals into traps
	nodenames = {'food:snare_baited'},
	neighbors = {'group:grass'},
	interval = 5,
	chance = 2,
	action = function(pos, node)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		for i=1, inv:get_size('bait') do
			local stack = inv:get_stack('bait', i)
			local bait = stack:get_name()
			if minetest.get_node_group(bait, 'meat') > 0 then
				meta:set_string('formspec', trap_game)
				meta:set_string('infotext', 'Simple Snare with Game')
				minetest.swap_node(pos, {name = 'food:snare_game'})
				--Randomly select something to populate the trap with.
				local critter = math.random(0,4)
					if critter == 0 then
						inv:set_stack('game', 1, 'default:apple')
					end
					if critter == 1 then
						inv:set_stack('game', 1, 'default:dirt')
					end
					if critter == 2 then
						inv:set_stack('game', 1, 'default:tree')
					end
					if critter == 3 then
						inv:set_stack('game', 1, 'default:cobble')
					end
					if critter == 4 then
						inv:set_stack('game', 1, 'food:snare')
					end
				return
			end
		end
--		if trap contains gold capture Goblin. Should be interesting to see how this pans out. Won't mention it in release notes, an easter egg of sorts. :D
	end,
})

minetest.register_abm({ --steals capture game from snares and leaves them needing to be reset.
	nodenames = {'food:snare_game'},
	interval = 15,
	chance = 3,
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

minetest.register_abm({ --Brings animals into traps, currently just changes node.
	nodenames = {'food:snare_baited'},
	interval = 5,
	chance = 2,
	action = function(pos, node)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		--This checks what type of bait was used, which effects the game.
		--Code to use I think "minetest.get_node_group(name, group)"
		if inv:contains_item('bait', 'food:steak_raw') then --needs to be changed to support groups.
			meta:set_string('formspec', trap_game)
			meta:set_string('infotext', 'Simple Snare with Game')
			minetest.swap_node(pos, {name = 'food:snare_game'})
			--Randomly select some animal to populate the trap with.
			--local critter = math.random(0,4)
			--	if critter == 0 then
					inv:set_stack('game', 1,'default:apple')
			--	end
			return
		end
	end,
})

minetest.register_abm({ --steals capture game from snares and leaves them needing to be reset.
	nodenames = {'food:snare_game'},
	interval = 60,
	chance = 20,
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

local grass_table = {-- mature, child
{'default:grass_5', 'default:grass_4'},
{'default:grass_4', 'default:grass_3'},
{'default:grass_3', 'default:grass_2'},
{'default:grass_2', 'default:grass_1'},
{'default:grass_1', 'air'}
}

minetest.register_abm({ --grass spreading
	nodenames = {'group:soil'},
	neighbors = {'group:grass'},
	interval = 20,
	chance = 40,
	action = function(pos, node)
		local node_above = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
		if node_above.name == 'air' then
			minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name = 'default:grass_1'})
		end
	end
})

minetest.register_abm({ --grass growing
	nodenames = {'group:grass'},
	interval = 40,
	chance = 20,
	action = function(pos, node)
		for i in ipairs (grass_table) do
		local mature = grass_table[i][1]
		local child = grass_table[i][2]
			if node.name == child then
				minetest.set_node(pos, {name=mature})
			end
		end
	end
})

minetest.register_abm({ --Jungle grass growing
	nodenames = {'default:grass_5'},
	interval = 60,
	chance = 60,
	action = function(pos, node)
		minetest.set_node(pos, {name='default:junglegrass'})
	end
})

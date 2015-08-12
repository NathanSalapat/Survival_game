minetest.register_abm({
	nodenames = {"default:sand"},
	neighbors = {"group:water"},
	interval = 30,
	chance = 75,
	action = function(pos, node)
		local name = minetest.get_node(pos).name
		if name == "default:sand" then
			if minetest.find_node_near(pos, 3, {"group:water"}) == nil then
				return
			end
		minetest.set_node(pos, {name='survival:sand_with_food'})
		end
	end,
})

minetest.register_abm({
	nodenames = {"group:leaves"},
	neighbors = {"group:leafdecay"},
	interval = 30,
	chance = 75,
	action = function(pos, node)
		local name = minetest.get_node(pos).name
		if name == "default:leaves" then
			if minetest.find_node_near(pos, 3, {"group:tree"}) == nil then
				return
			elseif minetest.find_node_near(pos, 10, {'survival:bird_nest'}) == nil then
				return
			end
		minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name='survival:bird_nest'})
		end
	end,
})

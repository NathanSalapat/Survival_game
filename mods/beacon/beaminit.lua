--Blue Beam
minetest.register_node("beacon:bluebase", {
	visual_scale = 1.0,
	drawtype = "plantlike",
	tiles = {"bluebase.png"},
	paramtype = "light",
	walkable = false,
	diggable = false,
	light_source = 13,
	groups = {not_in_creative_inventory=1}
})

minetest.register_node("beacon:bluebeam", {
	visual_scale = 1.0,
	drawtype = "plantlike",
	tiles = {"bluebeam.png"},
	paramtype = "light",
	walkable = false,
	diggable = false,
	light_source = 50,
	groups = {not_in_creative_inventory=1}
})

minetest.register_abm({
	nodenames = {"beacon:bluebase"}, --makes small particles emanate from the beginning of a beam
	interval = 1,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner(
			32, --amount
			4, --time
			{x=pos.x-0.25, y=pos.y-0.25, z=pos.z-0.25}, --minpos
			{x=pos.x+0.25, y=pos.y+0.25, z=pos.z+0.25}, --maxpos
			{x=-0.8, y=-0.8, z=-0.8}, --minvel
			{x=0.8, y=0.8, z=0.8}, --maxvel
			{x=0,y=0,z=0}, --minacc
			{x=0,y=0,z=0}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"blueparticle.png" --texture
		)
	end,
})

--Red Beam
minetest.register_node("beacon:redbase", {
	visual_scale = 1.0,
	drawtype = "plantlike",
	tiles = {"redbase.png"},
	paramtype = "light",
	walkable = false,
	diggable = false,
	light_source = 13,
	groups = {not_in_creative_inventory=1}
})

minetest.register_node("beacon:redbeam", {
	visual_scale = 1.0,
	drawtype = "plantlike",
	tiles = {"redbeam.png"},
	paramtype = "light",
	walkable = false,
	diggable = false,
	light_source = 50,
	groups = {not_in_creative_inventory=1}
})

minetest.register_abm({
	nodenames = {"beacon:redbase"}, --makes small particles emanate from the beginning of a beam
	interval = 1,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner(
			32, --amount
			4, --time
			{x=pos.x-0.25, y=pos.y-0.25, z=pos.z-0.25}, --minpos
			{x=pos.x+0.25, y=pos.y+0.25, z=pos.z+0.25}, --maxpos
			{x=-0.8, y=-0.8, z=-0.8}, --minvel
			{x=0.8, y=0.8, z=0.8}, --maxvel
			{x=0,y=0,z=0}, --minacc
			{x=0,y=0,z=0}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"redparticle.png" --texture
		)
	end,
})

--Green Beam
minetest.register_node("beacon:greenbase", {
	visual_scale = 1.0,
	drawtype = "plantlike",
	tiles = {"greenbase.png"},
	paramtype = "light",
	walkable = false,
	diggable = false,
	light_source = 13,
	groups = {not_in_creative_inventory=1}
})

minetest.register_node("beacon:greenbeam", {
	visual_scale = 1.0,
	drawtype = "plantlike",
	tiles = {"greenbeam.png"},
	paramtype = "light",
	walkable = false,
	diggable = false,
	light_source = 50,
	groups = {not_in_creative_inventory=1}
})

minetest.register_abm({
	nodenames = {"beacon:greenbase"}, --makes small particles emanate from the beginning of a beam
	interval = 1,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner(
			32, --amount
			4, --time
			{x=pos.x-0.25, y=pos.y-0.25, z=pos.z-0.25}, --minpos
			{x=pos.x+0.25, y=pos.y+0.25, z=pos.z+0.25}, --maxpos
			{x=-0.8, y=-0.8, z=-0.8}, --minvel
			{x=0.8, y=0.8, z=0.8}, --maxvel
			{x=0,y=0,z=0}, --minacc
			{x=0,y=0,z=0}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"greenparticle.png" --texture
		)
	end,
})

--Green Beam
minetest.register_node("beacon:purplebase", {
	visual_scale = 1.0,
	drawtype = "plantlike",
	tiles = {"purplebase.png"},
	paramtype = "light",
	walkable = false,
	diggable = false,
	light_source = 13,
	groups = {not_in_creative_inventory=1}
})

minetest.register_node("beacon:purplebeam", {
	visual_scale = 1.0,
	drawtype = "plantlike",
	tiles = {"purplebeam.png"},
	paramtype = "light",
	walkable = false,
	diggable = false,
	light_source = 50,
	groups = {not_in_creative_inventory=1}
})

minetest.register_abm({
	nodenames = {"beacon:purplebase"}, --makes small particles emanate from the beginning of a beam
	interval = 1,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner( --I actually borrowed this code from the nether mod
			32, --amount
			4, --time
			{x=pos.x-0.25, y=pos.y-0.25, z=pos.z-0.25}, --minpos
			{x=pos.x+0.25, y=pos.y+0.25, z=pos.z+0.25}, --maxpos
			{x=-0.8, y=-0.8, z=-0.8}, --minvel
			{x=0.8, y=0.8, z=0.8}, --maxvel
			{x=0,y=0,z=0}, --minacc
			{x=0,y=0,z=0}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"purpleparticle.png" --texture
		)
	end,
})
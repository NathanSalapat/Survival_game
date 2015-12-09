--please view and edit with Notepad++
--Beacons v1.1 for minetest

--load other scripts
dofile(minetest.get_modpath("beacon").."/beaminit.lua")
dofile(minetest.get_modpath("beacon").."/beamgen.lua")
dofile(minetest.get_modpath("beacon").."/crafts.lua")

--code for "unactivated beacon"
minetest.register_node("beacon:empty", {
	description = "Unactivated Beacon",
	tiles = {"emptybeacon.png"},
	light_source = 3,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	drop = "beacon:empty",
})

--code for "Main blue source cube"
minetest.register_node("beacon:blue", {
	description = "Blue Beacon",
	tiles = {"bluebeacon.png"},
	light_source = 13,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	drop = "beacon:blue",
	on_destruct = function(pos) --remove the beam above a source when source is removed
		for i=1,180 do
			minetest.remove_node({x=pos.x, y=pos.y+i, z=pos.z}) --thanks Morn76 for this bit of code!
		end
	end
})

--code for "Main red source cube"
minetest.register_node("beacon:red", {
	description = "Red Beacon",
	tiles = {"redbeacon.png"},
	light_source = 13,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	drop = "beacon:red",
	on_destruct = function(pos) --remove the beam above a source when source is removed
		for i=1,180 do
			minetest.remove_node({x=pos.x, y=pos.y+i, z=pos.z})
		end
	end,
})

--code for "Main green source cube"
minetest.register_node("beacon:green", {
	description = "Green Beacon",
	tiles = {"greenbeacon.png"},
	light_source = 13,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	drop = "beacon:green",
	on_destruct = function(pos) --remove the beam above a source when source is removed
		for i=1,180 do
			minetest.remove_node({x=pos.x, y=pos.y+i, z=pos.z})
		end
	end,
})

--code for "Main purple source cube"
minetest.register_node("beacon:purple", {
	description = "Violet Beacon",
	tiles = {"purplebeacon.png"},
	light_source = 13,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	drop = "beacon:purple",
	on_destruct = function(pos) --remove the beam above a source when source is removed
		for i=1,180 do
			minetest.remove_node({x=pos.x, y=pos.y+i, z=pos.z})
		end
	end,
})

print("[OK] Beacons")
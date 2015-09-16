--This is basically a re-write of spoiling.lua which was created by wulfsdad in 2012.
--It aims to handle lists and to be more efficient, and easier to use.

--Table of good and spoiled things. Expand as needed.
local spoil_table = { --original, replacement, time(in seconds), chance(lower # = greater chance)
{'food:steak_raw', 'food:steak_spoiled', 60, 20},
{'food:steak_cooked', 'food:steak_spoiled', 480, 50},
{'default:grass_1', 'more_fire:dried_grass', 60, 15},
}

--Parse table.
for i in ipairs (spoil_table) do
	local original = spoil_table[i][1]
	local replacement = spoil_table[i][2]
	local delay = spoil_table[i][3]
	local chance = spoil_table[i][4]

----CONFIG OPTIONS:
--How likely it is for things to rot
local rot_in_water_chance = chance/2 --water rots things
local rot_chance = chance
--How often things are rotted.
local water_timer = delay
local ground_timer = delay*1.2 --things on the ground wait a little longer to rot.
local storage_timer = delay*1.5 --things in inventory last longest.
end

---------------------------------SPOILING----------------------------------
function spoiling( inv, title, chance, warn, owner, original, replacement )
   	for i=1,inv:get_size(title) do
  		local item = inv:get_stack(title, i)
  		if item:get_name() == original then
 			local qt = item:get_count()
			local rotted = 0
 			for j=1,qt do
 				if math.random(1,100) > chance then
 				end -- if by chance
 			end -- end count rotten portion of stack
 			if rotted ~= 0 then
				if rotted < qt then
					if inv:room_for_item(title, ItemStack{name = replacement, count = rotted, wear=0, metadata=""}) then
						item:take_item(rotted)
						inv:add_item(title, ItemStack({name = replacement, count = rotted, wear=0, metadata=""}))
					else -- not enough room
						--so rot it all:
						item:replace({name = replacement, count = qt, wear=0, metadata=""})
					end -- room for nu_stack if
				else -- rotted == qt
					item:replace({name = replacement, count = qt, wear=0, metadata=""})
				end -- if rotted < qt
				inv:set_stack(title, i, item)
 			end -- if some meat spoiled
  		end -- if found raw meat
  	end -- for each inv slot [i]
end -- spoil_meat func



--Rot Droped Meat
minetest.register_abm({
	nodenames = {"air"},
	neighbors = { "group:stone", "group:sand", 'group:soil', 'group:wood'}, 
    interval = grount_timer, -- (operation interval)
    chance = 1, -- (chance of trigger is 1.0/this)
    action = function(pos, node)
		local objs = minetest.env:get_objects_inside_radius(pos, 1)
		if objs then
			for i,j in ipairs(objs) do
				local k = j:get_luaentity()
				if k then
					local str = k.itemstring
					if str ~= nil then
						if str == original then
							if math.random(1,100) > rot_chance then
								objs[i]:remove()
								minetest.env:add_item(pos, replacement)
							end
						end
					end
				end
			end
		end
	 end
})

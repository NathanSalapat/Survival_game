farming.registered_plants = {}

-- Boilerplate to support localized strings if intllib mod is installed.
if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	farming.S = intllib.Getter(minetest.get_current_modname())
else
	farming.S = function ( s ) return s end
end

function farming.add_plant(full_grown, names, interval, chance, hardy, height)
	minetest.register_abm({
		nodenames = names,
		interval = interval,
		chance = chance,
		action = function(pos, node)
			pos.y = pos.y-1
			if minetest.get_node(pos).name ~= "farming:soil_wet" and hardy == nil then
				return
			end
			pos.y = pos.y+1
			if not minetest.get_node_light(pos) then
				return
			end
			if minetest.get_node_light(pos) < 8 then
				return
			end
			local step = nil
			for i,name in ipairs(names) do
				if name == node.name then
					step = i
					break
				end
			end
			if step == nil then
				return
			end
			local new_node = {name=names[step+1]}
			if new_node.name == nil then
				new_node.name = full_grown
			end
			minetest.set_node(pos, new_node)
			if height and height >= 2 and step >= 3 then
				pos.y = pos.y+1
				minetest.set_node(pos, {name=new_node.name.."b"})
				if height == 3 and step >= 4 then --corn
					pos.y = pos.y+1
					minetest.set_node(pos, {name=new_node.name.."c"})
				end
			end
		end
	})

	table.insert(farming.registered_plants, {
		full_grown = full_grown,
		names = names,
		interval = interval,
		chance = chance,
		height = height
	})
end

function farming.generate_tree(pos, trunk, leaves, underground, replacements)
	pos.y = pos.y-1
	local nodename = minetest.get_node(pos).name
	local ret = true
	for _,name in ipairs(underground) do
		if nodename == name then
			ret = false
			break
		end
	end
	pos.y = pos.y+1
	if not minetest.get_node_light(pos) then
		return
	end
	if ret or minetest.get_node_light(pos) < 8 then
		return
	end
	
	local node = {name = ""}
	for dy=1,4 do
		pos.y = pos.y+dy
		if minetest.get_node(pos).name ~= "air" then
			return
		end
		pos.y = pos.y-dy
	end
	node.name = trunk
	for dy=0,4 do
		pos.y = pos.y+dy
		minetest.set_node(pos, node)
		pos.y = pos.y-dy
	end
	
	if not replacements then
		replacements = {}
	end
	
	node.name = leaves
	pos.y = pos.y+3
	for dx=-2,2 do
		for dz=-2,2 do
			for dy=0,3 do
				pos.x = pos.x+dx
				pos.y = pos.y+dy
				pos.z = pos.z+dz
				
				if dx == 0 and dz == 0 and dy==3 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 4 then
						minetest.set_node(pos, node)
						for name,rarity in pairs(replacements) do
							if math.random(1, rarity) == 1 then
								minetest.set_node(pos, {name=name})
							end
						end
					end
				elseif dx == 0 and dz == 0 and dy==4 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 4 then
						minetest.set_node(pos, node)
						for name,rarity in pairs(replacements) do
							if math.random(1, rarity) == 1 then
								minetest.set_node(pos, {name=name})
							end
						end
					end
				elseif math.abs(dx) ~= 2 and math.abs(dz) ~= 2 then
					if minetest.get_node(pos).name == "air" then
						minetest.set_node(pos, node)
						for name,rarity in pairs(replacements) do
							if math.random(1, rarity) == 1 then
								minetest.set_node(pos, {name=name})
							end
						end
					end
				else
					if math.abs(dx) ~= 2 or math.abs(dz) ~= 2 then
						if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 4 then
							minetest.set_node(pos, node)
							for name,rarity in pairs(replacements) do
								if math.random(1, rarity) == 1 then
								minetest.set_node(pos, {name=name})
								end
							end
						end
					end
				end
				
				pos.x = pos.x-dx
				pos.y = pos.y-dy
				pos.z = pos.z-dz
			end
		end
	end
end

farming.seeds = {
	["farming:pumpkin_seed"]=60,
	["farming_plus:strawberry_seed"]=30,
	["farming_plus:rhubarb_seed"]=30,
	["farming_plus:potatoe_seed"]=30,
	["farming_plus:tomato_seed"]=30,
	["farming_plus:orange_seed"]=30,
	["farming_plus:carrot_seed"]=30,
}


-- ========= GENERATE PLANTS IN THE MAP =========

dofile(minetest.get_modpath("farming_plus").."/good_ground.lua")

minetest.register_on_generated(function(minp, maxp, seed)
        if maxp.y >= 2 and minp.y <= 0 then
                -- Generate plants (code from flowers)
                local perlin1 = minetest.get_perlin(974, 3, 0.6, 100)
                -- Assume X and Z lengths are equal
                local divlen = 16
                local divs = (maxp.x-minp.x)/divlen+1;
                for divx=0,divs-1 do
                for divz=0,divs-1 do
                        local x0 = minp.x + math.floor((divx+0)*divlen)
                        local z0 = minp.z + math.floor((divz+0)*divlen)
                        local x1 = minp.x + math.floor((divx+1)*divlen)
                        local z1 = minp.z + math.floor((divz+1)*divlen)
                        -- Determine flowers amount from perlin noise
                        local grass_amount = math.floor(perlin1:get2d({x=x0, y=z0}) ^ 3 * 9)
                        -- Find random positions for flowers based on this random
                        local pr = PseudoRandom(seed+456)
                        for i=0,grass_amount do
                                local x = pr:next(x0, x1)
                                local z = pr:next(z0, z1)
                                -- Find ground level (0...15)
                                local ground_y = nil
                                for y=30,0,-1 do
                                        if minetest.get_node({x=x,y=y,z=z}).name ~= "air" then
                                                ground_y = y
                                                break
                                        end
                                end
                                
                                if ground_y then
                                        local p = {x=x,y=ground_y+1,z=z}
                                        local nn = minetest.get_node(p).name
                                        -- Check if the node can be replaced
                                        if minetest.registered_nodes[nn] and
                                                minetest.registered_nodes[nn].buildable_to then
                                                nn = minetest.get_node({x=x,y=ground_y,z=z}).name
                                                --if nn == "default:dirt_with_grass" then
						for i = 1, #farming.good_ground do
							if nn == farming.good_ground[i] then
                                                  	      --local plant_choice = pr:next(1, #farming.registered_plants)
                                                	        local plant_choice = math.floor(perlin1:get2d({x=x,y=z})*(#farming.registered_plants))
					     		        local plant = farming.registered_plants[plant_choice]
                                                        	if plant then
                                                                	minetest.set_node(p, {name=plant.full_grown})
									if plant.height and plant.height >= 2 then
										p.y = p.y+1
										minetest.set_node(p, {name=plant.full_grown.."b"})
										if plant.height == 3 then
											p.y = p.y+1
											minetest.set_node(p, {name=plant.full_grown.."c"})
										end
									end
                                                        	end
								break
							end
                                                end
                                        end
                                end
                                
                        end
                end
                end
        end
end)

function farming.place_seed(itemstack, placer, pointed_thing, plantname)

	-- Call on_rightclick if the pointed node defines it
	if pointed_thing.type == "node" and placer and
		not placer:get_player_control().sneak then
		local n = minetest.get_node(pointed_thing.under)
		local nn = n.name
		if minetest.registered_nodes[nn] and minetest.registered_nodes[nn].on_rightclick then
			return minetest.registered_nodes[nn].on_rightclick(pointed_thing.under, n,
			placer, itemstack, pointed_thing) or itemstack, false
		end
	end

	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

	local under = minetest.get_node(pt.under)
	local above = minetest.get_node(pt.above)

	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end

	-- check if pointing at the top of the node
	if pt.above.y ~= pt.under.y+1 then
		return
	end

	-- check if you can replace the node above the pointed node
	if not minetest.registered_nodes[above.name].buildable_to then
		return
	end

	-- check if pointing at soil
	if minetest.get_item_group(under.name, "soil") < 2 then
		return
	end

	-- add the node and remove 1 item from the itemstack
	minetest.add_node(pt.above, {name=plantname, param2 = 1})
	if not minetest.setting_getbool("creative_mode") then
		itemstack:take_item()
	end
	return itemstack
end

-- Spreading behavior for plants, inspired by raspberry spreading in Docfarming
-- code modeled after flowers mod spreading
minetest.register_abm({
	nodenames = {"group:spreading"},
	interval = 50,
	chance = 10,
	action = function(pos, node)
		local pos0 = {x=pos.x-1,y=pos.y-2,z=pos.z-1}
		local pos1 = {x=pos.x+1,y=pos.y+1,z=pos.z+1}
		local spot = minetest.find_nodes_in_area(pos0, pos1, "group:soil")
		if #spot > 0 then
			spot = spot[math.random(#spot)]
			spot.y = spot.y+1
			local mark = minetest.get_node(spot).name
			if minetest.registered_nodes[mark] then
				if minetest.registered_nodes[mark].buildable_to and mark ~= "default:water_source" then
					local data = string.split(node.name, ":", 2)
					local data2 = string.split(data[2], "_", 2)
					local start = {name = data[1]..":"..data2[1].."_1"}
					minetest.set_node(spot, start)
				end
			end
		end
	end,
})

-- ========= ALIASES FOR FARMING MOD BY SAPIER =========
-- potatoe -> potatoe
minetest.register_alias("farming:potatoe_node", "farming_plus:potatoe")
--minetest.register_alias("farming:potatoe", "farming:potatoe_item") cant do this
minetest.register_alias("farming:potatoe_straw", "farming_plus:potatoe")
minetest.register_alias("farming:seed_potatoe", "farming_plus:potatoe_seed")
for lvl = 1, 6, 1 do
	minetest.register_entity(":farming:potatoe_lvl"..lvl, {
		on_activate = function(self, staticdata)
			minetest.set_node(self.object:getpos(), {name="farming_plus:potatoe_1"})
		end
	})
end


minetest.register_alias("farming:cotton", "farming:cotton_3")
minetest.register_alias("farming:wheat_harvested", "farming:wheat")
minetest.register_alias("farming:dough", "farming:flour")
minetest.register_abm({
	nodenames = {"farming:wheat"},
	interval = 1,
	chance = 1,
	action = function(pos)
		minetest.set_node(pos, {name="farming:wheat_8"})
	end,
})

-- ========= STRAWBERRIES =========
dofile(minetest.get_modpath("farming_plus").."/strawberries.lua")

-- ========= RHUBARB =========
dofile(minetest.get_modpath("farming_plus").."/rhubarb.lua")

-- ========= POTATOES =========
dofile(minetest.get_modpath("farming_plus").."/potatoes.lua")

-- ========= TOMATOES =========
dofile(minetest.get_modpath("farming_plus").."/tomatoes.lua")

-- ========= ORANGES =========
dofile(minetest.get_modpath("farming_plus").."/oranges.lua")

-- ========= BANANAS =========
dofile(minetest.get_modpath("farming_plus").."/bananas.lua")

-- ========= CARROTS =========
dofile(minetest.get_modpath("farming_plus").."/carrots.lua")

-- ========= COCOA =========
dofile(minetest.get_modpath("farming_plus").."/cocoa.lua")

-- ========= PUMPKIN =========
dofile(minetest.get_modpath("farming_plus").."/pumpkin.lua")

-- ========= WEED =========
dofile(minetest.get_modpath("farming_plus").."/weed.lua")

-- ========= CUCUMBER =========
dofile(minetest.get_modpath("farming_plus").."/cucumber.lua")

-- ========= CORN =========
dofile(minetest.get_modpath("farming_plus").."/corn.lua")

-- ========= MELON =========
dofile(minetest.get_modpath("farming_plus").."/melon.lua")

-- ========= PEACH =========
dofile(minetest.get_modpath("farming_plus").."/peaches.lua")

-- ========= RASPBERRY =========
dofile(minetest.get_modpath("farming_plus").."/raspberries.lua")

-- ========= LEMON =========
dofile(minetest.get_modpath("farming_plus").."/lemons.lua")

-- ========= WALNUT =========
dofile(minetest.get_modpath("farming_plus").."/walnut.lua")

-- ========= COFFEE =========
dofile(minetest.get_modpath("farming_plus").."/coffee.lua")

-- ========= DOCGRASS =========
dofile(minetest.get_modpath("farming_plus").."/docgrass.lua")



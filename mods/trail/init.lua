-- This is a fork of desire path mod by Casimir (https://forum.minetest.net/viewtopic.php?id=3390).
-- Trail mod 0.2.1 by paramat.
-- For latest stable Minetest and back to 0.4.4.
-- Depends default.
-- Licenses: Code CC BY-SA. Textures CC BY-SA. Some textures are edited Minetest default textures.
-- The water sounds are from the ambience mod by Neuromancer (https://forum.minetest.net/viewtopic.php?id=2807),
-- and are by Robinhood76 (http://www.freesound.org/people/Robinhood76/sounds/79657/) license CC BY-NC.

-- Some small updates and changes by Nathan Salapat July 2015.
-- Parameters

local FOO = true -- (true/false) Enable footprints.
local FUNCHA = 0.3 -- 0.3 -- Per globalstep chance of running function.
local FOOCHA = .5 -- 1 -- Per player per node chance of footprint.
local TRACHA = 0.091 -- 0.091 -- Chance walked grass is worn and compacted to trail:trail.
local ICECHA = 0.091 -- 0.091 -- Chance walked snow is compacted to snow:ice.

local EROSION = true -- Enable footprint erosion.
local EROINT = 30 -- 71 -- Erosion interval.
local EROCHA = 30 -- 121 -- Erosion 1/x chance.

local REGROW = true -- Enable trail:trail regrowing to default:dirt_with_grass.
local REGINT = 60 -- 73 -- Regrow interval.
local REGCHA = 100 -- 1331 -- Regrow 1/x chance.

local dirt_table = {-- original, walked on
{'default:dirt_with_grass', 'woodsoils:grass_with_leaves_1'},
{'woodsoils:grass_with_leaves_1', 'woodsoils:grass_with_leaves_2'},
{'woodsoils:grass_with_leaves_2', 'woodsoils:dirt_with_leaves_1'},
{'woodsoils:dirt_with_leaves_1', 'default:dirt'},
{'default:dirt', 'trail:dirt_walked'},
{'trail:dirt_walked', 'trail:trail'},
{'default:sand', 'trail:sand_walked'},
{'default:desert_sand', 'trail:desert_sand_walked'}
}

local grasses = {-- original, walked on
{'default:junglegrass', 'default:grass_5'},
{'default:grass_5', 'default:grass_4'},
{'default:grass_4', 'default:grass_3'},
{'default:grass_3', 'default:grass_2'},
{'default:grass_2', 'default:grass_1'},
{'default:grass_1', 'air'}
}

-- Stuff

trail = {}

-- PLayer positions

local player_pos = {}
local player_pos_previous = {}
minetest.register_on_joinplayer(function(player)
	player_pos_previous[player:get_player_name()] = {x=0,y=0,z=0}
end)
minetest.register_on_leaveplayer(function(player)
	player_pos_previous[player:get_player_name()] = nil
end)

-- Nodes

minetest.register_node("trail:trail", {
	tiles = {"trail_trailtop.png", "trail_trailside.png"},
	groups = {crumbly=2, soil=1, not_in_creative_inventory=1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("trail:dirt_walked", {
	tiles = {"trail_dirt_footprint.png", "default_dirt.png"},
	groups = {crumbly=3, soil=1, not_in_creative_inventory=1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("trail:sand_walked", {
	tiles = {"trail_sand_footprint.png", "default_sand.png"},
	groups = {crumbly=3, falling_node=1, not_in_creative_inventory=1},
	drop = "default:sand",
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("trail:desert_sand_walked", {
	tiles = {"trail_desert_sand_footprint.png", "default_desert_sand.png"},
	groups = {sand=1, crumbly=3, falling_node=1, not_in_creative_inventory=1},
	drop = "default:desert_sand",
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("trail:water_source_swam", {
	drawtype = "liquid",
	tiles = {
		{name="trail_water_source_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0}}
	},
	alpha = WATER_ALPHA,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	liquidtype = "source",
	liquid_alternative_flowing = "default:water_flowing",
	liquid_alternative_source = "default:water_source",
	liquid_viscosity = WATER_VISC,
	liquid_renewable = false,
	post_effect_color = {a=64, r=100, g=100, b=200},
	groups = {water=3, liquid=3, puts_out_fire=1, not_in_creative_inventory=1},
	on_construct = function(pos)
		if math.random(1, 2) == 1 then
			minetest.sound_play("trail_water_bubbles", {pos = pos, gain = 0.2})
		end
	end,
})

minetest.register_node("trail:snow_walked", {
	tiles = {"trail_snow_footprint.png", "snow_snow.png"},
	drawtype = "nodebox",
	sunlight_propagates = true,
	paramtype = "light",
	param2 = nil,
	groups = {crumbly=3, melts=3, soil=1, not_in_creative_inventory=1},
	buildable_to = true,
	drop = "snow:snowball",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.35, 0.5}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.35, 0.5}
		},
	},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.3},
	}),
	after_destruct = function(pos, node, digger)
		if node.param2 == 1 then
			local nodename = minetest.env:get_node(pos).name
			if  nodename == "air" or nodename == "default:water_flowing" or nodename == "default:water_source" then
				minetest.env:add_node(pos,{name="snow:moss",param2=1})
			end
		end
		pos.y = pos.y - 1
		if minetest.env:get_node(pos).name == "snow:dirt_with_snow" then
			minetest.env:add_node(pos,{name="default:dirt_with_grass"})
		end
	end,
	on_construct = function(pos, newnode)
		pos.y = pos.y - 1
		local nodename = minetest.env:get_node(pos).name
		if nodename == "default:dirt_with_grass" or nodename == "trail:dirt_with_grass_walked" 
		or nodename == "default:dirt" or nodename == "trail:dirt_walked" then
			minetest.env:add_node(pos,{name="snow:dirt_with_snow"})
		elseif nodename == "air" then
			pos.y = pos.y + 1
			minetest.env:remove_node(pos)
		end
	end,
})

minetest.register_node("trail:snow_block_walked", {
	tiles = {"trail_snow_footprint.png", "snow_snow.png"},
	groups = {crumbly=3, melts=2, falling_node=1, not_in_creative_inventory=1},
	drop = "snow:snow_block",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.3},
	}),
})

minetest.register_node("trail:wheat_walked", {
	description = "Flattened Wheat",
	tiles = {"trail_flat_wheat.png"},
	drawtype = "nodebox",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=3,flammable=2,plant=1,attached_node=1},
	buildable_to = true,
	drop = "",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}
		},
	},
	sounds = default.node_sound_leaves_defaults(),
})

-- Globalstep function

if FOO then
	minetest.register_globalstep(function(dtime)
		if math.random() < FUNCHA then
			local env = minetest.env
			for _,player in ipairs(minetest.get_connected_players()) do
				if math.random() <= FOOCHA then
					local pos = player:getpos()
					player_pos[player:get_player_name()] = {x=math.floor(pos.x+0.5),y=math.floor(pos.y+0.2),z=math.floor(pos.z+0.5)}
					
					local p_ground = {x=math.floor(pos.x+0.5),y=math.floor(pos.y+0.4),z=math.floor(pos.z+0.5)}
					local n_ground  = env:get_node(p_ground).name
					local a_ground = {x=pos.x, y=pos.y, z=pos.z}
					local a_ground_name = env:get_node(a_ground).name
					local p_groundpl = {x=math.floor(pos.x+0.5),y=math.floor(pos.y-0.5),z=math.floor(pos.z+0.5)}
					local p_snow = {x=math.floor(pos.x+0.5),y=math.floor(pos.y+1.2),z=math.floor(pos.z+0.5)}
					local n_snow  = env:get_node(p_snow).name
					local p_snowpl = {x=math.floor(pos.x+0.5),y=math.floor(pos.y+0.5),z=math.floor(pos.z+0.5)}
					local n_snowpl  = env:get_node(p_snowpl).name
					
					if player_pos_previous[player:get_player_name()] == nil then break end
						if player_pos[player:get_player_name()].x ~= player_pos_previous[player:get_player_name()].x
						or player_pos[player:get_player_name()].y < player_pos_previous[player:get_player_name()].y
						or player_pos[player:get_player_name()].z ~= player_pos_previous[player:get_player_name()].z then
						
						if a_ground_name == 'air' then
						
							for i in ipairs (dirt_table) do
								local original = dirt_table[i][1]
								local replacement = dirt_table[i][2]
							
							if n_ground == original then
								env:add_node(p_groundpl,{name=replacement})
								end
							end
						end
							
						if a_ground_name ~= 'air' then
						
							for i in ipairs (grasses) do
								local original1 = grasses[i][1]
								local replacement1 = grasses[i][2]
								
							if a_ground_name == original1 then
								env:add_node(a_ground,{name=replacement1})
								end
							end
						end
						
					player_pos_previous[player:get_player_name()] = {
						x=player_pos[player:get_player_name()].x,
						y=player_pos[player:get_player_name()].y,
						z=player_pos[player:get_player_name()].z
					}
					end
				end
			end
		end
	end
	)
end
-- ABM

if EROSION then
	minetest.register_abm({
		nodenames = {
			'woodsoils:grass_with_leaves_1',
			'woodsoils:grass_with_leaves_2',
			'woodsoils:dirt_with_leaves_1',
			'default:dirt',
			'trail:dirt_walked',
			'trail:sand_walked',
			'trail:desert_sand_walked',
		},
		interval = EROINT,
		chance = EROCHA,
		action = function(pos, node, active_object_count, active_object_count_wider)
			local env = minetest.env
			local nodename = node.name
			for i in ipairs (dirt_table) do
				local original = dirt_table[i][2]
				local replacement = dirt_table[i][1]	
				if nodename == original then
					env:add_node(pos,{name=replacement})
					end
				end
		end
	})
end

if REGROW then
	minetest.register_abm({
		nodenames = {
			"trail:trail",
		},
		interval = REGINT,
		chance = REGCHA,
		action = function(pos, node, active_object_count, active_object_count_wider)
			local env = minetest.env
			env:add_node(pos,{name="default:dirt_with_grass"})
		end
	})
end

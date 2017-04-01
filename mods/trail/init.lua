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
        if nodename == "air" or nodename == "default:water_flowing" or nodename == "default:water_source" then
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

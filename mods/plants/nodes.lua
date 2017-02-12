local bc_col_box_1 = {
      type = 'fixed',
      fixed = {{-.3, -.5, -.3, .3, .0, .3}}
}
local bc_col_box_2 = {
   type = 'fixed',
   fixed = {{-.3, -.5, -.3, .3, .45, .3}}
}
local bc_col_box_3 = {
   type = 'fixed',
   fixed = {{-.3, -.5, -.3, .3, .8, .3}}
}

local barrel_cacti_table = { --number, desc, col_box
   {1, 'Small Barrel Cacti' ,bc_col_box_1},
   {2, 'Medium Barrel Cacti' ,bc_col_box_2},
   {3, 'Large Barrel Cacti' ,bc_col_box_3}
}

for i in ipairs (barrel_cacti_table) do
   local num = barrel_cacti_table[i][1]
   local desc = barrel_cacti_table[i][2]
   local col = barrel_cacti_table[i][3]

minetest.register_node('plants:barrel_cacti_'..num, {
   description = desc,
   drawtype = 'mesh',
   mesh = 'plants_barrel_cacti_'..num..'.obj',
   tiles = {name='plants_barrel_cacti.png'},
   groups = {oddly_breakable_by_hand=3, choppy=1},
   paramtype = 'light',
   paramtype2 = 'facedir',
   selection_box = col,
   collision_box = col,
   after_place_node = function(pos, placer, itemstack)
      local under = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})
      local node = minetest.get_node(pos)
      if under.name == 'default:sand' or under.name == 'default:desert_sand' then
         minetest.set_node(pos, {name = 'plants:barrel_cacti_'..num..'_sp', param2 = node.param2})
      end
   end,
})

minetest.register_node('plants:barrel_cacti_'..num..'_sp', {
   description = desc,
   drawtype = 'mesh',
   mesh = 'plants_barrel_cacti_'..num..'.obj',
   tiles = {name='plants_barrel_cacti.png'},
   drop = 'plants:barrel_cacti_'..num,
   groups = {oddly_breakable_by_hand=3, choppy=1, barrel_cacti=1, not_in_creative_inventory=1},
   paramtype = 'light',
   paramtype2 = 'facedir',
   selection_box = col,
   collision_box = col,
})
end

local pp_col_box_1 = {
   type = 'fixed',
   fixed = {{-.2, -.5, -.2, .2, .0, .2}}
}

local pp_col_box_2 = {
   type = 'fixed',
   fixed = {{-.6, -.5, -.2, .2, .2, .2}}
}

local pp_col_box_3 = {
   type = 'fixed',
   fixed = {{-.6, -.5, -.2, .6, .2, .2}}
}

local pp_col_box_4 = {
   type = 'fixed',
   fixed = {{-.6, -.5, -.2, .6, .45, .2}}
}

local pp_col_box_5 = {
   type = 'fixed',
   fixed = {{-.7, -.5, -.2, .7, .7, .2}}
}

local pp_col_box_6 = {
   type = 'fixed',
   fixed = {{-.7, -.5, -.2, .7, .7, .2}}
}

local pp_col_box_7 = {
   type = 'fixed',
   fixed = {{-.6, -.5, -.2, .6, .9, .2}}
}

local prickly_pear_table = { --number, after_dig, col_box
   {1, 'air', pp_col_box_1},
   {2, 'plants:prickly_pear_1', pp_col_box_2},
   {3, 'plants:prickly_pear_2', pp_col_box_3},
   {4, 'plants:prickly_pear_3', pp_col_box_4},
   {5, 'plants:prickly_pear_4', pp_col_box_5},
   {6, 'plants:prickly_pear_5', pp_col_box_6},
   {7, 'plants:prickly_pear_6', pp_col_box_7},
}

for i in ipairs (prickly_pear_table) do
   local num = prickly_pear_table[i][1]
   local AD = prickly_pear_table[i][2]
   local col = prickly_pear_table[i][3]

   minetest.register_node('plants:prickly_pear_'..num, {
      description = 'Prickly Pear',
      drawtype = 'mesh',
      mesh = 'plants_pp_'..num..'.obj',
      tiles = {name='plants_prickly_pear.png'},
      groups = {not_in_creative_inventory=1, prickly_pear=1},
      paramtype = 'light',
      paramtype2 = 'facedir',
      selection_box = col,
      collision_box = col,
      on_punch = function(pos, node, player, pointed_thing)
         minetest.set_node(pos, {name = AD, param2 = node.param2})
--         player:get_inventory():add_item('main', 'plants:prickly_pear')

         local itemstack = ItemStack('plants:prickly_pear')
   		local inventory = player:get_inventory()
   		if inventory:room_for_item("main", itemstack) then
   			inventory:add_item("main", itemstack)
   		else
   			minetest.item_drop(itemstack, player, pos)
   		end


--        local stack = ItemStack('plants:prickly_pear')
--        local leftover = minetest.add_item('main', stack)
--        if leftover:get_count() > 0 then
--        minetest.add_item (pos, 'plants:prickly_pear '..leftover:get_count())
--        end
      local damage_chance = math.random(1,15)
      if damage_chance == 1 then
         local hp = player:get_hp()
         player:set_hp(hp - 1)
      end
  end
  })

  minetest.register_node('plants:prickly_pear_'..num..'_bloom', {
     description = 'Blooming Prickly Pear',
     drawtype = 'mesh',
     mesh = 'plants_pp_'..num..'.obj',
     tiles = {name='plants_prickly_pear_bloom.png'},
     groups = {not_in_creative_inventory=1, prickly_pear=1},
     paramtype = 'light',
     paramtype2 = 'facedir',
     selection_box = col,
     collision_box = col,
     on_punch = function(pos, node, player, pointed_thing)
       minetest.set_node(pos, {name = AD..'_bloom', param2 = node.param2})
       player:get_inventory():add_item('main', 'plants:prickly_pear') --If inventory is full it should be dropped.
   --       local stack = ItemStack('plants:prickly_pear')
   --       local leftover = minetest.add_item('main', stack)
   --       if leftover:get_count() > 0 then
   --          minetest.add_item (pos, 'plants:prickly_pear '..leftover:get_count())
   --       end
      local damage_chance = math.random(1,15)
      if damage_chance == 1 then
         local hp = player:get_hp()
         player:set_hp(hp - 1)
      end
   end
   })
end

minetest.register_node('plants:prickly_pear', {
   description = 'Prickly Pear Pad',
   drawtype = 'mesh',
   mesh = 'plants_pp_1.obj',
   tiles = {name='plants_prickly_pear.png'},
   groups = {dig_immediate = 3},
   paramtype = 'light',
   paramtype2 = 'facedir',
   selection_box = {
      type = 'fixed',
      fixed = {{-.2, -.5, -.2, .2, .0, .2}}
   },
   collision_box = {
      type = 'fixed',
      fixed = {{-.2, -.5, -.2, .2, .0, .2}} -- left bottom front right top back
   },
   drop = 'plants:prickly_pear',
   after_place_node = function(pos, placer, itemstack)
      local under = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})
      local node = minetest.get_node(pos)
      if under.name == 'default:sand' or under.name == 'default:desert_sand' then
         minetest.set_node(pos, {name = 'plants:prickly_pear_1', param2 = node.param2})
      end
   end,
})

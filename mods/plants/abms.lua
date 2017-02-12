minetest.register_abm{
   nodenames = {"group:barrel_cacti"},
   interval = 30,
   chance = 20,
   action = function(pos)
      local node = minetest.get_node(pos)
      if node.name == 'plants:barrel_cacti_1_sp' then
      minetest.set_node(pos, {name = "plants:barrel_cacti_2_sp", param2 = node.param2})
      end
      if node.name == 'plants:barrel_cacti_2_sp' then
      minetest.set_node(pos, {name = "plants:barrel_cacti_3_sp", param2 = node.param2})
      end
      if node.name == 'plants:barrel_cacti_3_sp' then
         plants.spread('plants:barrel_cacti_1_sp', pos, 'default:desert_sand', 'air')
   end
end,
}

minetest.register_abm{
   nodenames = {"group:prickly_pear"},
   interval = 30,
   chance = 20,
   action = function(pos)
      local node = minetest.get_node(pos)
      if node.name == 'plants:prickly_pear_1' then
      minetest.set_node(pos, {name = "plants:prickly_pear_2", param2 = node.param2})
      end
      if node.name == 'plants:prickly_pear_2' then
      minetest.set_node(pos, {name = "plants:prickly_pear_3", param2 = node.param2})
      end
      if node.name == 'plants:prickly_pear_3' then
      minetest.set_node(pos, {name = "plants:prickly_pear_4", param2 = node.param2})
      end
      if node.name == 'plants:prickly_pear_4' then
      minetest.set_node(pos, {name = "plants:prickly_pear_5", param2 = node.param2})
      end
      if node.name == 'plants:prickly_pear_5' then
      minetest.set_node(pos, {name = "plants:prickly_pear_6", param2 = node.param2})
      end
      if node.name == 'plants:prickly_pear_6' then
      minetest.set_node(pos, {name = "plants:prickly_pear_7", param2 = node.param2})
      end
      if node.name == 'plants:prickly_pear_7' then
         desert_life.spread('plants:prickly_pear_1', pos, 'default:desert_sand', 'air')
      end
   end,
}

minetest.register_abm{
   nodenames = {"group:prickly_pear"},
   interval = 30,
   chance = 20,
   action = function(pos)
      if mymonths.month_counter == 4
      or mymonths.month_counter == 5
      or mymonths.month_counter == 6 then
         local node = minetest.get_node(pos)
         if node.name == 'plants:prickly_pear_1' then
         minetest.set_node(pos, {name = "plants:prickly_pear_1_bloom", param2 = node.param2})
         end
         if node.name == 'plants:prickly_pear_2' then
         minetest.set_node(pos, {name = "plants:prickly_pear_2_bloom", param2 = node.param2})
         end
         if node.name == 'plants:prickly_pear_3' then
         minetest.set_node(pos, {name = "plants:prickly_pear_3_bloom", param2 = node.param2})
         end
         if node.name == 'plants:prickly_pear_4' then
         minetest.set_node(pos, {name = "plants:prickly_pear_4_bloom", param2 = node.param2})
         end
         if node.name == 'plants:prickly_pear_5' then
         minetest.set_node(pos, {name = "plants:prickly_pear_5_bloom", param2 = node.param2})
         end
         if node.name == 'plants:prickly_pear_6' then
         minetest.set_node(pos, {name = "plants:prickly_pear_6_bloom", param2 = node.param2})
         end
         if node.name == 'plants:prickly_pear_7' then
         minetest.set_node(pos, {name = "plants:prickly_pear_7_bloom", param2 = node.param2})
         end
      else
         local node = minetest.get_node(pos)
         if node.name == 'plants:prickly_pear_1_bloom' then
         minetest.set_node(pos, {name = "plants:prickly_pear_1", param2 = node.param2})
         end
         if node.name == 'plants:prickly_pear_2_bloom' then
         minetest.set_node(pos, {name = "plants:prickly_pear_2", param2 = node.param2})
         end
         if node.name == 'plants:prickly_pear_3_bloom' then
         minetest.set_node(pos, {name = "plants:prickly_pear_3", param2 = node.param2})
         end
         if node.name == 'plants:prickly_pear_4_bloom' then
         minetest.set_node(pos, {name = "plants:prickly_pear_4", param2 = node.param2})
         end
         if node.name == 'plants:prickly_pear_5_bloom' then
         minetest.set_node(pos, {name = "plants:prickly_pear_5", param2 = node.param2})
         end
         if node.name == 'plants:prickly_pear_6_bloom' then
         minetest.set_node(pos, {name = "plants:prickly_pear_6", param2 = node.param2})
         end
         if node.name == 'plants:prickly_pear_7_bloom' then
         minetest.set_node(pos, {name = "plants:prickly_pear_7", param2 = node.param2})
         end
      end
   end,
}

minetest.register_abm({ --grass spreading
   nodenames = {'default:dirt_with_grass',
      'woodsoils:grass_with_leaves_1',
      'valleys_mapgen:dirt_sandy_with_grass',
      'valleys_mapgen:dirt_clayey_with_grass'},
   neighbors = {'group:grass'},
   interval = 30,
   chance = 40,
   action = function(pos, node)
      if mymonths.month_counter == 4
      or mymonths.month_counter == 5
      or mymonths.month_counter == 6 then
         local node_above = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
         if node_above.name == 'air' then
            minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name = 'default:grass_1'})
         end
      end
   end
})

local grass_table = {-- mature, child
{'default:grass_5', 'default:grass_4'},
{'default:grass_4', 'default:grass_3'},
{'default:grass_3', 'default:grass_2'},
{'default:grass_2', 'default:grass_1'},
{'default:grass_1', 'air'}
}

minetest.register_abm({ --grass growing
   nodenames = {'group:grass'},
   interval = 60,
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

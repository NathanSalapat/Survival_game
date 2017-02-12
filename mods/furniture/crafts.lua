minetest.register_craft({
   output = 'furniture:loom',
   recipe = {
      {'default:stick', 'default:stick', 'default:stick'},
      {'default:stick', '', 'default:stick'},
      {'stairs:slab_wood', 'stairs:slab_wood', 'stairs:slab_wood'},
   }
})

minetest.register_craft({
   output = 'furniture:spinning_wheel',
   recipe = {
      {'default:stick', '', 'furniture:wheel'},
      {'stairs:slab_wood', 'stairs:slab_wood', 'stairs:slab_wood'},
      {'default:stick', '', 'default:stick'},
   }
})

minetest.register_craft({
   output = 'furniture:wheel',
   recipe = {
      {'default:stick', 'default:stick', 'default:stick'},
      {'default:stick', 'farming:cotton', 'default:stick'},
      {'default:stick', 'default:stick', 'default:stick'},
   }
})

minetest.register_craft({
   output = 'furniture:table',
   recipe = {
      {'group:wood', 'group:wood', 'group:wood'},
      {'default:stick', '', 'default:stick'},
      {'default:stick', '', 'default:stick'}
   }
})

minetest.register_craft({
   output = 'furniture:wall_cabinet',
   recipe = {
      {'group:wood', 'stairs:slab_wood', 'group:wood'},
      {'group:wood', '', 'group:wood'},
      {'group:wood', 'stairs:slab_wood', 'group:wood'}
   }
})

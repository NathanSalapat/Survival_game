minetest.register_tool("3d_armor:shield_wood", {
   description = "Wooden Shield",
   inventory_image = "3d_armor_inv_shield_wood.png",
   groups = {armor_shield=5, armor_heal=0, armor_use=2000},
   wear = 0,
})

minetest.register_craft({
   output = "3d_armor:shield_wood",
   recipe = {
      {'group:wood', 'group:wood', 'group:wood'},
      {'group:wood', 'group:wood', 'group:wood'},
      {"", 'group:wood', ""},
   },
})

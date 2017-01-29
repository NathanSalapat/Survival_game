-- Hacky method used here to control the armor rating. Leather is rated one higher than cloth
-- but because we don't want to do a lot of extra math, we use a base value and then add to that
-- adding one more for leather than we do cloth, so the leather with metal is still stronger.
-- I use the elemental symbols for the metals, just to keep file names a little shorter.

helper_table = {  --  base material, bonus
   {'leather', 2},
--   {'cloth', 1}
}

for i in ipairs (helper_table) do
	local base = helper_table[i][1]
   local bonus = helper_table[i][2]
	local metal = 'Cu'
   local desc = 'Copper'


minetest.register_tool('3d_armor:helmet_'..base..'_'..metal, {
	description = desc..' Helmet',
	inventory_image = '3d_armor_inv_helmet_'..base..'_'..metal..'.png',
	groups = {armor_head=(5+bonus), armor_heal=0, armor_use=3000},
	wear = 0,
})

minetest.register_tool('3d_armor:chestplate_'..base..'_'..metal, {
	description = desc..' Chestplate',
	inventory_image = '3d_armor_inv_chestplate_'..base..'_'..metal..'.png',
	groups = {armor_torso=(10+bonus), armor_heal=0, armor_use=3000},
	wear = 0,
})

minetest.register_tool('3d_armor:leggings_'..base..'_'..metal, {
	description = desc..' Leggings',
	inventory_image = '3d_armor_inv_leggings_'..base..'_'..metal..'.png',
	groups = {armor_legs=(5+bonus), armor_heal=0, armor_use=3000},
	wear = 0,
})

minetest.register_tool('3d_armor:boots_'..base..'_'..metal, {
	description = desc..' Boots',
	inventory_image = '3d_armor_inv_boots_'..base..'_'..metal..'.png',
	groups = {armor_feet=(5+bonus), armor_heal=0, armor_use=3000},
	wear = 0,
})
end

material_table = {
   {'leather', 'copper'},
--   {'cloth', 'copper'}
}

for i in ipairs (material_table) do
	local base = material_table[i][1]
   local metal = material_table[i][2]
	local metalsym = 'Cu'

minetest.register_craft({
	output = '3d_armor:helmet_'..base..'_'..metalsym,
	recipe = {
		{'', 'ores:'..metal..'_sheet', ''},
		{'ores:'..metal..'_sheet', '3d_armor:helmet_'..base, 'ores:'..metal..'_sheet'},
	},
})

minetest.register_craft({
	output = '3d_armor:chestplate_'..base..'_'..metalsym,
	recipe = {
      {'', 'ores:'..metal..'_sheet', ''},
		{'ores:'..metal..'_sheet', '3d_armor:chestplate_'..base, 'ores:'..metal..'_sheet'},
		{'', 'ores:'..metal..'_sheet', ''},
	},
})

minetest.register_craft({
	output = '3d_armor:leggings_'..base..'_'..metalsym,
	recipe = {
		{'ores:'..metal..'_sheet', '3d_armor:leggings_'..base, 'ores:'..metal..'_sheet'},
	},
})

minetest.register_craft({
	output = '3d_armor:boots_'..base..'_'..metalsym,
	recipe = {
		{'ores:'..metal..'_sheet', '3d_armor:boots_'..base, 'ores:'..metal..'_sheet'},
	},
})
end

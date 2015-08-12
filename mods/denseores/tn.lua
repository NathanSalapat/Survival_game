-- Heavy Ore to Dust


local recipes = {
	{"denseores:large_coal_ore",			"technic:coal_dust 4"},
	{"denseores:large_iron_ore",			"technic:wrought_iron_dust 4"},
	{"denseores:large_copper_ore",			"technic:copper_dust 4"},
	{"denseores:large_gold_ore",			"technic:gold_dust 4"},
	{"denseores:large_mese_ore",			"default:mese_crystal 2"},
	{"denseores:large_diamond_ore",			"default:diamond 2"},
-- Light Ore to Dust
	{"denseores:small_coal_lump",			"technic:coal_dust 1"},
	{"denseores:small_iron_lump",			"technic:wrought_iron_dust 1"},
	{"denseores:small_copper_lump",			"technic:copper_dust 1"},
	{"denseores:small_gold_lump",			"technic:gold_dust 1"},
}

if minetest.get_modpath("moreores") then
	table.insert(recipes, {"denseores:large_mithril_ore",		"technic:mithril_dust 4"})
	table.insert(recipes, {"denseores:large_tin_ore",			"technic:tin_dust 4"})
	table.insert(recipes, {"denseores:large_silver_ore",		"technic:silver_dust 4"})

	table.insert(recipes, {"denseores:small_mithril_lump",	"technic:mithril_dust 1"})
	table.insert(recipes, {"denseores:small_tin_lump",		"technic:tin_dust 1"})
	table.insert(recipes, {"denseores:small_silver_lump",		"technic:silver_dust 1"})
end


for _, data in pairs(recipes) do
	technic.register_grinder_recipe({input = {data[1]}, output = data[2]})
end

--[[
function technic.register_recipe(typename, data)
	minetest.after(0.01, register_recipe, grinding, data)
end
--]]



local path = minetest.get_modpath("mobs_monster")

-- Intllib
local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end
mobs.intllib = S

-- Monsters

dofile(path .. "/oerkki.lua")
dofile(path .. "/spider.lua") -- AspireMint

print ("[MOD] Mobs Redo 'Monsters' loaded")

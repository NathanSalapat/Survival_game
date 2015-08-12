local function merge(a, b)
	local c = {}
	for k, v in pairs(a) do
		c[k] = v
	end
	for k, v in pairs(b) do
		c[k] = v
	end
	return c
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

local basic_properties = {
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	node_box = {
		type = "wallmounted",
		wall_top    = {-0.4375, 0.4375, -0.3125, 0.4375, 0.5, 0.3125},
		wall_bottom = {-0.4375, -0.5, -0.3125, 0.4375, -0.4375, 0.3125},
		wall_side   = {-0.5, -0.3125, -0.4375, -0.4375, 0.3125, 0.4375},
	},
	groups = {snappy=1}, --2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
	--sounds = default.node_sound_defaults(),
	on_construct = function(pos)
		--local n = minetest.get_node(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[text;;${text}]")
		meta:set_string("infotext", "\"\"")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
		if minetest.is_protected(pos, sender:get_player_name()) then
			minetest.record_protection_violation(pos, sender:get_player_name())
			return
		end
		local meta = minetest.get_meta(pos)
		if not fields.text then return end
		minetest.log("action", (sender:get_player_name() or "").." wrote \""..fields.text..
				"\" to sign at "..minetest.pos_to_string(pos))
		meta:set_string("text", fields.text)
		meta:set_string("infotext", '"'..fields.text..'"')
	end,
}

local illuminated_props = { light_source = 3 }

local illuminated_properties = merge(basic_properties, illuminated_props)

local colour_list = { "red", "blue", "green", "yellow", }

local i
local colour

for i, colour in ipairs(colour_list) do

minetest.register_alias("hiking_"..colour.."_sign", "hiking:"..colour.."_sign")

minetest.register_node("hiking:"..colour.."_sign", merge(basic_properties, {
	description = firstToUpper(colour).." hiking sign",
	tiles = {"hiking_"..colour.."_sign.png"},
	inventory_image = "hiking_"..colour.."_sign.png",
	wield_image = "hiking_"..colour.."_sign.png",
}))

minetest.register_node("hiking:illuminated_"..colour.."_sign", merge(illuminated_properties, {
	description = "Illuminated "..colour.." hiking sign",
	tiles = {"hiking_"..colour.."_sign.png"},
	inventory_image = "hiking_illuminated_"..colour.."_sign.png",
	wield_image = "hiking_illuminated_"..colour.."_sign.png"
}))

minetest.register_node("hiking:"..colour.."_arrow_right", merge(basic_properties, {
	description = firstToUpper(colour).." right arrow sign",
	tiles = {"hiking_"..colour.."_arrow_right.png"},
	inventory_image = "hiking_"..colour.."_arrow_right.png",
	wield_image = "hiking_"..colour.."_arrow_right.png"
}))

minetest.register_node("hiking:illuminated_"..colour.."_arrow_right", merge(illuminated_properties, {
	description = "Illuminated "..colour.." right arrow sign",
	tiles = {"hiking_"..colour.."_arrow_right.png"},
	inventory_image = "hiking_illuminated_"..colour.."_arrow_right.png",
	wield_image = "hiking_illuminated_"..colour.."_arrow_right.png"
}))

minetest.register_node("hiking:"..colour.."_arrow_left", merge(basic_properties, {
	description = firstToUpper(colour).." left arrow sign",
	tiles = {"hiking_"..colour.."_arrow_left.png"},
	inventory_image = "hiking_"..colour.."_arrow_left.png",
	wield_image = "hiking_"..colour.."_arrow_left.png",
}))

minetest.register_node("hiking:illuminated_"..colour.."_arrow_left", merge(illuminated_properties, {
	description = "Illuminated "..colour.." left arrow sign",
	tiles = {"hiking_"..colour.."_arrow_left.png"},
	inventory_image = "hiking_illuminated_"..colour.."_arrow_left.png",
	wield_image = "hiking_illuminated_"..colour.."_arrow_left.png",
}))

minetest.register_craft({
	output = "hiking:"..colour.."_sign 6",
	recipe = {
		{"dye:white"},
		{"dye:"..colour},
		{"dye:white"}
	}
})

minetest.register_craft({
	output = "hiking:"..colour.."_arrow_right 6",
	recipe = {
		{"hiking:"..colour.."_sign","hiking:"..colour.."_sign","",},
		{"hiking:"..colour.."_sign","hiking:"..colour.."_sign","dye:"..colour,},
		{"hiking:"..colour.."_sign","hiking:"..colour.."_sign","",},
	}
})

minetest.register_craft({
	output = "hiking:"..colour.."_arrow_left 6",
	recipe = {
		{"","hiking:"..colour.."_sign","hiking:"..colour.."_sign",},
		{"dye:"..colour,"hiking:"..colour.."_sign","hiking:"..colour.."_sign",},
		{"","hiking:"..colour.."_sign","hiking:"..colour.."_sign",},
	}
})

minetest.register_craft({
	output = "hiking:"..colour.."_arrow_left",
	recipe = {
		{"dye:"..colour,"hiking:"..colour.."_sign"}
	}
})

minetest.register_craft({
	output = "hiking:illuminated_"..colour.."_sign",
        type = "shapeless",
	recipe = { "default:torch", "hiking:"..colour.."_sign" }
})

minetest.register_craft({
	output = "hiking:illuminated_"..colour.."_arrow_left",
        type = "shapeless",
	recipe = { "default:torch", "hiking:"..colour.."_arrow_left" }
})

minetest.register_craft({
	output = "hiking:illuminated_"..colour.."_arrow_right",
        type = "shapeless",
	recipe = { "default:torch", "hiking:"..colour.."_arrow_right" }
})

end

local hiking_pole_common = {
	groups = {snappy=1, oddly_breakable_by_hand=2, },
	--sounds = default.node_sound_stone_defaults(),
	paramtype = "light",
	sunlight_propagates = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {{-0.03,-0.5,-0.03,0.03,0.5,0.03}},
	},
}
local hiking_pole_bottom = merge(hiking_pole_common, {
	 buildable_to = true,
})
local hiking_pole_middle = merge(hiking_pole_common, {
	 buildable_to = false,
})
local hiking_pole_top = merge(hiking_pole_common, {
	 buildable_to = false,
})

local function mk_hiking_pole(id, name, top_face, moreprops, image)
minetest.register_node("hiking:"..id.."_bottom", merge(merge(hiking_pole_bottom, {
	-- TODO: this should be always on ground
	description = name.." (bottom)",
	tiles = {"hiking_pole_sign_cap.png", "hiking_pole_sign_cap.png", "hiking_pole_sign_bottom_.png", "hiking_pole_sign_bottom_.png", "hiking_pole_sign_bottom_.png", "hiking_pole_sign_bottom_.png", },
	inventory_image = image,
	wield_image = image,

	after_place_node = function(pos, placer, itemstack)
		local node = minetest.env:get_node(pos)
		local p = {x=pos.x, y=pos.y+1, z=pos.z}
		node.name = "hiking:"..id.."_top"
		if minetest.registered_nodes[minetest.env:get_node(p).name].buildable_to  then
			minetest.env:set_node(p, node)
		else
			minetest.env:remove_node(pos)
			return true
		end
	end,

	after_destruct = function(pos, _)
		local p = {x=pos.x, y=pos.y+1, z=pos.z}
		if ( minetest.env:get_node(p).name == "hiking:"..id.."_top" ) then
			minetest.env:remove_node(p)
		end
	end,

}), moreprops))

minetest.register_node("hiking:"..id.."_top", merge(merge(hiking_pole_bottom, {
	-- TODO: one should not build on top of this
	-- TODO: should be always on top of pole_bottom
	description = name.." (top)",
	tiles = {"hiking_pole_sign_cap.png", "hiking_pole_sign_cap.png", top_face, top_face, top_face, top_face, },

	on_dig = function(pos, _, _)
		local p = {x=pos.x, y=pos.y-1, z=pos.z}
		if ( minetest.env:get_node(p).name == "hiking:"..id.."_bottom" ) then
			minetest.env:remove_node(p)
		end
        end,
}), moreprops))
end

local function mk_tall_hiking_pole(id, name, top_face, moreprops, image, height)
local h = math.max(height, 2)
minetest.register_node("hiking:"..id.."_bottom", merge(merge(hiking_pole_bottom, {
	-- TODO: this should be always on ground
	description = name.." (bottom)",
	tiles = {"hiking_pole_sign_cap.png", "hiking_pole_sign_cap.png", "hiking_pole_sign_bottom_.png", "hiking_pole_sign_bottom_.png", "hiking_pole_sign_bottom_.png", "hiking_pole_sign_bottom_.png", },
	inventory_image = image,
	wield_image = image,

	after_place_node = function(pos, placer, itemstack)
		local node = minetest.env:get_node(pos)
		local i
		local p
		for i = 1, h-1 do
			p = {x=pos.x, y=pos.y+i, z=pos.z}
			if not minetest.registered_nodes[minetest.env:get_node(p).name].buildable_to  then
				minetest.env:remove_node(pos)
				return true
			end
		end
		for i = 1, h-2 do
			p = {x=pos.x, y=pos.y+i, z=pos.z}
			node.name = "hiking:"..id.."_middle"
			if minetest.registered_nodes[minetest.env:get_node(p).name].buildable_to  then
				minetest.env:set_node(p, node)
			else
				minetest.env:remove_node(pos)
				return true
			end
		end
		p = {x=pos.x, y=pos.y+h-1, z=pos.z}
		node.name = "hiking:"..id.."_top"
		if minetest.registered_nodes[minetest.env:get_node(p).name].buildable_to  then
			minetest.env:set_node(p, node)
		else
			minetest.env:remove_node(pos)
			return true
		end
	end,

	after_destruct = function(pos, _)
		local i
		local p
		for i = 1, h-1 do
			p = {x=pos.x, y=pos.y+i, z=pos.z}
			if ( minetest.env:get_node(p).name == "hiking:"..id.."_top" or minetest.env:get_node(p).name == "hiking:"..id.."_middle" ) then
				minetest.env:remove_node(p)
			else
				return
			end
		end
	end,

}), moreprops))

minetest.register_node("hiking:"..id.."_middle", merge(merge(hiking_pole_middle, {
	-- TODO: one should not build on top of this
	-- TODO: should be always on top of pole_bottom
	description = name.." (middle)",
	tiles = {"hiking_pole_sign_cap.png", "hiking_pole_sign_cap.png", "hiking_pole_sign_bottom_.png", "hiking_pole_sign_bottom_.png", "hiking_pole_sign_bottom_.png", "hiking_pole_sign_bottom_.png", },

	on_dig = function(pos, _, _)
		local i
		local p
		for i = 1, h-2 do
			p = {x=pos.x, y=pos.y-i, z=pos.z}
			local n = minetest.env:get_node(p).name
			if ( n == "hiking:"..id.."_bottom" ) then
				minetest.env:remove_node(p)
				return
			elseif not ( n == "hiking:"..id.."_middle" ) then
				-- TODO: ERROR!
				return
			end
		end
        end,
}), moreprops))

minetest.register_node("hiking:"..id.."_top", merge(merge(hiking_pole_bottom, {
	-- TODO: one should not build on top of this
	-- TODO: should be always on top of pole_bottom
	description = name.." (top)",
	tiles = {"hiking_pole_sign_cap.png", "hiking_pole_sign_cap.png", top_face, top_face, top_face, top_face, },

	on_dig = function(pos, _, _)
		local i
		local p
		for i = 1, h-1 do
			p = {x=pos.x, y=pos.y-i, z=pos.z}
			local n = minetest.env:get_node(p).name
			if ( n == "hiking:"..id.."_bottom" ) then
				minetest.env:remove_node(p)
				return
			elseif not ( n == "hiking:"..id.."_middle" ) then
				-- TODO: ERROR!
				return
			end
		end
        end,
}), moreprops))
end

local function mk_hiking_pole_coloured(colour)
	mk_hiking_pole(colour.."_pole", "Pole sign "..colour, "hiking_pole_sign_top_"..colour..".png", {}, "hiking_pole_sign_"..colour..".png")
	minetest.register_craft({
		output = "hiking:"..colour.."_pole_bottom",
		recipe = {
			{"hiking:"..colour.."_sign",},
			{"default:stick",},
			{"default:stick",},
		}
	})
	minetest.register_craft({
		output = "hiking:"..colour.."_pole_bottom",
        	type = "shapeless",
		recipe = { "hiking:pole_bottom", "hiking:"..colour.."_sign" }
	})
end

local function mk_hiking_pole_illuminated_coloured(colour)
	mk_hiking_pole("illuminated_"..colour.."_pole", "Illuminated pole sign "..colour, "hiking_pole_sign_top_"..colour..".png", illuminated_props, "hiking_illuminated_pole_sign_"..colour..".png")
	minetest.register_craft({
		output = "hiking:illuminated_"..colour.."_pole_bottom",
        	type = "shapeless",
		recipe = { "default:torch", "hiking:"..colour.."_pole_bottom" }
	})
	minetest.register_craft({
		output = "hiking:illuminated_"..colour.."_pole_bottom",
        	type = "shapeless",
		recipe = { "hiking:pole_bottom", "hiking:illuminated_"..colour.."_sign" }
	})
	minetest.register_craft({
		output = "hiking:illuminated_"..colour.."_pole_bottom",
        	type = "shapeless",
		recipe = { "hiking:illuminated_pole_bottom", "hiking:"..colour.."_sign" }
	})
end

mk_hiking_pole("pole", "Pole sign", "hiking_pole_sign_bottom_.png", {}, "hiking_pole_sign.png")
minetest.register_craft({
	output = "hiking:pole_bottom",
	recipe = {
		{"default:stick",},
		{"default:stick",},
	}
})

mk_tall_hiking_pole("tall_pole", "Tall pole sign", "hiking_pole_sign_bottom_.png", {}, "hiking_tall_pole_sign.png", 3)
minetest.register_craft({
	output = "hiking:tall_pole_bottom",
	recipe = {
		{"default:stick",},
		{"default:stick",},
		{"default:stick",},
	}
})

mk_tall_hiking_pole("very_tall_pole", "Very tall pole sign", "hiking_pole_sign_bottom_.png", {}, "hiking_very_tall_pole_sign.png", 4)
minetest.register_craft({
	output = "hiking:very_tall_pole_bottom",
	recipe = {
		{"default:stick",},
		{"hiking:tall_pole_bottom",},
	}
})

-- TODO: not full height is built
-- TODO: not everything gets removed on digging
mk_tall_hiking_pole("infinite_pole", "Infinite pole sign", "hiking_pole_sign_bottom_.png", {}, "hiking_infinite_pole_sign.png", 1024)

mk_hiking_pole("illuminated_pole", "Illuminated pole sign", "hiking_illuminated_pole_sign_bottom_.png", illuminated_props, "hiking_illuminated_pole_sign.png")
minetest.register_craft({
	output = "hiking:illuminated_pole_bottom",
	type = "shapeless",
	recipe = { "hiking:pole_bottom", "default:torch" }
})

for i, colour in ipairs(colour_list) do
	mk_hiking_pole_coloured(colour)
	mk_hiking_pole_illuminated_coloured(colour)
end

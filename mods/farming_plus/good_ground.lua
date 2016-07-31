-- good_ground to grow on

farming.good_ground = {"default:dirt_with_grass", "default:dirt"}

-- add support for mapgen custom nodes

if minetest.get_modpath("paragenv7") then
	table.insert(farming.good_ground, "paragenv7:grass")
	minetest.override_item("paragenv7:grass", {
		soil = {
			base = "default:dirt",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})
	table.insert(farming.good_ground, "paragenv7:dirt")
	minetest.override_item("paragenv7:dirt", {
		soil = {
			base = "default:dirt",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})
end

if minetest.get_modpath("watershed") then
	table.insert(farming.good_ground, "watershed:grass")
	minetest.override_item("watershed:grass", {
		soil = {
			base = "default:dirt",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})
	table.insert(farming.good_ground, "watershed:dirt")
	minetest.override_item("watershed:dirt", {
		soil = {
			base = "default:dirt",
			dry = "farming:soil",
			wet = "farming:soil_wet"
		}
	})	
end

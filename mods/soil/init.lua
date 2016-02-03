minetest.register_node("soil:dirt", {
	description = "Fertile Soil",
	tiles = {"default_dirt.png"},
	groups = {crumbly=3,soil=1},
	sounds = default.node_sound_dirt_defaults(),
	soil = {
		base = "default:dirt",
		dry = "farming:soil",
		wet = "farming:soil_wet"
	}
})

minetest.register_craft({
	output = 'soil:dirt 4',
	recipe = {
		{'', 'group:soil', ''},
		{'group:soil', 'dryplants:grass', 'group:soil'},
		{'', 'group:soil', ''},
	}
})

minetest.register_craft({
	output = 'beacon:blue',
	recipe = {
		{'', 'dye:blue', ''},
		{'dye:blue', 'beacon:empty', 'dye:blue'},
		{'', 'dye:blue', ''},
	}
})

minetest.register_craft({
	output = 'beacon:empty',
	recipe = {
		{'default:steel_ingot', 'default:glass', 'default:steel_ingot'},
		{'default:mese_crystal_fragment', 'default:torch', 'default:mese_crystal_fragment'},
		{'default:obsidian', 'default:obsidian', 'default:obsidian'},
	}
})

minetest.register_craft({
	output = 'beacon:red',
	recipe = {
		{'', 'dye:red', ''},
		{'dye:red', 'beacon:empty', 'dye:red'},
		{'', 'dye:red', ''},
	}
})

minetest.register_craft({
	output = 'beacon:purple',
	recipe = {
		{'', 'dye:violet', ''}, --geez i almost spelled violet wrong lol
		{'dye:violet', 'beacon:empty', 'dye:violet'},
		{'', 'dye:violet', ''}, --oh yea I havent played minecraft in 2 years, i can feel your judgement right now
	}
})

minetest.register_craft({
	output = 'beacon:green',
	recipe = {
		{'', 'dye:green', ''}, --geez i almost spelled violet wrong lol
		{'dye:green', 'beacon:empty', 'dye:green'},
		{'', 'dye:green', ''}, --oh yea I havent played minecraft in 2 years, i can feel your judgement right now
	}
})


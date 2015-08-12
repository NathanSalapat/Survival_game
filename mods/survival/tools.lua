-- Wooden Machete (This may be removed in the future, not sure how realistic it is.)
minetest.register_tool('survival:machete_wood', {
	description = 'wooden machete',
	inventory_image = 'survival_machete_wood.png',
	tool_capabilities = {
		full_punch_interval = 1.2, --amount of seconds between repeating action.
		max_drop_level = 0, -- not sure what this does.
		groupcaps=  { --how many times the tool can 'attack' nodes of a type.
			crumbly = {times = {[1]=3.00, [2]=1.60, [3]=0.60}, uses=10, maxlevel=1}, --dirt like
			choppy = {times = {[2]=3.00, [3]=1.60}, uses=10, maxlevel=1}, --woody
			snappy = {times = {[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2}, --damage delt to mobs and other players?
	},
})

-- there will be no stone machete, ever.

-- Steel machete
minetest.register_tool('survival:machete_steel', {
	description = 'steel machete',
	inventory_image = 'survival_machete_steel.png',
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level = 1,
		groupcaps = {
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=30, maxlevel=2},
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=20, maxlevel=2},
			snappy={times={[1]=2.50, [2]=1.20, [3]=0.35}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=5} --a sword will do more damage than a machete.
	},
})

-- Bronze Machete
minetest.register_tool('survival:machete_bronze', {
	description = 'bronze machete',
	inventory_image = 'survival_machete_bronze.png',
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level = 1,
		groupcaps = {
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=40, maxlevel=2},
			choppy = {times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=30, maxlevel=2},
			snappy = {times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=5}
	},
})

-- Diamond Machete
minetest.register_tool('survival:machete_diamond', {
	description = 'diamond machete',
	inventory_image = 'survival_machete_diamond.png',
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level = 1,
		groupcaps = {
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=30, maxlevel=3},
			choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=30, maxlevel=2},
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=40, maxlevel=3},
			},
			damage_groups = {fleshy=6},
		}
})

-- Mese Machete
minetest.register_tool('survival:machete_mese', {
	description = 'mese machete',
	inventory_image = 'survival_machete_mese.png',
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level = 3,
		groupcaps = {
			crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=20, maxlevel=3},
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=20, maxlevel=3},
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
			},
			damage_groups = {fleshy=7},
		}
})

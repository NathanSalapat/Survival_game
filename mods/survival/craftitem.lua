minetest.register_craftitem('survival:shell', {
	description = 'old shell',
	inventory_image = 'survival_shell.png',
})

minetest.register_craftitem('survival:bucket_sap', {
	description = 'bucket with sap',
	inventory_image = 'survival_bucket_sap.png',
	stack_max = 1,
})

minetest.register_craftitem('survival:salt_lump', {
	description = 'chunk of salt',
	inventory_image = 'survival_salt_lump.png'
})

minetest.register_craftitem('survival:salt', {
	description = 'salt',
	inventory_image = 'survival_salt.png'
})

minetest.register_craftitem('survival:nesting', {
	description = 'Nesting materials',
	inventory_image = 'survival_nesting.png',
	groups = {kindling=1},
})

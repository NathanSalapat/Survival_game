minetest.register_craftitem("animals:bucket_milk", {
	description = ("Bucket of Milk"),
	inventory_image = "animals_bucket_milk.png",
	stack_max = 1,
	on_use = minetest.item_eat(8, 'bucket:bucket_empty'),
})

minetest.register_craftitem('animals:feather', {
   description = ('Feather'),
   inventory_image = 'animals_feather.png',
})

minetest.register_craftitem('animals:leather', {
   description = ('Leather'),
   inventory_image = 'animals_leather.png',
})

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Store.destroy_all
Item.destroy_all
Category.destroy_all

20.times do
  Store.create!(name: Faker::StarWars.unique.planet,
                address: Faker::Address.street_address,
	              phone: Faker::Number.number(10),
	              hours: Faker::Number.between(8, 80))
end
p "#{Store.count} stores created"

20.times do
  Category.create!(name: Faker::BossaNova.unique.song,
                	 lx: Faker::Number.between(8, 80),
	              	 rx: Faker::Number.between(8, 80),
	              	 ty: Faker::Number.between(8, 80),
								 	 by: Faker::Number.between(8, 80),
								 	 store_id: Store.find(rand(Store.first.id..Store.last.id)).id)
end
p "#{Category.count} categories created"

20.times do
	category = Category.find(rand(Category.first.id..Category.last.id))
  Item.create!(name: Faker::BossaNova.unique.song,
                	 x: Faker::Number.between(8, 80),
	              	 y: Faker::Number.between(8, 80),
								 	 category_id: category.id,
								 	 store_id: category.store_id)
end
p "#{Item.count} items created"

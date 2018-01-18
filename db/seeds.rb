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

		
store = Store.create!(address: "address", phone: "503", name: "Freddies", hours: "10")
p "#{Store.count} store(s) created"

cat = Category.create!(name: "Meats", lx: 0, rx: 4, ty: 5, by: 0, store_id: store.id)
p "#{Category.count} categories(s) created"

item = store.items.create!(name: "apples", x: 2, y: 4, category_id: cat.id, store_id: store.id) # cat.store_id should also work

p "#{Item.count} items(s) created"
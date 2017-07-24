# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## Create addons
add_on = AddOn.create!(name: 'A Great Add On', brand: 'Baskin')
add_on2 = AddOn.create!(name: 'The Best AddOn', brand: 'Carvel')

## Create toppings
add_on.toppings.create!(name: 'Sprinkles', release_month: Time.zone.now - 2.months, category: Topping.categories[:candy], homemade: true, course: Topping.courses[:app])
add_on.toppings.create!(name: 'Chocolate Chips', release_month:  Time.zone.now + 1.month, category: Topping.categories[:sweet], homemade: true, course: Topping.courses[:dessert])
add_on2.toppings.create!(name: 'Bacon Bits', release_month: Time.zone.now - 1.month, category: Topping.categories[:savory], homemade: false, course: Topping.courses[:app])
add_on2.toppings.create!(name: 'Dried Cranberries', release_month: Time.zone.now, category: Topping.categories[:fruity], homemade: true, course: Topping.courses[:app])
add_on2.toppings.create!(name: 'Oreos', release_month: Time.zone.now + 10.months, category: Topping.categories[:sweet], homemade: false, course: Topping.courses[:main])
add_on2.toppings.create!(name: 'Potato Chips', release_month: Time.zone.now + 1.week, category: Topping.categories[:savory], homemade: true, course: Topping.courses[:dessert])

## Create ice creams
IceCream.create!(name: 'Vanilla', release_start: Time.zone.now - 1.month, release_end: Time.zone.now + 1.month, categories: ['candy', 'fruity'], servings: 0, course: IceCream.courses[:app])
IceCream.create!(name: 'Chocolate', release_start: Time.zone.now - 4.months, release_end: Time.zone.now - 2.months, categories: ['savory', 'candy'], servings: 40, course: IceCream.courses[:main])
IceCream.create!(name: 'Cookie Dough', release_start: Time.zone.now + 2.months, release_end: Time.zone.now + 5.months, categories: ['sweet', 'savory', 'candy'], servings: 525, course: IceCream.courses[:app])
IceCream.create!(name: 'Pistachio', release_start: Time.zone.now - 10.months, release_end: Time.zone.now + 10.months, categories: ['fruity'], servings: 5, course: IceCream.courses[:dessert])

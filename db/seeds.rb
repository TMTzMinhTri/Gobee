# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = ['Espresso đá', 'Espresso sữa đã', 'Capuchino', 'Americano', 'Esspresso sữa tươi']

products.each do |x|
    Product.create({name: x, price: 15000})
end

Customer.create({name: "Tri", point: 10, gender: true, phone: "1234567890"})
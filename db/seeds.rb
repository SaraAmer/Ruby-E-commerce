# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Category.create!(id:3 ,name: 'electronics') if Rails.env.development?

# Category.create!(id: 4,name: 'toys') if Rails.env.development?
# Brand.create!(id: 3,name: 'samsung') if Rails.env.development?
# Brand.create!(id: 4,name: 'lego') if Rails.env.development?

   
# 1.times do |i|
#     mob = Product.new(
#       name: 'mob',
#       store_id: 1,
#       category_id: 3,
#       brand_id: 1,
#       price: 11.99,
#       rate:5,
#       quantity:8,
#     )
#     lcd = Product.new(
#       name: 'lcd',
#       store_id:  1,
#       price: 7.95,
#       category_id: 3,
#       brand_id: 1,
#       rate:5,
#       quantity:8,
#     )
#     girltoy = Product.new(
#       name: 'girltoy',
#       store_id:  1,
#        price: 3.00,
#        category_id: 4,
#        brand_id: 2,
#        rate:5,
#        quantity:8,
#     )

#     mob.save
#     lcd.save
#     girltoy.save
#   end
  
  
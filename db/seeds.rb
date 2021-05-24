This file should contain all the record creation needed to seed the database with its default values.
The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Examples:

  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Category.create!(id:3 ,name: 'electronics') if Rails.env.development?

# Category.create!(id: 4,name: 'toys') if Rails.env.development?
# Brand.create!(id: 3,name: 'samsung') if Rails.env.development?
# Brand.create!(id: 4,name: 'lego') if Rails.env.development?

   
  
  
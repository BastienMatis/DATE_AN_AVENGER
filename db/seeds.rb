# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Booking.destroy_all
Avenger.destroy_all
puts 'seed the user owner with owner@test.com and password 123456 '
user = User.create(email: "owner@test.com", password: "123456")
puts 'seeding 10 Avengers...'
10.times do
  avenger = Avenger.new(
  name: Faker::Superhero.name,
  description: Faker::Superhero.descriptor,
  price: Faker::Commerce.price(range: 100..300.0, as_string: true),
  user_id: user.id
  )
  avenger.save!
end
puts 'seeding complete'
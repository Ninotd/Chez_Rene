# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
Gun.destroy_all

puts "Creating 10 fake users"
count = 0
5.times do
  names = ["robert@chasse.com", "rené@chasse.com", "michel@chasse.com", "jeannot@chasse.com", "jacquie@chasse.com"]
  user = User.new(
    email: names[count],
    password: "hexagon"
  )
  count += 1
  user.save
end

puts "Creating 15 fake guns"
15.times do
  url = "https://source.unsplash.com/500x400/?gun"
  armes = ["Fusils de chasse", "Fusils à pompe", "Carabines", "Pistolets", "Armes blanches", "Fusils d'assault"]
  gun = Gun.new(
    name: Faker::FunnyName.name,
    category: armes[rand(armes.length)],
    price: rand(30..200),
    user: User.all.sample,
    )
  gun.remote_photo_url = url
  gun.save!
end

puts "Seed is done"

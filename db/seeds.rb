# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

puts "Cleaning Database"
Offer.destroy_all
Listing.destroy_all
User.destroy_all


puts "Creating Users"
User.create(
  first_name: "Steve",
  last_name: "Skiiman",
  location: "London",
  email: "ski@email.com",
  password: "password"
)

User.create(
  first_name: "Adam",
  last_name: "Priestman",
  location: "London",
  email: "adampriestman@gmail.com",
  password: "password"
)

puts "Creating Listings"

file = URI.open("https://d1nymbkeomeoqg.cloudfront.net/photos/25/98/381317_2182_XXL.jpg")

item1 = Listing.new(
  name: "Red ski goggles",
  price_per_day: "10",
  equipment_type: "goggles",
  user: User.first
)
item1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
item1.save!

file = URI.open("https://d1nymbkeomeoqg.cloudfront.net/photos/25/98/381317_2182_XXL.jpg")

item2 = Listing.new(
  name: "Blue snowboard",
  price_per_day: "20",
  equipment_type: "snowboard",
  user: User.first
)
item2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
item2.save!

file = URI.open("https://d1nymbkeomeoqg.cloudfront.net/photos/25/98/381317_2182_XXL.jpg")

item3 = Listing.new(
  name: "Green ski poles",
  price_per_day: "10",
  equipment_type: "poles",
  user: User.first
)
item3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
item3.save!

file = URI.open("https://d1nymbkeomeoqg.cloudfront.net/photos/25/98/381317_2182_XXL.jpg")

item4 = Listing.new(
  name: "Purple pair of skis",
  price_per_day: "30",
  equipment_type: "skis",
  user: User.first
)
item4.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
item4.save!

file = URI.open("https://d1nymbkeomeoqg.cloudfront.net/photos/25/98/381317_2182_XXL.jpg")

item5 = Listing.new(
  name: "Black helmet",
  price_per_day: "8",
  equipment_type: "helmet",
  user: User.first
)
item5.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
item5.save!

file = URI.open("https://d1nymbkeomeoqg.cloudfront.net/photos/25/98/381317_2182_XXL.jpg")

item6 = Listing.new(
  name: "White gloves",
  price_per_day: "5",
  equipment_type: "gloves",
  user: User.first
)
item6.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
item6.save!

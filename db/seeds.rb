# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning Database"
Offer.destroy_all
Listing.destroy_all
User.destroy_all


puts "Creating User"
User.create(
  first_name: "Adam",
  last_name: "Priestman",
  location: "London",
  email: "adam@email.com",
  password: "password"
)

puts "Creating Listings"
Listing.create(
  name: "Red ski goggles",
  price_per_day: "10",
  equipment_type: "goggles",
  user: User.first
)

Listing.create(
  name: "Blue snowboard",
  price_per_day: "20",
  equipment_type: "snowboard",
  user: User.first
)

Listing.create(
  name: "Green ski poles",
  price_per_day: "10",
  equipment_type: "poles",
  user: User.first
)

Listing.create(
  name: "Purple pair of skis",
  price_per_day: "30",
  equipment_type: "skis",
  user: User.first
)

Listing.create(
  name: "Black helmet",
  price_per_day: "8",
  equipment_type: "helmet",
  user: User.first
)

Listing.create(
  name: "White gloves",
  price_per_day: "5",
  equipment_type: "gloves",
  user: User.first
)

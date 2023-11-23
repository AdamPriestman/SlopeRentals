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
puts "All offers destroyed"
Listing.destroy_all
puts "All listings detroyed"
User.destroy_all
puts "Users crushed, killed, destroyed"
puts "______"
puts "______"
puts "______"

puts "Creating Users"
puts "______"
puts "______"
puts "______"

file = URI.open("https://static.vecteezy.com/system/resources/thumbnails/005/544/770/small/profile-icon-design-free-vector.jpg")

user1 = User.new(
  first_name: "Steve",
  last_name: "Skiiman",
  location: "London",
  email: "ski@email.com",
  password: "password"
)
user1.photo.attach(io: file, filename: "pfp1.png", content_type: "image/png")
user1.save!

file = URI.open("https://static.vecteezy.com/system/resources/thumbnails/005/544/770/small/profile-icon-design-free-vector.jpg")

user2 = User.new(
  first_name: "Adam",
  last_name: "Priestman",
  location: "London",
  email: "adampriestman@gmail.com",
  password: "password"
)
user2.photo.attach(io: file, filename: "pfp2.png", content_type: "image/png")
user2.save!

file = URI.open("https://static.vecteezy.com/system/resources/thumbnails/005/544/770/small/profile-icon-design-free-vector.jpg")

user3 = User.new(
  first_name: "Kata",
  last_name: "Nagy",
  location: "Budapest",
  email: "kata@gmail.com",
  password: "password"
)
user3.photo.attach(io: file, filename: "pfp3.png", content_type: "image/png")
user3.save!

puts "Creating Listings"

file = URI.open("https://d1nymbkeomeoqg.cloudfront.net/photos/25/98/381317_2182_XXL.jpg")

item1 = Listing.new(
  name: "Red ski goggles",
  price_per_day: "10",
  equipment_type: "goggles",
  size: 5,
  gender: "mens",
  condition: "brand new",
  brand: "mountain warehouse",
  description: "A brand-new, unused, unworn and undamaged item in the original packaging (such as the original box or bag) and/or with the original tags attached.",
  user: User.first
)
item1.photos.attach(io: file, filename: "item1.png", content_type: "image/png")
item1.save!

file = URI.open("https://cdn.outsideonline.com/wp-content/uploads/2019/10/07/best-snowboards-1-2020_h.jpg")

item2 = Listing.new(
  name: "Black and Brown Snowboard",
  price_per_day: "20",
  equipment_type: "snowboard",
  size: 155,
  gender: "unisex",
  condition: "used",
  brand: "burton",
  description: "Good condition but has some scratches as you can see in the photos. Missing 2 of the binding bolts but you can get a new set for less than £10. Good bit of kit for a beginner!",
  user: User.first
)
item2.photos.attach(io: file, filename: "item2.png", content_type: "image/png")
item2.save!

file = URI.open("https://cdn.outsideonline.com/wp-content/uploads/2018/03/15/foldable-poles-shorter-skurka_h.jpg")

item3 = Listing.new(
  name: "Collapsible ski poles",
  price_per_day: "10",
  equipment_type: "poles",
  size: 105,
  gender: "unisex",
  condition: "used",
  brand: "saloman",
  description: "Ideal for sporting enthusiasts who enjoy skiing, these poles are a great addition to any skiing equipment collection. They are well-suited for use in the winter months and will provide you with the necessary support and stability you need during your skiing adventures. Don't miss out on this opportunity to own this quality piece of skiing equipment.",
  user: User.first
)
item3.photos.attach(io: file, filename: "item3.png", content_type: "image/png")
item3.save!

file = URI.open("https://cdn.skimag.com/wp-content/uploads/2023/08/4frnt-msp-cc_h.jpg")

item4 = Listing.new(
  name: "Purple pair of skis",
  price_per_day: "30",
  equipment_type: "skis",
  size: 154,
  gender: "Womens",
  condition: " Brand new",
  brand: "VOLKL",
  description: "A brilliant mini ski for all adult skiers of variable levels and abilities, from beginners to advanced skiers. We have used this length of ski for many years to blast all over the mountain including steep reds and even the odd black run plus snow parks and moguls. Its short turning radius of 6.2 metres and twin tip design is simply amazing.",
  user: User.first
)
item4.photos.attach(io: file, filename: "item4.png", content_type: "image/png")
item4.save!

file = URI.open("https://cdn.outsideonline.com/wp-content/uploads/2018/10/08/wbg-19-helmet_h.jpg")

item5 = Listing.new(
  name: "Black helmet",
  price_per_day: "8",
  equipment_type: "helmet",
  size: 5,
  gender: "Mens",
  condition: "used",
  brand: "Atomic",
  description: "All-mountain ski helmet for men and women, size S (53-56 cm), easy and fast adjustment to all head shapes with the rear dial.
  Lightweight (510 g) thanks to the rigid ABS shell. Personalised and comfortable fit thanks to wide band memory foam, padded chinrest.
  Removable and washable integral inner lining. Front ventilation for constant air circulation with breathable material.",
  user: User.first
)
item5.photos.attach(io: file, filename: "item5.png", content_type: "image/png")
item5.save!

file = URI.open("https://cdn.outsideonline.com/wp-content/uploads/2021/02/09/hestra-gloves-jackson_h.jpg")

item6 = Listing.new(
  name: "Brown gloves",
  price_per_day: "5",
  equipment_type: "gloves",
  size: 10,
  gender: "Womens",
  condition: "Used",
  brand: "Hestra",
  description: "Heated Glove Liners,Electric Rechargeable Battery Heated Gloves Mittens Ski/Cycling/hunting Comfortable Thermal Thin Heated Gloves",
  user: User.first
)
item6.photos.attach(io: file, filename: "item6.png", content_type: "image/png")
item6.save!

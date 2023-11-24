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
require 'faker'

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

files = ["https://pbs.twimg.com/profile_images/3673003320/3fc9896829d9022e3cfc7e6bbce57632_200x200.jpeg", "https://m.media-amazon.com/images/M/MV5BOGY1YTkzM2EtMjYyOC00ZGMyLTliNGMtMGU3MjBmYzUyNWVhXkEyXkFqcGdeQXVyMTE0MzQwMjgz._V1_.jpg", "https://static1.purepeople.com.br/people/1/34/71/@/487756--200x200-2.jpg", "https://pbs.twimg.com/profile_images/1279566064674844672/kzdA4Peg_200x200.jpg"]

addresses = ["236 Matthias Road, London", "67 Downs Park Road, London", "55 Rutland Road, London", "305 Hornsey Road, London", "3 Katherine Close, London"]

5.times do |i|
  user_file = URI.open(files[i - 1])
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    location: addresses[i - 1],
    email: "ski#{i}@email.com",
    password: "password"
  )
  user.photo.attach(io: user_file, filename: "pfp1.png", content_type: "image/png")
  user.save!
end

puts "Steve Skiman coming back to life"
steve_file = URI.open("https://www.uncut.at/data/persons/pic/200x200/steve-buscemi.jpg")
steve = User.new(
  first_name: "Steve",
  last_name: "Skiman",
  location: "138 Kingsland Road, London",
  email: "skisteve@email.com",
  password: "password"
)
steve.photo.attach(io: steve_file, filename: "steve.png", content_type: "image/png")
steve.save!
puts "He's back! Wheeeeeeeee"

file = URI.open("https://d1nymbkeomeoqg.cloudfront.net/photos/25/98/381317_2182_XXL.jpg")

puts "Creating Listings"

item1 = Listing.new(
  name: "Red ski goggles",
  price_per_day: "10",
  equipment_type: "Goggles",
  size: 5,
  gender: "mens",
  condition: "Good",
  brand: "mountain warehouse",
  description: "A brand-new, unused, unworn and undamaged item in the original packaging (such as the original box or bag) and/or with the original tags attached.",
  user: User.all.to_a.sample
)
item1.photos.attach(io: file, filename: "item1.png", content_type: "image/png")
item1.save!

file = URI.open("https://cdn.outsideonline.com/wp-content/uploads/2019/10/07/best-snowboards-1-2020_h.jpg")

item2 = Listing.new(
  name: "Black and Brown Snowboard",
  price_per_day: "20",
  equipment_type: "Snowboard",
  size: 155,
  gender: "Unisex",
  condition: "Very good",
  brand: "burton",
  description: "Good condition but has some scratches as you can see in the photos. Missing 2 of the binding bolts but you can get a new set for less than £10. Good bit of kit for a beginner!",
  user: User.all.to_a.sample
)
item2.photos.attach(io: file, filename: "item2.png", content_type: "image/png")
item2.save!

puts "Attaching more photos to Black and Brown Snowboard"
file = URI.open("https://cdn.shopify.com/s/files/1/0634/5844/3506/files/jibbing_oneill_europe_1024x1024.jpg?v=1669975978")

item2.photos.attach(io: file, filename: "item2.png", content_type: "image/png")
item2.save!

file = URI.open("https://i.pinimg.com/736x/ac/48/3a/ac483a6cab791b3f22b50b088d794ba1.jpg")

item2.photos.attach(io: file, filename: "item2.png", content_type: "image/png")
item2.save!

file = URI.open("https://cdn.outsideonline.com/wp-content/uploads/2018/03/15/foldable-poles-shorter-skurka_h.jpg")

item3 = Listing.new(
  name: "Collapsible ski poles",
  price_per_day: "10",
  equipment_type: "Poles",
  size: 105,
  gender: "Unisex",
  condition: "Well worn",
  brand: "Saloman",
  description: "Ideal for sporting enthusiasts who enjoy skiing, these poles are a great addition to any skiing equipment collection. They are well-suited for use in the winter months and will provide you with the necessary support and stability you need during your skiing adventures. Don't miss out on this opportunity to own this quality piece of skiing equipment.",
  user: User.all.to_a.sample
)
item3.photos.attach(io: file, filename: "item3.png", content_type: "image/png")
item3.save!

file = URI.open("https://cdn.skimag.com/wp-content/uploads/2023/08/4frnt-msp-cc_h.jpg")

item4 = Listing.new(
  name: "Purple pair of skis",
  price_per_day: "30",
  equipment_type: "Skis",
  size: 154,
  gender: "Womens",
  condition: "Brand new",
  brand: "VOLKL",
  description: "A brilliant mini ski for all adult skiers of variable levels and abilities, from beginners to advanced skiers. We have used this length of ski for many years to blast all over the mountain including steep reds and even the odd black run plus snow parks and moguls. Its short turning radius of 6.2 metres and twin tip design is simply amazing.",
  user: User.all.to_a.sample
)
item4.photos.attach(io: file, filename: "item4.png", content_type: "image/png")
item4.save!

file = URI.open("https://cdn.outsideonline.com/wp-content/uploads/2018/10/08/wbg-19-helmet_h.jpg")

item5 = Listing.new(
  name: "Black helmet",
  price_per_day: "8",
  equipment_type: "Helmet",
  size: 5,
  gender: "Mens",
  condition: "Excellent",
  brand: "Atomic",
  description: "All-mountain ski helmet for men and women, size S (53-56 cm), easy and fast adjustment to all head shapes with the rear dial.
  Lightweight (510 g) thanks to the rigid ABS shell. Personalised and comfortable fit thanks to wide band memory foam, padded chinrest.
  Removable and washable integral inner lining. Front ventilation for constant air circulation with breathable material.",
  user: User.all.to_a.sample
)
item5.photos.attach(io: file, filename: "item5.png", content_type: "image/png")
item5.save!

file = URI.open("https://cdn.outsideonline.com/wp-content/uploads/2021/02/09/hestra-gloves-jackson_h.jpg")

item6 = Listing.new(
  name: "Brown gloves",
  price_per_day: "5",
  equipment_type: "Gloves",
  size: 10,
  gender: "Womens",
  condition: "Very good",
  brand: "Hestra",
  description: "Heated Glove Liners,Electric Rechargeable Battery Heated Gloves Mittens Ski/Cycling/hunting Comfortable Thermal Thin Heated Gloves",
  user: User.all.to_a.sample
)
item6.photos.attach(io: file, filename: "item6.png", content_type: "image/png")
item6.save!

file = URI.open("https://cdn.outsideonline.com/wp-content/uploads/2022/01/ski-boot-fitting_h.jpg")

item7 = Listing.new(
  name: "Green ski boots",
  price_per_day: "20",
  equipment_type: "Boots",
  size: 40,
  gender: "Womens",
  condition: "Good",
  brand: "Nordica",
  description: "Green ski boots, worn but in good condition. Womnes EU size 40, recommended for experienced skiers, holds feet very tightly.",
  user: User.all.to_a.sample
)
item7.photos.attach(io: file, filename: "item7.png", content_type: "image/png")
item7.save!

file = URI.open("https://www.palisadestahoe.com/-/media/widen/palisades-tahoe/stock-photography/winter/shoppingretail/20191114svdemorentalshopeip0079dng.jpg?rev=5b77e9d809784e88911c30ad0a35280c?h=1350&w=2400&hash=193A700643993177C480AD74B30998CD")

item8 = Listing.new(
  name: "Green skis",
  price_per_day: "23",
  equipment_type: "Skis",
  size: 130,
  gender: "Unisex",
  condition: "Very good",
  brand: "Atomic",
  description: "Stand out on the slopes with these sleek, high-performance green skis, perfect for carving through snow with style and agility.",
  user: User.all.to_a.sample
)
item8.photos.attach(io: file, filename: "item8.png", content_type: "image/png")
item8.save!

puts "Creating buyers"
files = ["https://podyssey.imgix.net/website/images/Host%20Headshots/james-acaster.png?w=200&h=200&fit=crop&auto=format", "https://cdns-images.dzcdn.net/images/artist/26efd1089500ff843c26e2d23c0e94c9/200x200.jpg", "https://geneacdn.net/bundles/geneanetgeneastar/images/celebrites/200px/hanks.jpg"]

addresses = ["28 Linscott Road, London", "20B Goulton Road, London", "19 Spears Road, London"]

buyer1_file = URI.open(files[0])
buyer1 = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  location: addresses[0],
  email: "skibuyer1@email.com",
  password: "password"
)
buyer1.photo.attach(io: buyer1_file, filename: "pfp1.png", content_type: "image/png")
buyer1.save!

buyer2_file = URI.open(files[1])
buyer2 = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  location: addresses[1],
  email: "skibuyer2@email.com",
  password: "password"
)
buyer2.photo.attach(io: buyer2_file, filename: "pfp1.png", content_type: "image/png")
buyer2.save!

buyer3_file = URI.open(files[2])
buyer3 = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  location: addresses[2],
  email: "skibuyer3@email.com",
  password: "password"
)
buyer3.photo.attach(io: buyer3_file, filename: "pfp1.png", content_type: "image/png")
buyer3.save!

listings = [item1, item2, item3, item4, item5, item6, item7, item8]

puts "Buyers are renting things now"
3.times do |i|
  offer = Offer.new(
    start_date: "2023-12-1",
    end_date: "2023-12-7"
  )
  offer.user = buyer1
  offer.listing = listings[i]
  offer.save!
end

3.times do |i|
  offer = Offer.new(
    start_date: "2023-12-10",
    end_date: "2023-12-17"
  )
  offer.user = buyer2
  offer.listing = listings[i]
  offer.save!
  puts "-------"
end

3.times do |i|
  offer = Offer.new(
    start_date: "2023-12-20",
    end_date: "2023-12-28"
  )
  offer.user = buyer3
  offer.listing = listings[i]
  offer.save!
  puts "-------"
end

puts "Creating more skis"

files = ["https://actionglow.com/cdn/shop/files/Skis_Lifestyle.jpg?v=1668802932&width=2400", "https://cdn.outsideonline.com/wp-content/uploads/2019/10/07/best-skis-1-2020_h.jpg", "https://uk.factionskis.com/cdn/shop/files/Faction-Skis-2024-MANA-2.jpg?v=1698401559&width=550"]

names = ["Vibrant All-Terrain Skis", "Precision Carving Skis", "Versatile Alpine Ski Set"]

3.times do |i|
  listing_file = URI.open(files[i - 1])
  listing = Listing.new(
    name: names[i - 1],
    price_per_day: (30..40).to_a.sample,
    equipment_type: "Skis",
    size: 130,
    gender: "Unisex",
    condition: "Very good",
    brand: "Skimasters",
    description: "Stand out on the slopes with these sleek, high-performance skis, perfect for carving through snow with style and agility.",
    user: User.all.to_a.sample
  )
  listing.photos.attach(io: listing_file, filename: "item.png", content_type: "image/png")
  listing.save!
  puts "-------"
end

puts "Creating snowboards"

files = ["https://badworkwear.co.uk/cdn/shop/products/bad-shred-carbon-fibre-snowboard-332581.jpg?v=1686715190", "https://images.snowleader.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,w=1630,h=1000/https://images.snowleader.com/media/catalog/category/categorie_boots_de_snowboard_mobile.jpg", "https://contents.mediadecathlon.com/p1725370/k$0b3ac0cc2c1f91527b569138d9a164dc/1920x0/3000pt2033/6000xcr2800/bien_regler_fixation_snow_titre.jpg?format=auto", "https://m.media-amazon.com/images/I/71IJSP7S8WL._AC_UF1000,1000_QL80_.jpg"]

names = ["All-Mountain Snowboard", "Freestyle Snowboard Adventure", "Precision Carving Snowboard", "Versatile Alpine Snowboard"]

4.times do |i|
  listing_file = URI.open(files[i - 1])
  listing = Listing.new(
    name: names[i - 1],
    price_per_day: (20..30).to_a.sample,
    equipment_type: "Snowboard",
    size: 130,
    gender: "Unisex",
    condition: "Excellent",
    brand: "Skimasters",
    description: "Unleash your skills on the slopes with my pre-loved snowboard. Crafted for all-mountain versatility, its experienced design offers the finesse you need for powdery trails and groomed runs. This board, though pre-owned, still delivers top-tier performance, ensuring you conquer the snow with style and control, all at an unbeatable value.",
    user: User.all.to_a.sample
  )
  listing.photos.attach(io: listing_file, filename: "item.png", content_type: "image/png")
  listing.save!
  puts "-------"
end

puts "Creating ski boots"

files = ["https://cdn-magento2-media.head.com/magefan_blog/how-to-choose-ski-boots.jpg", "https://www.intersportrent.com/IIC/Contentseiten/2022-2023-Winter-Bilder/Fischer/image-thumb__30282__ir-2021-img-text/34_race_curv_jpg-300dpi.jpeg", "https://www.snowmagazine.com/images/features/skills/touring-skis-651360-960-720.jpg"]

names = ["Precision-Fit All-Mountain Ski Boots", "Performance Alpine Ski Boots", "Lightweight Backcountry Ski Boots"]

3.times do |i|
  listing_file = URI.open(files[i - 1])
  listing = Listing.new(
    name: names[i - 1],
    price_per_day: (10..30).to_a.sample,
    equipment_type: "Boots",
    size: 130,
    gender: "Unisex",
    condition: "Well worn",
    brand: "Ski&Co",
    description: "Elevate your slope game with these ski boots. Precision-fit for all terrains, they blend comfort and performance, ensuring agility and control on every descent. Dominate the slopes in style!",
    user: User.all.to_a.sample
  )
  listing.photos.attach(io: listing_file, filename: "item.png", content_type: "image/png")
  listing.save!
  puts "-------"
end

puts "Creating ski goggles"

files = ["https://www.tripsavvy.com/thmb/cOS-Xm2X11jTRqPVr077SeeFl_g=/1000x1000/filters:no_upscale():max_bytes(150000):strip_icc()/Oakley_FlightDeckGoggles_HeroHoriz-c16a79a9b91a4cc3bd1034c933926d1b.jpg", "https://m.media-amazon.com/images/I/61TjboxhLyL._AC_UY580_.jpg", "https://images.boardriders.com/globalGrey/roxy-products/all/default/large/erjtg03166_roxy,l_kvj0_frt1.jpg"]

names = ["Advanced Snow Eyewear", "High-Performance Goggle Gear", "Precision Snowfield Eyewear"]

3.times do |i|
  listing_file = URI.open(files[i - 1])
  listing = Listing.new(
    name: names[i - 1],
    price_per_day: (8..15).to_a.sample,
    equipment_type: "Goggles",
    size: 50,
    gender: "Mens",
    condition: "Good",
    brand: "SkiStuff",
    description:
    "Enhance your slope time! Renting out my trusted, pre-owned ski goggles. Reliable clarity, comfy fit, and style for your adventure. Enjoy sharp vision without breaking the bank!",
    user: User.all.to_a.sample
  )
  listing.photos.attach(io: listing_file, filename: "item.png", content_type: "image/png")
  listing.save!
  puts "-------"
end

puts "Creating helmets"

files = ["https://images.boardriders.com/globalGrey/roxy-products/all/default/large/erjtl03056_roxy,l_kvj0_frt1.jpg", "https://www.littleskiers.co.uk/media/catalog/product/cache/27db811ad6dfca2ea3fbd18c86603326/c/o/coolcasc_iguana_2_1000_x_1000.jpg", "https://www.smithoptics.com/dw/image/v2/BDPZ_PRD/on/demandware.static/-/Sites-smith-master-catalog/default/dw2c384f27/images/product-images/level-helmet/matteSlate/matteSlate_ls02.png?sw=700&sh=700&sm=fit"]

names = ["Advanced Safety Ski Helmet", "High-Performance Snow Helmet", "Premium Alpine Ski Headgear"]

3.times do |i|
  listing_file = URI.open(files[i - 1])
  listing = Listing.new(
    name: names[i - 1],
    price_per_day: (11..15).to_a.sample,
    equipment_type: "Helmet",
    size: 100,
    gender: "Unisex",
    condition: "Very Good",
    brand: "ProtectiveGear",
    description: "Rent the ultimate safety companion for your ski adventure! Offering top-notch protection and comfort, these quality ski helmets ensure a safe and stylish ride down the slopes. Enjoy premium headgear without the commitment!",
    user: User.all.to_a.sample
  )
  listing.photos.attach(io: listing_file, filename: "item.png", content_type: "image/png")
  listing.save!
  puts "-------"
end

puts "Creating gloves"

files = ["https://www.switchbacktravel.com/sites/default/files/articles%20/Hestra%20Heli%20ski%20gloves%20%28gripping%20ski%20pole%29%20%28m%29.jpg", "https://img.hatshopping.co.uk/Basic-Kids-Ski-Gloves-by-Barts-fuchsia.42657_rf84.jpg", "https://content.dare2b.com/DMG344_800/750/DMG344_800_02_bynder_defined_type_product_021690951256.jpg"]
names = ["Ecxellent alpine gloves", "Pink gloves", "Nice, but worn snow gloves"]

3.times do |i|
  listing_file = URI.open(files[i - 1])
  listing = Listing.new(
    name: names[i - 1],
    price_per_day: (11..15).to_a.sample,
    equipment_type: "Gloves",
    size: 90,
    gender: "Unisex",
    condition: "Good",
    brand: "WinterHandfashion",
    description: "Experience warmth and durability on the slopes with my reliable ski gloves. Tried, tested, and ready for adventure, these gloves offer superior insulation and grip, ensuring your hands stay cozy and in control. Rent them for a memorable snow-filled experience!",
    user: User.all.to_a.sample
  )
  listing.photos.attach(io: listing_file, filename: "item.png", content_type: "image/png")
  listing.save!
  puts "-------"
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
	User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.cell_phone_with_country_code, email: Faker::Internet.email, password: '123test')
end

i=0
10.times do
	Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.cell_phone_with_country_code, user_id: i+=1 )
end
category_list = [
  "Cell phone",
  "Tablet",
  "Laptop",
  "Desktop",
  "Peripheral"
]
category_list.each do |category|
   Category.create!( description: category )
end

brand_list = [
  "Apple",
  "Asus",
  "Lenovo",
  "Xiaomi",
  "Huawei"
]

brand_list.each do |brand|
   Brand.create!( description: brand, category_id: 1 )
end

apple_list = [
	"iPhone",
	"iPhone 3G",
	"iPhone 3GS",
	"iPhone 4",
	"iPhone 4S",
	"iPhone 5",
	"iPhone 5c",
	"iPhone 5s",
	"iPhone 6",
	"iPhone 6 Plus",
	"iPhone 6s",
	"iPhone 6s Plus",
	"iPhone SE",
	"iPhone 7",
	"iPhone 7 Plus",
	"iPhone 8",
	"iPhone 8 Plus",
	"iPhone X",
	"iPhone XR",
	"iPhone XS",
	"iPhone XS Max"
]

apple_list.each do |a|
  Model.create!( description: a, brand_id: 1 )
end

10.times do
	Device.create!(category_id: 1, brand_id: 1, model_id: rand(1..21), serial_num: Faker::Device.serial, imei: rand(111111111111111..999999999999999))
end

operation_list = [
	[ "Touch screen replacment", 150 ],
	[ "LCD replacment", 250 ],
	[ "LCD + touch screen replacment", 380 ],
	[ "Battery replacment external", 50 ],
	[ "Battery replacment internal", 320 ],
	[ "Change USB charge board", 150 ],
	[ "microUSB change", 280 ]
]

operation_list.each do |desc, price|
  Operation.create!( description: desc, price: price, category_id: 1 )
end

disrepare_list = [
	"Broken touchscreen",
	"Broken LCD",
	"Doesn't charge",
	"Change battery",
	"Doesn't power on",
	"Microphone's not working",
	"Buzzer is not working",
	"Speaker is not working",
	"Doesn't see SIM card"
]
disrepare_list.each do |desc|
  Disrepare.create!( description: desc, category_id: 1 )
end

i=1
3.times do
	Collaborator.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, nickname:Faker::Name.name, user_id: i+=1)
end

	Ticket.create!( customer_id: 1, device_id: rand(1..10) )

parts_list = [
	[ "iPhone 5, 5s flat charge ", 10, 1 ],
	[ "iPhone 8 LCD + Touchscreen white", 250, 2 ],
	[ "iPhone X LCD + Touchscreen black", 380, 3 ],
	[ "iPhone 8 battery", 50, 4 ],
	[ "iPhone 5 battery", 20, 2 ],
	[ "MicroUSB P780 ", 5, 1 ],
	[ "microUSB Samsung", 15, 1 ]
]

parts_list.each do |desc, price, quan |
  Part.create!( description: desc, price: price, quantity: quan, ticket_id: 1 )
end

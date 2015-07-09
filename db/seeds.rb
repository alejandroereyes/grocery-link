# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

lookup_link = InformationMachineApi::LookupController.new ENV['client_id'], ENV['client_secret']
all_categories =  lookup_link.lookup_get_categories
all_categories['result'].each do |cat|
  Category.find_or_create_by(name: cat['name'])
end


# state = 'TX'
# cities = ['Austin', 'Round Rock', 'Katy', 'Dallas', 'San Marcos', 'San Antonio', 'Houston', 'Waco', 'Addison', 'Bastrop', 'Cedar Park', 'Bee Cave', 'West Lake', 'Paris']
# ['frozen meal', 'frozen veggies', 'fresh beef', 'fresh finfish', ' fresh shrimp', 'cereal', 'coffee', 'beer',
#  'condiments', 'juice', 'canned goods', 'pasta', 'fresh bread', 'sushi'].each do |cat|
#   Category.create(name: cat)
#  end
#  bool = [true, false]
#  units = ['g', 'lb', 'oz']

# ['Whole Foods Market', 'HEB', 'Randalls'].each do | company |
#   store_count = 1000
#   retailer = Retailer.create(name: company)

#   50.times do
#     user = User.create(name: Faker::Name.name, email: 'user@example.com', password: 'password', password_confirmation: 'password',
#                        client_id: SecureRandom.base64(8), secret_id: SecureRandom.hex(15))

#     RetailerUser.create(retailer_id: retailer.id, user_id: user.id)

#     store_count += 1
#     store = Store.create(store_id: store_count, retailer_id: retailer.id, city: cities.sample,
#                          street: Faker::Address.street_address, state: state, zip: store_count)

#     cat = Category.first(offset: rand(Category.count))
#     item = Item.create(brand: Faker::App.name, name: Faker::Commerce.product_name, category: cat.name, category_id: cat.id
#                        non_gmo: bool.sample, organic: bool.sample, total_servings: Faker::Number.number(1), servings_unit: units.sample)

#     price = Price.create(cost: Faker::Commerce.price)

#     RetailerItemPrice.create(retailer_id: retailer.id, item_id; item.id, price_id: price.id, product_id: store_count)
#   end
# end

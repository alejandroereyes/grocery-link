# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

lookup_link = InformationMachineApi::LookupController.new ENV['IM_CLIENT_ID'], ENV['IM_CLIENT_SECRET']
products_link = InformationMachineApi::ProductsController.new ENV['IM_CLIENT_ID'], ENV['IM_CLIENT_SECRET']

all_categories = lookup_link.lookup_get_categories
all_categories['result'].each do |cat|
  Category.find_or_create_by!(name: cat['name'])
end

state = 'TX'
cities = ['Austin', 'Round Rock', 'Katy', 'Dallas', 'San Marcos', 'San Antonio',
          'Houston','Waco', 'Addison','Bastrop', 'Cedar Park', 'Bee Cave', 'Paris']

bool = [true, false]

names = ["Amy's", 'evol', 'totinos', 'organic valley', 'ice cream', 'tuna', 'beef', 'chicken', 'bread', 'gravy',
         'pasta', 'sauce', 'kombucha', 'coffee', 'tortilla', 'hummus', 'shrimp', 'crab', 'oyster', 'milk',
         'bagel', 'danish', 'chocolate', 'gum', 'cola', 'root beer', 'gerber', 'taco', 'pad thai',
         'sausage', 'spicy', 'mild', 'medium', 'orange', 'strawberry', 'apple', 'chili', 'soup',
         'grape', 'corn', 'goat', 'asiago', 'wine', 'cake', 'ale', 'egg', 'yogurt', 'ghee', 'tomato']

['Whole Foods Market', 'HEB', 'Randalls', 'Trader Joe', 'Sprouts', 'Natural Grocer', 'Target', 'Walmart'].each do |company|
  store_count = 1000
  retailer = Retailer.create(name: company)

  10.times do
    user = User.create(name: Faker::Name.name, email: Faker::Internet.safe_email, password: 'password', password_confirmation: 'password',
                       client_id: SecureRandom.hex(8), secret_id: SecureRandom.hex(32))

    RetailerUser.create(retailer_id: retailer.id, user_id: user.id)
  end

  50.times do
    store_count += 1
     store = Store.create(store_id: store_count, retailer_id: retailer.id, city: cities.sample,
                          street: Faker::Address.street_address, state: state, zip: store_count)
  end
end

names.each do |name|
  items = products_link.products_search_products(name: name, per_page: 50)

  items['result'].each do |item|
    new_item = Item.create(brand: item['brand'], name: item['name'], manufacturer: item['manufacturer'], ingredients: item['ingredients'],
                           description: item['description'], category: item['category'], upc: item['upc'], tags: item['tags'],
                           total_servings: item['servings_per_container'], servings_unit: item['serving_size_unit'], weight: item['weight'])
    cat = Category.find_by(name: new_item.category)
    new_item[:category_id] = cat.id
    new_item.save
  end
end

Item.all.each do |item|
  Retailer.all.each do |retailer|

    RetailerItemPrice.create(retailer_id: retailer.id, item_id: item.id, price: Faker::Commerce.price, product_id: Faker::Number.number(6))
  end
end

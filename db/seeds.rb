# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
state = 'Texas'
cities = ['Austin', 'Round Rock', 'Katy', 'Dallas', 'San Marcos', 'San Antonio', 'Houston', 'Waco', 'Addison', 'Bastrop', 'Cedar Park', 'Bee Cave', 'West Lake', 'Paris']

['Whole Foods Market', 'HEB', 'Randalls'].each do | company |
  store_count = 1000
  retailer = Retailer.create(name: company)

  50.times do
    user = User.create(name: Faker::Name.name, email: 'user@example.com', password: 'password', password_confirmation: 'password',
                       client_id: SecureRandom.base64(8), secret_id: SecureRandom.hex(13))
    store_count += 1
    store = Store.create(store_id: store_count, retailer_id: retailer.id, city: cities.sample,
                         street: Faker::Address.street_address, state: state, zip: store_count)

  end
end

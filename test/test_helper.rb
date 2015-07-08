ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.

@retailer =  Retailer.create(name: Faker::Company.name)
@user = User.create(name: Faker::Name.name, password: 'password', password_confirmation: 'password',
                    email: Faker::Internet.email)
@retailer_user = RetailerUser.create(retailer_id: @retailer.id, user_id: @user.id)
@store = Store.create(store_id: Faker::Number.number(2), retailer_id: @retailer.id)
@item = Item.create(brand: Faker::App.name, name: Faker::Commerce.product_name,
                    total_servings: Faker::Number.number(1), servings_unit: ['g', 'lb', 'oz'].sample,
                    category: Faker::Lorem.word)
@price = Price.create(cost: Faker::Commerce.price)
@retailer_item_price = RetailerItemPrice.create(retailer_id: @retailer.id, item_id: @item.id,
                                                price_id: @price.id, on_sale: [true, false].sample,
                                                sale_price: Faker::Commerce.price)

  # Add more helper methods to be used by all tests here...
end

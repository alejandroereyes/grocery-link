require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  setup do
    @retailer  = Retailer.create(name: Faker::Company.name)
    @user = User.create(email: Faker::Internet.email, password: 'password', admin: true, name: Faker::Name.name)
    Category.create(name: 'Sauces, Gravies & Marinades')
    category = Category.create(name: 'Candy')
    @item = Item.create(brand: Faker::App.name, name: Faker::Commerce.product_name, manufacturer: Faker::Company.name, ingredients: Faker::Lorem.sentence,
                        description: Faker::Lorem.sentence, category: category.name, category_id: category.id, upc: Faker::Number.number(8), tags: Faker::Lorem.words(3),
                        total_servings: Faker::Number.number(1), servings_unit: ['g', 'lb', 'oz'].sample, weight: Faker::Number.number(1), price: Faker::Commerce.price)
    link = RetailerUser.create(retailer_id: @retailer.id, user_id: @user.id)
    RetailerItemPrice.create(retailer_id: @retailer.id, item_id: @item.id, price: Faker::Commerce.price)
  end

  test "find all the retailers" do
    actual = @item.find_all_retailers
    expected = [{id: @retailer.id, name: @retailer.name}]
    assert_equal expected, actual
  end
end


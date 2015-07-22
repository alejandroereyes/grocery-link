require 'test_helper'

class Api::ProductsControllerTest < ActionController::TestCase

  setup do
    retailer  = Retailer.create(name: Faker::Company.name)
    @user = User.create(email: Faker::Internet.email, password: 'password', admin: true, name: Faker::Name.name)
    link = RetailerUser.create(retailer_id: retailer.id, user_id: @user.id)
    category = Category.create(name: ['fish', 'beef', 'frozen'].sample)
    @item = Item.create(brand: Faker::App.name, name: Faker::Commerce.product_name, manufacturer: Faker::Company.name, ingredients: Faker::Lorem.sentence,
                        description: Faker::Lorem.sentence, category: category.name, category_id: category.id, upc: Faker::Number.number(8), tags: Faker::Lorem.words(3),
                        total_servings: Faker::Number.number(1), servings_unit: ['g', 'lb', 'oz'].sample, weight: Faker::Number.number(1), price: Faker::Commerce.price)
    @client_id = @user.client_id
    @secret_id = @user.secret_id
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.env["HTTP_REFERER"]   = 'http://localhost:3000/'
  end

  test "should get products by name" do
    get :products_by_name, name: ''
    assert_response :unauthorized
  end

  test "should get product by id" do
    get :product_by_id, id: ''
    assert_response :unauthorized
  end
end

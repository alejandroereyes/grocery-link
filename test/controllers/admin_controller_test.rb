require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    names = ['Whole Foods Market', 'HEB', 'Randalls', 'Trader Joe', 'Sprouts', 'Natural Grocer', 'Target', 'Walmart']
    @retailer = Retailer.create(name: names.sample)
    @store = Store.create(store_id: Faker::Number.number(4), retailer_id: @retailer.id, street: Faker::Address.street_name, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Number.number(5))
    @user = User.create(email: Faker::Internet.email, password: 'foobar', admin: true, name: 'foobey')
    link = RetailerUser.create(retailer_id: @retailer.id, user_id: @user.id)
    category = Category.create(name: ['fish', 'beef', 'frozen'].sample)
    @item = Item.create(brand: Faker::App.name, name: Faker::Commerce.product_name, manufacturer: Faker::Company.name, ingredients: Faker::Lorem.sentence,
                        description: Faker::Lorem.sentence, category: category.name, category_id: category.id, upc: Faker::Number.number(8), tags: Faker::Lorem.words(3),
                        total_servings: Faker::Number.number(1), servings_unit: ['g', 'lb', 'oz'].sample, weight: Faker::Number.number(1), price: Faker::Commerce.price)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.env["HTTP_REFERER"]   = 'http://localhost:3000/'
    @controller.stubs(:current_user).returns(@user)
    @controller.stubs(:current_retailer).returns([@retailer])
    @controller.stubs(:current_stores).returns([@store])
    sign_in @user
  end

  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end
end

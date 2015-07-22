require 'test_helper'

class RetailersControllerTest < ActionController::TestCase
  setup do
    @retailer = Retailer.create(name: "Whole Foods Market")
    @user = User.create(email: 'user@example.com', password: 'password', password_confirmation: 'password', admin: true, name: 'foobey')
    @link = RetailerUser.create(retailer_id: @retailer.id, user_id: @user.id)
    @store = Store.create(store_id: Faker::Number.number(4), retailer_id: @retailer.id, street: Faker::Address.street_name, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Number.number(5))
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.env["HTTP_REFERER"]   = 'http://localhost:3000/'
    @controller.stubs(:current_user).returns(@user)
    @controller.stubs(:current_retailer).returns([@retailer])
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:retailers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "link exists" do
    assert_equal @link, RetailerUser.first
  end

  test "should get user" do
    assert_equal @user, @retailer.users.first
  end

  test "should get store" do
    assert_equal @store, @retailer.stores.first
  end

  test "should create retailer" do
    assert_difference('Retailer.count') do
      post :create, retailer: { name: @retailer.name }
    end

    assert_redirected_to retailer_path(assigns(:retailer))
  end

  test "should show retailer" do
    get :show, id: @retailer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @retailer
    assert_response :success
  end

  test "should update retailer" do
    patch :update, id: @retailer, retailer: { name: @retailer.name }
    assert_redirected_to retailer_path(assigns(:retailer))
  end

  test "should destroy retailer" do
    assert_difference('Retailer.count', -1) do
      delete :destroy, id: @retailer
    end

    assert_redirected_to retailers_path
  end
end

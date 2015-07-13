require 'test_helper'

# class StoreControllerTest < ActionController::TestCase

#   setup do
#     state = 'TX'
#     cities = ['Austin', 'Round Rock', 'Katy', 'Dallas', 'San Marcos', 'San Antonio', 'Houston', 'Waco', 'Addison', 'Bastrop', 'Cedar Park', 'Bee Cave', 'West Lake', 'Paris']
#     retailer = ['Whole Foods Market', 'HEB', 'Randalls', 'Trader Joe', 'Sprouts', 'Natural Grocer', 'Target', 'Walmart'].sample
#     @retailer = Retailer.create(name: retailer)
#     @store = Store.create(store_id: (1000..2000).to_a.sample, retailer_id: @retailer.id, city: cities.sample,
#                           street: Faker::Address.street_address, state: state, zip: (30000..40000).to_a.sample)
#     @user = User.create(email: Faker::Internet.email, password: 'password', admin: true, name: Faker::Name.name)
#     link = RetailerUser.create(retailer_id: @retailer.id, user_id: @user.id)
#     @request.env["devise.mapping"] = Devise.mappings[:user]
#     @request.env["HTTP_REFERER"]   = 'http://localhost:3000/'
#     @controller.stubs(:current_user).returns(@user)
#     @controller.stubs(:current_retailer).returns([@retailer])
#     sign_in @user
#   end

#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:stores)
#   end

#   test "should get new" do
#     get :new
#     assert_response :success
#   end

#   test "should create store" do
#     assert_difference('Store.count') do
#       post :create, store: { store_id: @store.store_id, retailer_id: @store.retailer_id, street: @store.street,
#                              city: @store.city, state: @store.state, zip: @store.zip }
#     end

#     assert_redirected_to store_path(assigns(:store))
#   end

#   test "should show store" do
#     get :show, id: @store
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @store
#     assert_response :success
#   end

#   test "should update store" do
#     patch :update, id: @store, store: { store_id: @store.store_id, retailer_id: @store.retailer_id, street: @store.street,
#                                         city: @store.city, state: @store.state, zip: @store.zip }
#     assert_redirected_to store_path(assigns(:store))
#   end

#   test "should destroy store" do
#     assert_difference('Store.count', -1) do
#       delete :destroy, id: @store
#     end

#     assert_redirected_to stores_path
#   end
# end

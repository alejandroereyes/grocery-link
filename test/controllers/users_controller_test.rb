require 'test_helper'

# class UsersControllerTest < ActionController::TestCase
#   setup do
#     @user = User.create(name: Faker::Name.name, password: 'password', password_confirmation: 'password',
#                       email: Faker::Internet.email)
#   end

#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:users)
#   end

#   test "should get new" do
#     get :new
#     assert_response :success
#   end

#   test "should create user" do
#     assert_difference('User.count') do
#       post :create, user: { name: Faker::Name.name, password: 'password', password_confirmation: 'password',
#                       email: Faker::Internet.email }
#     end

#     assert_redirected_to user_path(assigns(:user))
#   end

#   test "should show user" do
#     get :show, id: @user
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @user
#     assert_response :success
#   end

#   test "should update user" do
#     patch :update, id: @user, user: { name: Faker::Name.name, password: 'password', password_confirmation: 'password',
#                       email: Faker::Internet.email }
#     assert_redirected_to user_path(assigns(:user))
#   end

#   test "should destroy user" do
#     assert_difference('User.count', -1) do
#       delete :destroy, id: @user
#     end

#     assert_redirected_to users_path
#   end
# end

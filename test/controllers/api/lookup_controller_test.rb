require 'test_helper'

class Api::LookupControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = User.create(email: Faker::Internet.email, password: 'password', admin: true, name: Faker::Name.name)
    @client_id = @user.client_id
    @secret_id = @user.secret_id
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.env["HTTP_REFERER"]   = 'http://localhost:3000/'
    @controller.stubs(:verify_client).returns(true)
  end

  test "should get categories" do
    get :categories
    assert_response :success
  end

  test "should get retailers" do
    get :retailers
    assert_response :success
  end
end

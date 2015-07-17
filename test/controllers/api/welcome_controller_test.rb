require 'test_helper'

class Api::WelcomeControllerTest < ActionController::TestCase

  setup do
    @user = User.create(email: Faker::Internet.email, password: 'password', admin: false, name: Faker::Name.name)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.env["HTTP_REFERER"]   = 'http://localhost:3000/'
    @controller.stubs(:user_is_admin?).returns(false)
    @controller.stubs(:current_user).returns(@user)
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get docs" do
    get :docs
    assert_response :success
  end
end

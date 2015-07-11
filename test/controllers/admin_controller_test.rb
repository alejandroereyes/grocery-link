require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    names = ['Whole Foods Market', 'HEB', 'Randalls', 'Trader Joe', 'Sprouts', 'Natural Grocer', 'Target', 'Walmart']
    @retailer = Retailer.create(name: names.sample)
    @user = User.create(email: 'user@example.com', password: 'foobar', admin: true, name: 'foobey')
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.env["HTTP_REFERER"]   = 'http://localhost:3000/'
    @controller.stubs(:current_user).returns(@user)
    @controller.stubs(:current_retailer).returns([@retailer])
    sign_in @user
  end

  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end
end

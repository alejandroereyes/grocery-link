require 'test_helper'

class RetailersControllerTest < ActionController::TestCase
  setup do
    names = ['Whole Foods Market', 'HEB', 'Randalls', 'Trader Joe', 'Sprouts', 'Natural Grocer', 'Target', 'Walmart']
    @retailer = Retailer.create(name: names.sample)
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

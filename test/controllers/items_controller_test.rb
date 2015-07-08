require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = Item.create(brand: Faker::App.name, name: Faker::Commerce.product_name,
                    total_servings: Faker::Number.number(1), servings_unit: ['g', 'lb', 'oz'].sample,
                    category: Faker::Lorem.word)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { brand: @item.brand, category: @item.category, category_id: @item.category_id, name: @item.name, non_gmo: @item.non_gmo, organic: @item.organic, servings_unit: @item.servings_unit, total_servings: @item.total_servings, upc: @item.upc }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    patch :update, id: @item, item: { brand: @item.brand, category: @item.category, category_id: @item.category_id, name: @item.name, non_gmo: @item.non_gmo, organic: @item.organic, servings_unit: @item.servings_unit, total_servings: @item.total_servings, upc: @item.upc }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end

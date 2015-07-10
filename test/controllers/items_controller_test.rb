require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    retailer  = Retailer.create(name: 'foobar')
    @user = User.create(email: 'user@example.com', password: 'foobar', admin: true, name: 'foobey')
    link = RetailerUser.create(retailer_id: retailer.id, user_id: @user.id)
    category = Category.create(name: ['fish', 'beef', 'frozen'].sample)
    @item = Item.create(brand: Faker::App.name, name: Faker::Commerce.product_name, manufacturer: Faker::Company.name, ingredients: Faker::Lorem.sentence,
                        description: Faker::Lorem.sentence, category: category.name, category_id: category.id, upc: Faker::Number.number(8), tags: Faker::Lorem.words(3),
                        total_servings: Faker::Number.number(1), servings_unit: ['g', 'lb', 'oz'].sample, weight: Faker::Number.number(1))
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.env["HTTP_REFERER"]   = 'http://localhost:3000/'
    @controller.stubs(:current_user).returns(@user)
    @controller.stubs(:user_retailer).returns(retailer)
    sign_in @user
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
      post :create, item: { brand: @item.brand, category: @item.category, category_id: @item.category_id, description: @item.description, ingredients: @item.ingredients, manufacturer: @item.manufacturer, name: @item.name, servings_unit: @item.servings_unit, tags: @item.tags, total_servings: @item.total_servings, upc: @item.upc, weight: @item.weight }
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
    patch :update, id: @item, item: { brand: @item.brand, category: @item.category, category_id: @item.category_id, description: @item.description, ingredients: @item.ingredients, manufacturer: @item.manufacturer, name: @item.name, servings_unit: @item.servings_unit, tags: @item.tags, total_servings: @item.total_servings, upc: @item.upc, weight: @item.weight }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end

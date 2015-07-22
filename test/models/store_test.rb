require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  setup do
    @retailer = Retailer.create(name: "HEB")
    @store = Store.create(store_id: Faker::Number.number(4), retailer_id: @retailer.id,
                          street: Faker::Address.street_name, city: Faker::Address.city,
                          state: Faker::Address.state, zip: Faker::Number.number(5))
  end

  test "store exists" do
    assert @store
  end
end

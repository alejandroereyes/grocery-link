json.array!(@stores) do |store|
  json.extract! store, :id, :store_id, :retailer_id, :street, :city, :state, :zip
  json.url store_url(store, format: :json)
end

json.array!(@retailers) do |retailer|
  json.extract! retailer, :id, :name
  json.url retailer_url(retailer, format: :json)
end

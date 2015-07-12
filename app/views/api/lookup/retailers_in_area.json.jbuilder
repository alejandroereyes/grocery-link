json.array! @area_stores.each do |store|
  json.retailer store.retailer.name
  json.store_id store.id
  json.retailer_id store.retailer_id
  json.street store.street
  json.city store.city
  json.state store.state
  json.zip store.zip
end

json.array! @product.retailers do |retailer|
  json.retailer retailer.name
  json.product @product.name
  json.product_id @product.id
  json.price retailer.price_for(@product).price
  json.on_sale retailer.on_sale?(@product)
  json.sale_price retailer.price_for(@product).sale_price
end

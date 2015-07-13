json.array! @products.each do |product|
  json.id product.id
  json.brand product.brand
  json.name product.name
  json.manufacturer product.manufacturer
  json.category product.category
  json.category_id product.category
  json.ingredients product.ingredients
  json.tags product.tags
  json.total_servings product.total_servings
  json.servings_unit product.servings_unit
  json.weight product.weight
  json.upc product.upc
  json.retailers product.find_all_retailers
end

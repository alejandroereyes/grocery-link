json.array!(@items) do |item|
  json.extract! item, :id, :brand, :name, :category, :category_id, :non_gmo, :organic, :total_servings, :servings_unit, :upc
  json.url item_url(item, format: :json)
end

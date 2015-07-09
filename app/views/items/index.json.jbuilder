json.array!(@items) do |item|
  json.extract! item, :id, :brand, :name, :manufacturer, :category, :category_id, :ingredients, :description, :tags, :total_servings, :servings_unit, :weight, :upc
  json.url item_url(item, format: :json)
end

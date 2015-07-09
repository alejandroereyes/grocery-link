json.array!(@users) do |user|
  json.extract! user, :id, :name, :admin, :client_id, :secret_id
  json.url user_url(user, format: :json)
end

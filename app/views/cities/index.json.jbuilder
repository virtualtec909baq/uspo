json.array!(@cities) do |city|
  json.extract! city, :id, :location_id, :cd, :description
  json.url city_url(city, format: :json)
end

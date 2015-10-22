json.array!(@packege_types) do |packege_type|
  json.extract! packege_type, :id, :description
  json.url packege_type_url(packege_type, format: :json)
end

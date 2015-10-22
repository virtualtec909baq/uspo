json.array!(@packeges) do |packege|
  json.extract! packege, :id, :travel_id, :sender_id, :status
  json.url packege_url(packege, format: :json)
end

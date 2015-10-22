json.array!(@travels) do |travel|
  json.extract! travel, :id, :city_id_destination, :city_id_departure, :arrive_time, :departure_time, :img_ticke, :description, :user_id
  json.url travel_url(travel, format: :json)
end

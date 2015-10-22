json.array!(@senders) do |sender|
  json.extract! sender, :id, :city_id_destination, :city_id_departure, :arrive_time, :img, :object_description, :user_id, :packege_type_id, :note
  json.url sender_url(sender, format: :json)
end

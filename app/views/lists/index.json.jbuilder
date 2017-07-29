json.array!(@lists) do |list|
  json.extract! list, :id, :dt, :pressure, :humidity, :speed, :deg, :clouds, :rain
  json.url list_url(list, format: :json)
end

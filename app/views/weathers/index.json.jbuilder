json.array!(@weathers) do |weather|
  json.extract! weather, :id, :main, :description, :icon
  json.url weather_url(weather, format: :json)
end

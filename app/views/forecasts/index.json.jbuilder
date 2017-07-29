json.array!(@forecasts) do |forecast|
  json.extract! forecast, :id, :lat, :lng
  json.url forecast_url(forecast, format: :json)
end

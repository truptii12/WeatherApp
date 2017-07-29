json.array!(@temps) do |temp|
  json.extract! temp, :id, :day, :min, :max, :night, :eve, :morn
  json.url temp_url(temp, format: :json)
end

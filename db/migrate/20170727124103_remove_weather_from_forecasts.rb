class RemoveWeatherFromForecasts < ActiveRecord::Migration
  def change
    remove_column :forecasts, :Weather, :string
  end
end

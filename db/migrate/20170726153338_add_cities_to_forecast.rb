class AddCitiesToForecast < ActiveRecord::Migration
  def change
    add_reference :forecasts, :cities, index: true
    add_foreign_key :forecasts, :cities
  end
end

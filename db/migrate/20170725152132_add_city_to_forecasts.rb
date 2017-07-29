class AddCityToForecasts < ActiveRecord::Migration
  def change
    add_column :forecasts, :city, :string
  end
end

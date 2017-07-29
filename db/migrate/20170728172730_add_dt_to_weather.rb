class AddDtToWeather < ActiveRecord::Migration
  def change
    add_column :weathers, :dt, :string
  end
end

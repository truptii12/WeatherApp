class AddListToForecasts < ActiveRecord::Migration
  def change
    add_reference :forecasts, :list, index: true
    add_foreign_key :forecasts, :lists
  end
end

class AddWeatherToLists < ActiveRecord::Migration
  def change
    add_reference :lists, :weather, index: true
    add_foreign_key :lists, :weathers
  end
end

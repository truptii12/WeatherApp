class AddTempToLists < ActiveRecord::Migration
  def change
    add_reference :lists, :temp, index: true
    add_foreign_key :lists, :temps
  end
end

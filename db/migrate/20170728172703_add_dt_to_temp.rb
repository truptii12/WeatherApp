class AddDtToTemp < ActiveRecord::Migration
  def change
    add_column :temps, :dt, :string
  end
end

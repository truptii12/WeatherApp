class CreateTemps < ActiveRecord::Migration
  def change
    create_table :temps do |t|
      t.decimal :day
      t.decimal :min
      t.decimal :max
      t.decimal :night
      t.decimal :eve
      t.decimal :morn

      t.timestamps null: false
    end
  end
end

class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :dt
      t.decimal :pressure ,  scale => 4
      t.decimal :humidity  , :scale => 2
      t.decimal :speed    ,  :scale => 2
      t.integer :deg        
      t.integer :clouds
      t.decimal :rain     ,  :scale => 2

      t.timestamps null: false
    end
  end
end

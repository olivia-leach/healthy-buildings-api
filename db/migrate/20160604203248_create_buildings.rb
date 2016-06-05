class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.integer :BID
      t.text :name
      t.text :address
      t.text :city
      t.text :state
      t.text :zip
      t.float :lat
      t.float :long
      t.integer :sq_ft
      t.integer :year_const
      t.integer :num_floors
      t.text :notes

      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

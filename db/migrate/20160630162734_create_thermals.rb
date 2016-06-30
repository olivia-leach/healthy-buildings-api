class CreateThermals < ActiveRecord::Migration
  def change
    create_table :thermals do |t|
      t.integer :cat
      t.integer :group
      t.float :temp
      t.float :hum

      t.references :building, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

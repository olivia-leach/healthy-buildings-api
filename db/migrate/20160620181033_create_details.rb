class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :pid
      t.integer :day
      t.date :date
      t.float :co2
      t.float :aer
      t.float :temp
      t.float :rh
      t.float :sh
      t.float :noise
      t.float :pmv
      t.float :ppd

      t.references :building, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

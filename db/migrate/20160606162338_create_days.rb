class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :day
      t.date :date
      t.float :aer_score
      t.float :tc_score
      t.float :humidity_score
      t.float :noise_score
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

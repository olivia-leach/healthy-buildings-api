class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :day
      t.date :date
      t.float :AER_score
      t.float :TC_score
      t.float :humidity_score
      t.float :noise_score
      t.float :co2
      t.float :AER
      t.float :temp
      t.float :RH
      t.float :SH
      t.float :noise
      t.float :PMV
      t.float :PPD

      t.references :building, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.datetime :datetime
      t.float :temp
      t.float :humidity
      t.float :co2
      t.float :noise
      t.float :pressure
      t.float :ppd
      t.float :humidity_score
      t.float :noise_score
      t.float :co2_score
      t.float :tc_score

      t.references :sensor, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

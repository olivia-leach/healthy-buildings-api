class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.float :score
      t.float :value

      t.references :baseline, index: true, foreign_key: true, null: false
      t.references :framework, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

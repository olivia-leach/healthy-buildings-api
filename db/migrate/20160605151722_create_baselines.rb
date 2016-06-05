class CreateBaselines < ActiveRecord::Migration
  def change
    create_table :baselines do |t|
      t.boolean :certified

      t.references :building, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

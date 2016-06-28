class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.text :leedversion
      t.text :rating
      t.text :category
      t.text :credits
      t.text :label
      t.text :obtained

      t.references :building, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

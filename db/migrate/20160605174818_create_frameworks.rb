class CreateFrameworks < ActiveRecord::Migration
  def change
    create_table :frameworks do |t|
      t.text :name
      t.text :cat
      t.text :foundation
      t.text :phase
      t.float :weight

      t.timestamps null: false
    end
  end
end

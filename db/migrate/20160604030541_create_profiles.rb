class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.boolean :admin_rights, default: false

      t.references :user, index: true, foreign_key: true, null: false
      
      t.timestamps null: false
    end
  end
end

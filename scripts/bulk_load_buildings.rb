require 'csv'

CSV.foreach('data/buildings.csv', headers: true) do |building|
  Building.create!(building.to_hash)
end

# class CreateBuildings < ActiveRecord::Migration
#   def change
#     create_table :buildings do |t|
#       t.integer :BID
#       t.text :name
#       t.text :address
#       t.text :city
#       t.text :state
#       t.text :zip
#       t.float :lat
#       t.float :long
#       t.text :type
#       t.integer :num_floors
#       t.float :sq_ft
#
#       t.references :user, index: true, foreign_key: true, null: false
#
#       t.timestamps null: false
#     end
#   end
# end

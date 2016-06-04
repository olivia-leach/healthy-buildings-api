require 'csv'

CSV.foreach('data/buildings.csv', headers: true) do |building|
  Building.create!(building.to_hash)
end

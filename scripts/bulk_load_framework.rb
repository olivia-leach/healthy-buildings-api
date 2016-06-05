require 'csv'

CSV.foreach('data/framework.csv', headers: true) do |framework|
  Framework.create!(framework.to_hash)
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# set up CBRE log in and profile
manager = User.create(email: 'properties@CBRE.com', password: 'CBRE')
Profile.create(admin_rights: false, user_id: manager.id)

# set up SFH log in and profile
# sfh = User.create(email: 'sfh@harvard.edu', password: 'sfh')
# Profile.create(admin_rights: true, user_id: sfh.id)

# load building data from csv and create Buildings
CSV.foreach('data/buildings_cbre.csv', headers: true) do |building|
  hash = building.to_hash
  hash["user_id"] = manager.id
  Building.create!(hash)
end

# load sensors for each building
CSV.foreach('data/sensors.csv', headers: true) do |sensor|
  hash = sensor.to_hash
  result = {
    "PID" => hash["PID"],
    "floor" => hash["Floor"]
  }
  building_key = {}
  manager.buildings.each do |building|
    building_key[building["BID"]] = building["id"]
  end
  build_id = hash["BID"].to_i
  result["building_id"] = building_key[build_id]
  Sensor.create!(result)
end

# load sensor data for each sensor
CSV.foreach('data/sensor_data.csv', headers: true) do |data|
  hash = data.to_hash
  result = {
    "dateTime" => hash["DateTimeR"],
    "temp" => hash["Temp"],
    "humidity" => hash["Humidity"],
    "co2" => hash["CO2"],
    "noise" => hash["Noise"],
    "pressure" => hash["Pressure"],
    "PPD" => hash["PPD"],
    "humidity_score" => hash["Humidity_Score"],
    "noise_score" => hash["Noise_Score"],
    "co2_score" => hash["CO2_Score"],
    "tc_score" => hash["TC_Score"]
  }
  sensor_key = {}
  manager.buildings.each do |building|
    building.sensors.each do |sensor|
      sensor_key[sensor["PID"]] = sensor["id"]
    end
  end
  sens_id = hash["PID"].to_i
  result["sensor_id"] = sensor_key[sens_id]
  DataPoint.create!(result)
end

# load baseline data for each building
CSV.foreach('data/baseline.csv', headers: true) do |baseline|
  hash = baseline.to_hash
  result = {
    "certified" => hash["Certified"]
  }
  building_key = {}
  manager.buildings.each do |building|
    building_key[building["BID"]] = building["id"]
  end
  build_id = hash["BID"].to_i
  result["building_id"] = building_key[build_id]
  Baseline.create!(result)
end

# load framework data
CSV.foreach('data/framework.csv', headers: true) do |framework|
  Framework.create!(framework.to_hash)
end

# load measure data for each baseline
CSV.foreach('data/baseline_measures.csv', headers: true) do |measures|
  hash = measures.to_hash
  result = {
    "score" => hash["score"],
    "framework_id" => hash["framework_id"]
  }
  building_key = {}
  manager.buildings.each do |building|
    building_key[building["BID"]] = building["id"]
  end
  build_id = hash["BID"].to_i
  result["building_id"] = building_key[build_id]
  Measure.create!(result)
end

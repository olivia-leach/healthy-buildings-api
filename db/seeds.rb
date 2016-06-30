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

# load sensor data for each sensor (5-minute data)
CSV.foreach('data/sensor_data.csv', headers: true) do |data|
  hash = data.to_hash
  result = {
    "datetime" => hash["DateTimeR"],
    "temp" => hash["Temp"],
    "humidity" => hash["Humidity"],
    "co2" => hash["CO2"],
    "noise" => hash["Noise"],
    "pressure" => hash["Pressure"],
    "ppd" => hash["PPD"],
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
  Point.create!(result)
end

# load daily sensor data for each building
CSV.foreach('data/sensor_daily_data.csv', headers: true) do |data|
  hash = data.to_hash
  result = {
    "pid" => hash["PID"],
    "day" => hash["day"],
    "date" => hash["date"],
    "co2" => hash["co2"],
    "aer" => hash["aer"],
    "temp" => hash["temp"],
    "rh" => hash["rh"],
    "sh" => hash["sh"],
    "noise" => hash["noise"],
    "pmv" => hash["pmv"],
    "ppd" => hash["ppd"]
  }
  building_key = {}
  manager.buildings.each do |building|
    building_key[building["BID"]] = building["id"]
  end
  build_id = hash["BID"].to_i
  result["building_id"] = building_key[build_id]
  Detail.create!(result)
end

# load certificaiton data for each building
CSV.foreach('data/leed_certifications.csv', headers: true, skip_blanks: true) do |data|
  hash = data.to_hash
  result = {
    "leedversion" => hash["leedversion"],
    "rating" => hash["rating"],
    "category" => hash["category"],
    "credits" => hash["credits"],
    "label" => hash["label"],
    "obtained" => hash["obtained"]
  }
  building_key = {}
  manager.buildings.each do |building|
    building_key[building["BID"]] = building["id"]
  end
  build_id = hash["bid"].to_i
  result["building_id"] = building_key[build_id]
  Certification.create!(result)
end

# load daily data for each building
CSV.foreach('data/summary_data.csv', headers: true) do |day|
  hash = day.to_hash
  result = {
    "day" => hash["day"],
    "date" => hash["date"],
    "enhanced_iaq" => hash["enhanced_iaq"],
    "tc" => hash["tc"],
    "iaq_perf" => hash["iaq_perf"],
    "low_emit_air" => hash["low_emit_air"],
    "iaq_assess" => hash["iaq_assess"],
    "acoustic" => hash["acoustic"],
    "low_emit_dirt" => hash["low_emit_dirt"],
    "green_clean" => hash["green_clean"],
    "ipm" => hash["ipm"],
    "int_lighting" => hash["int_lighting"],
    "daylight" => hash["daylight"],
    "views" => hash["views"],
    "mold" => hash["mold"],
    "ets" => hash["ets"],
    "surveys" => hash["surveys"],
    "baseline" => hash["baseline"],
    "aer_score" => hash["aer_score"],
    "tc_score" => hash["tc_score"],
    "humidity_score" => hash["humidity_score"],
    "noise_score" => hash["noise_score"],
    "rt_score" => hash["rt_score"],
    "overall_score" => hash["overall_score"],
    "co2" => hash["co2"],
    "aer" => hash["aer"],
    "temp" => hash["temp"],
    "rh" => hash["rh"],
    "sh" => hash["sh"],
    "noise" => hash["noise"],
    "pmv" => hash["pmv"],
    "ppd" => hash["ppd"]
  }
  building_key = {}
  manager.buildings.each do |building|
    building_key[building["BID"]] = building["id"]
  end
  build_id = hash["BID"].to_i
  result["building_id"] = building_key[build_id]
  Day.create!(result)
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

# load thermal comfort plotting data
manager.buildings.each do |building|
  CSV.foreach('data/tc_data.csv', headers: true) do |point|
    hash = point.to_hash
    hash['building_id'] = building['id']
    Thermal.create!(hash)
  end
end

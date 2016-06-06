class DataPointSerializer < ActiveModel::Serializer
  attributes :id, :dateTime, :temp, :humidity, :co2, :noise, :pressure, :PPD, :humidity_score, :noise_score, :co2_score, :tc_score
end

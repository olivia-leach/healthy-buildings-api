class PointSerializer < ActiveModel::Serializer
  attributes :id, :datetime, :temp, :humidity, :co2, :noise, :pressure, :ppd, :humidity_score, :noise_score, :co2_score, :tc_score
end

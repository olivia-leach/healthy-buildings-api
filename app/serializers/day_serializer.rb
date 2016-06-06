class DaySerializer < ActiveModel::Serializer
  attributes :id, :day, :date, :AER_score, :TC_score, :humidity_score, :noise_score, :co2, :AER, :temp, :RH, :SH, :noise, :PMV, :PPD
end

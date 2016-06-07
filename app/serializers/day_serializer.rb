class DaySerializer < ActiveModel::Serializer
  attributes :id, :day, :date, :aer_score, :tc_score, :humidity_score, :noise_score, :co2, :aer, :temp, :rh, :sh, :noise, :pmv, :ppd
end

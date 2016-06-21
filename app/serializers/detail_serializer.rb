class DetailSerializer < ActiveModel::Serializer
  attributes :id, :building_id, :pid, :day, :date, :co2, :aer, :temp, :rh, :sh, :noise, :pmv, :ppd
end

class SensorSerializer < ActiveModel::Serializer
  attributes :id, :PID, :floor, :points, :building_id
end

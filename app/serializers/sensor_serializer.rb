class SensorSerializer < ActiveModel::Serializer
  attributes :id, :floor, :points, :building_id
end

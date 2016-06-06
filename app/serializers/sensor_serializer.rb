class SensorSerializer < ActiveModel::Serializer
  attributes :id, :floor, :data_points
end

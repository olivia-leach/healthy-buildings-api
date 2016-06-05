class BaselineSerializer < ActiveModel::Serializer
  attributes :id, :certified, :building_id, :measures
end

class ThermalSerializer < ActiveModel::Serializer
  attributes :id, :cat, :group, :temp, :hum
end

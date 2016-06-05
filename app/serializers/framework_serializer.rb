class FrameworkSerializer < ActiveModel::Serializer
  attributes :id, :name, :cat, :foundation, :phase, :weight
end

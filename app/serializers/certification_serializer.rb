class CertificationSerializer < ActiveModel::Serializer
  attributes :id, :building_id, :leedversion, :rating, :category, :credits, :obtained
end

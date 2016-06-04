class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :admin_rights, :buildings
end

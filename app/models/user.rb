#
class User < ActiveRecord::Base
  include Authentication
  has_one :profile
  has_many :buildings
end

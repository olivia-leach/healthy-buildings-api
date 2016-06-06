class Sensor < ActiveRecord::Base
  belongs_to :building, inverse_of: :sensors
  has_many :points
end

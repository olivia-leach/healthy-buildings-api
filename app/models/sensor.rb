class Sensor < ActiveRecord::Base
  belongs_to :building, inverse_of: :sensors
end

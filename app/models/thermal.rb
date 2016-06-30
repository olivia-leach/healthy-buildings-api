class Thermal < ActiveRecord::Base
  belongs_to :user, inverse_of: :thermals
end

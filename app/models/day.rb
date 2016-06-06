class Day < ActiveRecord::Base
  belongs_to :building, inverse_of: :days
end

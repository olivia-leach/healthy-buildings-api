class Detail < ActiveRecord::Base
  belongs_to :building, inverse_of: :details
end

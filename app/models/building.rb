class Building < ActiveRecord::Base
  belongs_to :user, inverse_of: :buildings

  # has_many :sensors
end

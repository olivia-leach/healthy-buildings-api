class Building < ActiveRecord::Base
  belongs_to :user, inverse_of: :buildings

  has_one :baseline
  has_many :sensors
  has_many :measures
end

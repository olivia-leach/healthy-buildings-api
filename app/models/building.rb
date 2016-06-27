class Building < ActiveRecord::Base
  belongs_to :user, inverse_of: :buildings

  has_one :baseline
  has_many :sensors
  has_many :measures
  has_many :days
  has_many :details
  has_many :certifications
end

class Baseline < ActiveRecord::Base
  belongs_to :building
  has_many :measures
end

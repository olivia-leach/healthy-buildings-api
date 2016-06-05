class Measure < ActiveRecord::Base
  belongs_to :building
  belongs_to :framework
end

class Certification < ActiveRecord::Base
  belongs_to :building, inverse_of: :certifications
end

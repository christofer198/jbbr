class Employer < ApplicationRecord
  has_many :openings
  has_one :sector
end

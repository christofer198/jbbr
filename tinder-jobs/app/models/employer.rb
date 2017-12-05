class Employer < ApplicationRecord
  has_many :openings
  belongs_to :sector
end

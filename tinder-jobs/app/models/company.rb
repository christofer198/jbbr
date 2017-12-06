class Company < ApplicationRecord
  has_many :openings
  belongs_to :sector
end

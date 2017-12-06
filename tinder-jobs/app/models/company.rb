class Company < ApplicationRecord
  validates :name, uniqueness: true
  has_many :openings
  belongs_to :sector
end
